CREATE TABLE pm10 (
    city_index INT,
    city VARCHAR(100),
    pm10_month VARCHAR(30),
    pm10_max DEC,
    median_income_2020 DEC,
    PRIMARY KEY (city, city_index, pm10_month)
);