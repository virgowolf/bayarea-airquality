let citiesURL = "incomeCities.geojson";
let emittersURL = "emitters.geojson";

let myMap = L.map("map", {
  center: [37.75, -122.25],
  zoom: 9
});

  // Create the streetmap layer (can't turn this off)
let street = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
});

street.addTo(myMap);

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

function concatPollMonth(poll, month) {
  return (poll + "-" + month)
}

// these are the "schemes" to help build the layers
let mapSchemes = {
  income: {
    geoJsonName: "INCOME",
    separators: [80000, 100000, 120000, 140000, 160000],
    colors: ["#ccffcc", "#80ff80", "#33ff33", "#00e600", "#009900", "#004d00"],
    overlayName: "Median Income, 2020",
    legendTitle: "Annual Income",
    prefix: "$",
    unit: ""
  },
  carbon: {
    geoJsonName: "carbon",
    separators: [.15, .3, .45, .6, .75],
    colors: ["#ccffcc", "#80ff80", "#33ff33", "#00e600", "#009900", "#004d00"], //update
    overlayName: "Carbon Levels", //update
    legendTitle: "Carbon", //update
    prefix: "",
    unit: "" //update
  },
  nitrogen: {
    geoJsonName: "nitrogen",
    separators: [3.5, 7, 10.5, 14, 17.5],
    colors: ["#ccffcc", "#80ff80", "#33ff33", "#00e600", "#009900", "#004d00"], //update
    overlayName: "Nitrogen Levels", //update
    legendTitle: "Nitrogen", //update
    prefix: "",
    unit: "" //update
  },
  ozone: {
    geoJsonName: "ozone",
    separators: [9, 18, 27, 36, 45],
    colors: ["#ccffcc", "#80ff80", "#33ff33", "#00e600", "#009900", "#004d00"], //update
    overlayName: "Ozone Levels", //update
    legendTitle: "Ozone", //update
    prefix: "",
    unit: "ppb?" //update
  },
  PM10: {
    geoJsonName: "pm10",
    separators: [10, 20, 30, 40, 50],
    colors: ["#ccffcc", "#80ff80", "#33ff33", "#00e600", "#009900", "#004d00"], //update
    overlayName: "PM10 Levels", //update
    legendTitle: "PM10", //update
    prefix: "",
    unit: "" //update
  },
  PM25: {
    geoJsonName: "pm25",
    separators: [5, 10, 15, 20, 25],
    colors: ["#ccffcc", "#80ff80", "#33ff33", "#00e600", "#009900", "#004d00"], //update
    overlayName: "PM2.5 Levels", //update
    legendTitle: "PM2.5", //update
    prefix: "",
    unit: "" //update
  },
  emitters: {
    geoJsonName: "CO2e",
    separators: [100000, 250000, 500000, 1000000, 2000000],
    colors: ["#f2f2f2", "#cccccc", "#a6a6a6", "#808080", "#595959", "#333333"],
    overlayName: "Top Polluter Locations",
    legendTitle: "CO2-equivalent",
    prefix: "",
    unit: " metric tons",
    icons: ["static/img/smokeF2F2F2.png", "static/img/smokeCCCCCC.png", "static/img/smokeA6A6A6.png",
      "static/img/smoke808080.png", "static/img/smoke595959.png", "static/img/smoke333333.png"]
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

d3.json(citiesURL).then(function(data) {
  createLayer(data.features, "income");
  // createLayer(data.features, "carbon")
});

d3.json(emittersURL).then(function(data) {
  createMarkers(data.features, "emitters")
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
      layer.bindPopup(
        `<h3>${feature.properties.NAME}</h3>
        <hr>
        <h5>${mapSchemes[param].legendTitle}: 
          ${mapSchemes[param].prefix}
          ${(feature.properties[mapSchemes[param].geoJsonName])}
          ${mapSchemes[param].unit}</h5>`
      );
    }
  });


  // legend (based on leaflet's choropleth page)
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
          color: chooseColor(feature.properties[mapSchemes[param].geoJsonName], param)
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