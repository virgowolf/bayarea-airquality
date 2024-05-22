DROP TABLE IF EXISTS city_master_table;

CREATE TABLE city_master_table (
    city_index INT,
    city VARCHAR(100),
    month DATE,
    pm10_median NUMERIC,
    pm25_median NUMERIC,
    ozone_median NUMERIC,
    nitrogen_median NUMERIC,
    carbon_median NUMERIC,
    median_income_2020 NUMERIC,
    PRIMARY KEY (city_index, city, month)
);

