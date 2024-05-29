CREATE TABLE nitrogen (
    city_index INT,
    city VARCHAR(100),
    nitrogen_month VARCHAR(30),
    nitrogen_max DEC,
    median_income_2020 DEC,
    PRIMARY KEY (city, city_index, nitrogen_month)
);