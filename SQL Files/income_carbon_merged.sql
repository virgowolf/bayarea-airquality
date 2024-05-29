CREATE TABLE carbon (
    city_index INT,
    city VARCHAR(100),
    carbon_month VARCHAR(30),
    carbon_max DEC,
    median_income_2020 DEC,
    PRIMARY KEY (city, city_index, carbon_month)
);