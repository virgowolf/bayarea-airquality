CREATE TABLE pm25 (
    city_index INT,
    city VARCHAR(100),
    pm25_month VARCHAR(30),
    pm25_max DEC,
    median_income_2020 DEC,
    PRIMARY KEY (city, city_index, pm25_month)
);