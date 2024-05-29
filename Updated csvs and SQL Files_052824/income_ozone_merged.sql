CREATE TABLE ozone (
    city_index INT,
    city VARCHAR(100),
    ozone_month VARCHAR(30),
    ozone_max DEC,
    median_income_2020 DEC,
    PRIMARY KEY (city, city_index, ozone_month)
);