<<<<<<< HEAD
=======
DROP TABLE IF EXISTS city_master_table;

>>>>>>> 6337d5a0a40102fffdb06735fcf7ba8decb36040
CREATE TABLE city_master_table (
    city_index INT,
    city VARCHAR(100),
    month DATE,
<<<<<<< HEAD
    pm10_max NUMERIC,
    pm25_max NUMERIC,
    ozone_max NUMERIC,
    nitrogen_max NUMERIC,
    carbon_max NUMERIC,
    median_income_2020 NUMERIC,
    PRIMARY KEY (city_index, city, month)
);
=======
    pm10_median NUMERIC,
    pm25_median NUMERIC,
    ozone_median NUMERIC,
    nitrogen_median NUMERIC,
    carbon_median NUMERIC,
    median_income_2020 NUMERIC,
    PRIMARY KEY (city_index, city, month)
);

>>>>>>> 6337d5a0a40102fffdb06735fcf7ba8decb36040
