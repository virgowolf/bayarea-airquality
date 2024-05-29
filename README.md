Pollution and Income Analysis Project
Overview
This project analyzes the relationship between pollution levels and median income across various cities. It uses visualizations to show how different pollutants vary over time and correlate with income levels, focusing on Carbon, Nitrogen, Ozone, PM10, and PM25.

Project Purpose
Visualize monthly pollution variations in different cities.
Analyze the correlation between pollution levels and median income.
Provide an interactive, user-friendly interface for data exploration.

Visualizations
Scatter Plot of Pollutants vs Median Income: Displays maximum pollutant values against median income, using different colors for each pollutant.
Line Plot of Monthly Max Pollution Levels by Pollutant: Shows maximum pollution levels over 12 months, with each line representing a different pollutant.
Summary Table of Median Income by City: Provides median income data for each city.

Interactive Map Using Leaflet: Visualizes pollution distribution geographically across the Bay Area.
HTML Website with Dropdowns: Displays maps and graphics, allowing users to select pollutants and timeframes to update visualizations dynamically.

Data Sources
income_carbon_merged.csv
income_nitrogen_merged.csv
income_ozone_merged.csv
income_pm10_merged.csv
income_pm25_merged.csv

ETL Process
Extract: Data from CSV files.
Transform: Clean, standardize, and merge data.
Load: Load data into a database for analysis.

EPA Data Pull
Extracts pollution data from the EPA API, cleans, and preprocesses it for analysis.

Instructions for Use
Prerequisites
Python 3.x
Libraries: pandas, plotly, requests
Running the Project
Clone the repository.
Ensure CSV files are in the output_data directory.
Run Python scripts or notebooks.
Open the HTML website for interactive visualizations.
Interaction
Hover over plots for details.
Use dropdowns to update visualizations on the HTML website.

Ethical Considerations
Data Privacy: No personally identifiable information.
Data Accuracy: Reliable and accurate sources.
Transparency: Clear references to data sources and code.

References
Plotly: https://plotly.com/python/
Pandas: https://pandas.pydata.org/
Requests: https://docs.python-requests.org/en/latest/
Leaflet: https://leafletjs.com/

Additional Libraries Used
Plotly
pandas
Leaflet
