# bayarea-airquality

## POLLUTION AND INCOME ANALYSIS PROJECT ##

### OVERVIEW & PURPOSE ###
This project aims to analyze the relationship between pollution levels and median income across various cities in the San Francisco Bay Area. The goal is to provide visual insights into how different pollutants vary over time, using the year 2020 as our sample frame, and examine the relationship between pollution spike locations and income levels for a given city. The project utilizes data visualizations to tell a compelling story, focusing on key pollutants such as Carbon, Nitrogen, Ozone, PM10, and PM25.
The finished product is an interactive and user-friendly website embedded with a Flask app and Leaflet map. Website visitors can visualize the monthly variations in pollution levels across different cities, and analyze the correlation between pollution levels and median income.

### DATA SOURCES ###
Data were extracted using an API key to access Environmental Protection Agency (EPA) data from the website data.gov. We chose to pull daily maximum values for each city in the San Francisco Bay Area, and then calculated monthly maximum values in Python via our ETL process. 
The EPA_datapull.ipynb notebook documents the process of extracting data from the EPA API. This involves pulling pollution data for various pollutants, including Carbon, Nitrogen, Ozone, PM10, and PM25. The code for the ETL process is included in the ETL_code.ipynb notebook.
The ETL process includes the following:
Reading data from CSV files
Converting date columns to DateTime format
Renaming columns for consistency
Adding pollutant labels to each dataset
Concatenating all datasets into a single DataFrame
Grouping the data by date and pollutant, and calculating the maximum values for each group

### INSTRUCTIONS FOR USE ###
Required Python libraries: pandas, Plotly, seaborn, requests (for API data pull)
Required apps: Jupyter Lab, Leaflet, Pg Admin/PostgreSQL, Flask, and Leaflet
- Clone the repository to your local machine.
- Ensure you have the necessary csv files in the output_data directory.
- Run the ETL file in Python
- Run the Plotly file
- Run the SQL code in  the SQL files folder
- Run the JavaScript files in the map data folder
- Run the Flask code
- Additional library: Anime.js was used for webpage animation. Users can include this JavaScript library in their web applications using: <script src = "https://cdn.jsdelivr.net/npm/animejs/lib/anime.min.js"> </script>

### INTERACTION ###
Visitors can select a city and pollution type using the respective dropdown menus. Upon selecting each of these parameters, they will see an interactive bar as well as a line graph showing monthly spikes by city and pollutant type. Additionally, they may interact with the Leafet map by exploring the sites of the largest Greenhouse Gas emitters and noting their relative proximity to high Air Quality Index (AQI) areas.

### ETHICAL CONSIDERATIONS ###
In developing this project, the following ethical considerations were made:
Data Privacy: Ensuring that the data used does not contain any personally identifiable information (PII).
Data Accuracy: Using reliable and accurate data sources to ensure the integrity of the analysis.
Transparency: Providing clear references to all data sources and external code used.

### REFERENCES ###
Data Sources: 
- API data pull for daily max pollution tracked by the EPA: https://aqs.epa.gov/aqsweb/documents/data_api.html
- EPA Facility Level Information on Greenhouse Gases: https://ghgdata.epa.gov/ghgp/main.do
- California cities shapefile: https://data.ca.gov/dataset/ca-geographic-boundaries/resource/436fc714-831c-4070-b44b-b06dcde6bf18
- Shapefile to geoJSON converter: https://quickmaptools.com/shp-to-geojson
- GeoJSON coordinates converter: https://mygeodata.cloud/converter/geojson-to-latlong
- ASC Census data on income: https://vitalsigns.mtc.ca.gov/indicators/income
