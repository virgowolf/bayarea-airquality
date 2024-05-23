CREATE TABLE city_master_table (
    city_index INT,
    city VARCHAR(100),
    month DATE,
    pm10_max NUMERIC,
    pm25_max NUMERIC,
    ozone_max NUMERIC,
    nitrogen_max NUMERIC,
    carbon_max NUMERIC,
    median_income_2020 NUMERIC,
    PRIMARY KEY (city_index, city, month)
);