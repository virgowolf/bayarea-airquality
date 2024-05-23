CREATE TABLE income_carbon_merged_table (
    city_index INT,
	city VARCHAR(100),
    month DATE,
    carbon_max NUMERIC,
	median_income_2020 NUMERIC,
	PRIMARY KEY (city, city_index, month),
	FOREIGN KEY (city, city_index, month) REFERENCES city_master_table(city, city_index, month)
);