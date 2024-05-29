// Drop-down for Pollutants
var names = ['carbon', 'nitrogen', 'ozone', 'pm10', 'pm25'];
var dropdown_name = d3.select("#selDataset");

for (i = 0; i < names.length; i++){
  dropdown_name.append('option').text(names[i]);
};


// Drop-down for Dates 
var dates = ['2020-01-01', '2020-02-01', '2020-03-01', '2020-04-01', '2020-05-01', '2020-06-01', '2020-07-01',
'2020-08-01','2020-09-01', '2020-10-01', '2020-11-01', '2020-12-01'];

var dropdown_dates = d3.select("#selData");

for (i = 0; i < dates.length; i++){
  dropdown_dates.append('option').text(dates[i]);
};



// Bar Graph creation based on selected date and pollutant

function optionChanged(){
  const newPollutant = d3.select('#selDataset').property('value');
  const date = d3.select('#selData').property('value');
    if (newPollutant == "carbon"){
      d3.json('./carbon').then(
        function(response) {    
          const trace = {
            x: response.filter(data => data.carbon_month === date).map((data) => data.city),
            y: response.filter(data => data.carbon_month === date).map((data)=>data.carbon_max),
            type: 'bar',
            marker: {
              color: 'rgb(209,94,94)'
            }
          };
          const dataTrace = [trace];
          const layout = {
            title: {
              text: ` <b> Max. Carbon Measurements for Bay Area Cities in the month of ${date} </b>`,
              font: {
                size: 13,
                
              }
            },
            xaxis: {
              title: 'Cities in Bay Area',
              tickangle: 90,
              tickfont: {
                size: 9
              }
            },
            yaxis: {
              title: 'Carbon Maximum Values'
            }
          };
          Plotly.newPlot('bar', dataTrace, layout);
        }
      );
      } else if (newPollutant == "nitrogen"){
        d3.json('./nitrogen').then(
          function(response) {
            const trace = {
              x: response.filter(data => data.nitrogen_month === date).map((data)=>data.city),
              y: response.filter(data => data.nitrogen_month === date).map((data)=>data.nitrogen_max),
              type: 'bar',
              marker: {
                color: 'rgb(51,162,122)'
              }
            };
            const dataTrace = [trace];
            const layout = {
              title: {
                text: `<b>Max. Nitrogen Measurements for Bay Area Cities in the month of ${date} </b>`,
                font: {
                  size: 13
                }
              },
              xaxis: {
                title: 'Cities in Bay Area',
                tickangle: 90,
                tickfont: {
                  size: 9
                }
              },
              yaxis: {
                title: 'Nitrogen Maximum Values'
              }
            };
            Plotly.newPlot('bar', dataTrace, layout);
          }
        );
        } else if (newPollutant == "ozone"){
          d3.json('./ozone').then(
            function(response) {
              const trace = {
                x: response.filter(data => data.ozone_month === date).map((data)=>data.city),
                y: response.filter(data => data.ozone_month === date).map((data)=>data.ozone_max),
                type: 'bar',
                marker: {
                  color: 'rgb(12,192,174)'
                }
              };
              const dataTrace = [trace];
              const layout = {
                title: {
                  text: `<b>Max. Ozone Measurements for Bay Area Cities in the month of ${date}</b>`,
                  font: {
                    size: 13
                  }
                },
                xaxis: {
                  title: 'Cities in Bay Area',
                  tickangle: 90,
                  tickfont: {
                    size: 9
                  }
                },
                yaxis: {
                  title: 'Ozone Maximum Values'
                }
              };
              Plotly.newPlot('bar', dataTrace, layout);
            }
          );
          } else if (newPollutant == "pm10"){
            d3.json('./pm10').then(
              function(response) {
                const trace = {
                  x: response.filter(data => data.pm10_month === date).map((data)=>data.city),
                  y: response.filter(data => data.pm10_month === date).map((data)=>data.pm10_max),
                  type: 'bar',
                  marker: {
                    color: 'rgb(27,16,186)'
                  }
                };
                const dataTrace = [trace];
                const layout = {
                  title: {
                    text: `<b>Max. pm10 Measurements for Bay Area Cities in the month of ${date}</b>`,
                    font: {
                      size: 13
                    }
                  },
                  xaxis: {
                    title: 'City in Bay Area',
                    tickangle: 90,
                    tickfont: {
                      size: 9
                    }
                  },
                  yaxis: {
                    title: 'pm10 Maximum Values'
                  }
                };
                Plotly.newPlot('bar', dataTrace, layout);
              }
            );
            }  else if (newPollutant == "pm25"){
              d3.json('./pm25').then(
                function(response) {
                  const trace = {
                    x: response.filter(data => data.pm25_month === date).map((data)=>data.city),
                    y: response.filter(data => data.pm25_month === date).map((data)=>data.pm25_max),
                    type: 'bar',
                    marker: {
                      color: 'rgb(63,16,124)'
                    }
                  };
                  const dataTrace = [trace];
                  const layout = {
                    title: {
                      text: `<b>Max. pm25 Measurements for Bay Area Cities in the month of ${date}</b>`,
                      font: {
                        size: 13
                      }
                    },
                    xaxis: {
                      title: 'City in Bay Area',
                      tickangle: 90,
                      tickfont: {
                        size: 9
                      }
                    },
                    yaxis: {
                      title: 'pm25 Maximum Values'
                    }
                  };
                  Plotly.newPlot('bar', dataTrace, layout);
                }
              );
              };
    };


// Function for default bar graph upon page opening 

function init(){
  d3.json('./carbon').then(
    function(response) {          
      const trace = {
        x: response.filter(data => data.carbon_month === '2020-01-01').map((data) => data.city),
        y: response.filter(data => data.carbon_month === '2020-01-01').map((data)=>data.carbon_max),
        type: 'bar',
        marker: {
          color: 'rgb(209,94,94)'
        }
      };
      const dataTrace = [trace];
      const layout = {
        title: {
          text: `<b>Max. Carbon Measurements for Bay Area Cities in the month of 2020-01-01</b>`,
          font: {
            size: 13
          }
        },
        xaxis: {
          title: 'Cities in Bay Area',
          tickangle: 90,
          tickfont: {
            size: 9
          }
        },
        yaxis: {
          title: 'Carbon Maximum Values'
        }
      };
      Plotly.newPlot('bar', dataTrace, layout);
    }
  );
  };
      
  

// Running function for default bar graph

  init()


    











