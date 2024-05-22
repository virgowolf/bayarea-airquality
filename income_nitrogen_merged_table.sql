CREATE TABLE income_nitrogen_merged_table (
    city_index INT,
	city VARCHAR(100),
    month DATE,
    nitrogen_median NUMERIC,
	median_income_2020 NUMERIC,
	PRIMARY KEY (city, city_index, month),
	FOREIGN KEY (city, city_index, month) REFERENCES city_master_table(city, city_index, month)
);