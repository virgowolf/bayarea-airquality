let incomeURL = "incomeCities.geojson";
let pollURL = "filteredCities.geojson";
let emittersURL = "emitters.geojson";

let myMap = L.map("map", {
  center: [37.75, -122.25],
  zoom: 9
});

  // Create the streetmap layer (this layer will always be on)
let street = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
});

street.addTo(myMap);

// empty control - info added in functions
var myLayersControl = L.control.layers(null, null, {collapsed: false}).addTo(myMap);

let months = ["January", "February", "March", "April", "May", "June",
              "July", "August", "September", "October", "November", "December"];

let monthsConv = {
  January: "01",
  February: "02",
  March: "03",
  April: "04",
  May: "05",
  June: "06",
  July: "07",
  August: "08",
  September: "09",
  October: "10",
  November: "11",
  December: "12"
};

let pollutants = ["Carbon","Nitrogen","Ozone","PM10","PM2.5"];

let pollutantsConv = {
  Carbon: "carbon",
  Nitrogen: "nitrogen",
  Ozone: "ozone",
  PM10: "pm10",
  "PM2.5": "pm25"
}
function concatPollMonth(poll, month) {
  return (poll + "-" + month)
}
// populate dropdowns
var monthSelector = document.getElementById("monthSelector");
var monthOpt = document.createElement("option");
monthOpt.text = "Month";
monthSelector.add(monthOpt);
for (let i=0;i<months.length;i++) {
  monthOpt = document.createElement("option");
  monthOpt.value = monthsConv[months[i]];
  monthOpt.text = months[i];
  monthSelector.add(monthOpt);
};
var pollSelector = document.getElementById("pollutantSelector");
var pollOpt = document.createElement("option");
pollOpt.text = "Pollutant";
pollSelector.add(pollOpt);
for (let j=0;j<pollutants.length;j++) {
  pollOpt = document.createElement("option");
  pollOpt.value = pollutantsConv[pollutants[j]];
  pollOpt.text = pollutants[j];
  pollSelector.add(pollOpt);
};
let pollutionData, incomeData;
// these are the "schemes" to help build the layers
let mapSchemes = {
  income: {
    geoJsonName: "INCOME",
    separators: [80000, 100000, 120000, 140000, 160000],
    colors: ["#ccffcc", "#80ff80", "#33ff33", "#00e600", "#009900", "#004d00"],
    overlayName: "Median Income, 2020",
    legendTitle: "Annual Income",
    prefix: "$",
    unit: "",
    multiplier: 1
  },
  carbon: {
    geoJsonName: "carbon",
    separators: [.15, .3, .45, .6, .75],
    colors: ["#e6ccff", "#bf80ff", "#9933ff", "#7300e6", "#4d0099", "#26004d"],
    overlayName: "Carbon Levels", //update
    legendTitle: "Carbon", //update
    prefix: "",
    unit: " ppm",
    multiplier: 1
  },
  nitrogen: {
    geoJsonName: "nitrogen",
    separators: [3.5, 7, 10.5, 14, 17.5],
    colors: ["#e6ccff", "#bf80ff", "#9933ff", "#7300e6", "#4d0099", "#26004d"],
    overlayName: "Nitrogen Levels", //update
    legendTitle: "Nitrogen", //update
    prefix: "",
    unit: " ppb",
    multiplier: 1
  },
  ozone: {
    geoJsonName: "ozone",
    separators: [6, 12, 18, 24, 30],
    colors: ["#e6ccff", "#bf80ff", "#9933ff", "#7300e6", "#4d0099", "#26004d"],
    overlayName: "Ozone Levels", //update
    legendTitle: "Ozone", //update
    prefix: "",
    unit: " ppb",
    multiplier: 1000
  },
  pm10: {
    geoJsonName: "pm10",
    separators: [10, 20, 30, 40, 50],
    colors: ["#e6ccff", "#bf80ff", "#9933ff", "#7300e6", "#4d0099", "#26004d"],
    overlayName: "PM<sub>10</sub> Levels", //update
    legendTitle: "PM<sub>10</sub>", //update
    prefix: "",
    unit: " &mu;g/m<sup>3</sup>",
    multiplier: 1
  },
  pm25: {
    geoJsonName: "pm25",
    separators: [5, 10, 15, 20, 25],
    colors: ["#e6ccff", "#bf80ff", "#9933ff", "#7300e6", "#4d0099", "#26004d"],
    overlayName: "PM<sub>2.5</sub> Levels", //update
    legendTitle: "PM<sub>2.5</sub>", //update
    prefix: "",
    unit: " &mu;g/m<sup>3</sup>",
    multiplier: 1
  },
  emitters: {
    geoJsonName: "CO2e",
    separators: [100000, 250000, 500000, 1000000, 2000000],
    colors: ["#f2f2f2", "#cccccc", "#a6a6a6", "#808080", "#595959", "#333333"],
    overlayName: "Top Polluter Locations",
    legendTitle: "CO<sub>2</sub>-equivalent",
    prefix: "",
    unit: " metric tons",
    icons: ["static/img/smokeF2F2F2.png", "static/img/smokeCCCCCC.png", "static/img/smokeA6A6A6.png",
      "static/img/smoke808080.png", "static/img/smoke595959.png", "static/img/smoke333333.png"],
    multiplier: 1
  }
};
function chooseColor(num, collection) {
    let locator = mapSchemes[collection];
    let count = 0;
    for (let i=0; i<locator.separators.length; i++) {
      if(num > locator.separators[i])
        count +=1;
    };
    return locator.colors[count]
}

function chooseIcon(num, collection) {
  return num < mapSchemes[collection].separators[0] ? 
               L.icon({iconUrl: mapSchemes[collection].icons[0], 
               iconAnchor: [50,50], popupAnchor: [-25,-25]}):
         num < mapSchemes[collection].separators[1] ? 
               L.icon({iconUrl: mapSchemes[collection].icons[1],
                iconAnchor: [50,50], popupAnchor: [-25,-25]}):
         num < mapSchemes[collection].separators[2] ? 
               L.icon({iconUrl: mapSchemes[collection].icons[2],
                iconAnchor: [50,50], popupAnchor: [-25,-25]}):
         num < mapSchemes[collection].separators[3] ? 
               L.icon({iconUrl: mapSchemes[collection].icons[3],
                iconAnchor: [50,50], popupAnchor: [-25,-25]}):
         num < mapSchemes[collection].separators[4] ?
               L.icon({iconUrl: mapSchemes[collection].icons[4],
                iconAnchor: [50,50], popupAnchor: [-25,-25]}):
               L.icon({iconUrl: mapSchemes[collection].icons[5],
                iconAnchor: [50,50], popupAnchor: [-25,-25]});
}
// Function to create a combined popup
function createCombinedPopup(pollutionData, incomeData) {
  let popupContent = `<h3>${incomeData.city}</h3>
                      <hr>`;

   // Check if income data is available
   if (incomeData) {
    popupContent += `<p>Median Income: $${incomeData.income}</p>`;
  }

 // Check if pollution data is available
  if (pollutionData) {
    popupContent += `<p>${pollutionData.pollutant}: ${pollutionData.value}</p>`;
  }
  return popupContent;
}

var ddMonth = document.getElementById("monthSelector").value;
var ddPollutant = document.getElementById("pollutantSelector").value;

d3.json(incomeURL).then(function(data) {
  createLayer(data.features, "income");
});

d3.json(emittersURL).then(function(data) {
  createMarkers(data.features, "emitters")
});
let currPollLayer;
d3.json(pollURL).then(function(data) {

  document.getElementById("updateButton").addEventListener("click", function() {
    createPollutantLayer(data.features)
  });
});

function createLayer(data, param) {
  let currLayer =  L.geoJSON(data, {
    style: function(feature) {
      return {
        color: "black",
        // Call the chooseColor() function
        fillColor: chooseColor(feature.properties[mapSchemes[param].geoJsonName], param),
        weight: 1,
        fillOpacity: .7
      };
    },
  // This is called on each feature.
    onEachFeature: function(feature, layer) {
      incomeData = {
        city: feature.properties.NAME,
        income: `${feature.properties.INCOME}`
      };
    // Call function to update popup with combined data
    layer.bindPopup(createCombinedPopup(pollutionData, incomeData));
    }

  });
  

  // legend (from leaflet's choropleth page)
  let legend = L.control({position: 'bottomright'})
  legend.onAdd = function (myMap) {
    const div = L.DomUtil.create('div', 'legend');
    const seps = [0].concat(mapSchemes[param].separators);
    const labels = [mapSchemes[param].legendTitle];
    labels.push(`<i style="background:${chooseColor(seps[0] + .1, param)}"></i>
                &lt; ${mapSchemes[param].prefix}${seps[1]}${mapSchemes[param].unit}`);

    let from, to;
    for (let i = 1; i < seps.length; i++) {
      from = seps[i];
      to = seps[i + 1];
      labels.push(`<i style="background:${chooseColor(from + .1, param)}"></i> 
        ${mapSchemes[param].prefix}${from}${to ? `&ndash;
        ${mapSchemes[param].prefix}${to}${mapSchemes[param].unit}` : '+'}`);
      }

      div.innerHTML = labels.join('<br>');
      return div;
  }

  myMap.addLayer(currLayer);
  myLayersControl.addOverlay(currLayer, mapSchemes[param].overlayName);
  legend.addTo(myMap);

  myMap.on("overlayadd", function(eventLayer) {
  if (eventLayer.name == mapSchemes[param].overlayName)
    myMap.addControl(legend);
  })
  myMap.on("overlayremove", function(eventLayer) {
    if (eventLayer.name == mapSchemes[param].overlayName)
      myMap.removeControl(legend);
  })
}

function createMarkers(data, param) {
  let currLayer =  L.geoJSON(data, {
    onEachFeature: function(feature, layer) {
      layer.bindPopup(
        `<h3>${feature.properties.name}</h3>
        <hr>
        <h5>${mapSchemes[param].legendTitle}: 
          ${mapSchemes[param].prefix}
          ${(feature.properties[mapSchemes[param].geoJsonName])}
          ${mapSchemes[param].unit}</h5>`
      )
    },
    pointToLayer: function(feature, latlng){
      var newMarker=L.marker(latlng, {
          icon: chooseIcon(feature.properties[mapSchemes[param].geoJsonName], param),
          color: chooseColor(feature.properties[mapSchemes[param].geoJsonName], param),
          opacity: .8
      });
      return newMarker;
    }
  });


  // legend (from leaflet's choropleth page)
  let legend = L.control({position: 'bottomright'})
  legend.onAdd = function (myMap) {
    const div = L.DomUtil.create('div', 'legend');
    const seps = [0].concat(mapSchemes[param].separators);
    const labels = [mapSchemes[param].legendTitle];
    labels.push(`<i style="background:${chooseColor(seps[0] + 1, param)}"></i>
                &lt; ${mapSchemes[param].prefix}${seps[1]} ${mapSchemes[param].unit}`);
    let from, to;
    for (let i = 1; i < seps.length; i++) {
      from = seps[i];
      to = seps[i + 1];
      labels.push(`<i style="background:${chooseColor(from + 1, param)}"></i> 
                  ${mapSchemes[param].prefix}${from}${to ? `&ndash;
                  ${mapSchemes[param].prefix}${to}` : '+'}${mapSchemes[param].unit}`);
    }
    div.innerHTML = labels.join('<br>');
    return div;
  }

  myMap.addLayer(currLayer);
  myLayersControl.addOverlay(currLayer, mapSchemes[param].overlayName);
  
  legend.addTo(myMap);
  myMap.on("overlayadd", function(eventLayer) {
  if (eventLayer.name == mapSchemes[param].overlayName)
    myMap.addControl(legend);
  })
  myMap.on("overlayremove", function(eventLayer) {
  if (eventLayer.name == mapSchemes[param].overlayName)
    myMap.removeControl(legend);
  })
}


function createPollutantLayer(data) {
  if(currPollLayer) {
    myMap.removeLayer(currPollLayer)
    myLayersControl.removeLayer(currPollLayer);
  };
  ddMonth = document.getElementById("monthSelector").value;
  let monthName = months[parseInt(ddMonth)-1];
  console.log(monthName);
  ddPollutant = document.getElementById("pollutantSelector").value;
  let param = ddPollutant;

  if ((ddMonth != "Month") && (ddPollutant != "Pollutant")) {
    let jsonParam = concatPollMonth(ddPollutant, ddMonth);
    let filteredData = data.filter(function(feature) {
      return !isNaN(feature.properties[jsonParam]);
    });

    let currLayer =  L.geoJSON(filteredData, {
      style: function(feature) {
          return {
            color: "black",
            // Call the chooseColor() function
            fillColor: chooseColor((feature.properties[jsonParam]*mapSchemes[param].multiplier), param),
            weight: 1,
            fillOpacity: .7
        }
      },
      // This is called on each feature.
      onEachFeature: function(feature, layer) {
        pollutionData = {
          city: feature.properties.NAME,
          pollutant: mapSchemes[param].legendTitle,
          value: `${(feature.properties[jsonParam])*mapSchemes[param].multiplier}
               ${mapSchemes[param].unit}`
        };
  // Call function to update popup with combined data
  layer.bindPopup(createCombinedPopup(pollutionData, incomeData));
       
    }
    });


    // legend (based on leaflet's choropleth page)
    let legend = L.control({position: 'bottomright'})
    legend.onAdd = function (myMap) {
      const div = L.DomUtil.create('div', 'legend');
      const seps = [0].concat((mapSchemes[param].separators));
      const labels = [mapSchemes[param].legendTitle];
      labels.push(`<i style="background:${chooseColor(seps[0] + .01, param)}"></i>
                  &lt; ${mapSchemes[param].prefix}${seps[1]}${mapSchemes[param].unit}`);

      let from, to;
      for (let i = 1; i < seps.length; i++) {
        from = seps[i];
        to = seps[i + 1];
        labels.push(`<i style="background:${chooseColor(from + .1, param)}"></i> 
          ${mapSchemes[param].prefix}${from}${to ? `&ndash;
          ${mapSchemes[param].prefix}${to}` : '+'}${mapSchemes[param].unit}`);
        }

        div.innerHTML = labels.join('<br>');
        return div;
    }
      currPollLayer=currLayer;
      myMap.addLayer(currLayer);
      let layerNameString = mapSchemes[param].overlayName + ', ' + monthName;
      myLayersControl.addOverlay(currLayer, layerNameString);
      legend.addTo(myMap);
    
    myMap.on("overlayadd", function(eventLayer) {
    if (eventLayer.name == layerNameString)
      myMap.addControl(legend);
    })
    myMap.on("overlayremove", function(eventLayer) {
      if (eventLayer.name == layerNameString)
        myMap.removeControl(legend);
    })
  }
}

