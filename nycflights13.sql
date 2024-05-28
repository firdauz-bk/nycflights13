-- !preview conn=con_nycflights13

-- Import table for flights from New York City's main airports in 2013
DROP TABLE IF EXISTS flights CASCADE;
CREATE TABLE flights (
    year INT,
    month INT,
    day INT,
    dep_time INT,
    sched_dep_time INT,
    dep_delay INT,
    arr_time INT,
    sched_arr_time INT,
    arr_delay INT,
    carrier CHAR(2),
    flight INT,
    tailnum VARCHAR(6),
    origin CHAR(3),
    dest CHAR(3),
    air_time INT,
    distance INT,
    hour INT,
    minute INT,
    time_hour TIMESTAMP,
    PRIMARY KEY (carrier, flight, time_hour)
);
COPY flights
FROM 'C:\Users\Chanj\OneDrive - Singapore Institute Of Technology\Areas\T3Y1\AAI1001 Data engineering and visualisation\week 4\nycflights13\data\flights.csv'
CSV HEADER;

-- Import table for airlines
DROP TABLE IF EXISTS airlines CASCADE;
CREATE TABLE airlines (
    carrier CHAR(2),
    name VARCHAR(255),
    PRIMARY KEY (carrier)
);
COPY airlines
FROM 'C:\Users\Chanj\OneDrive - Singapore Institute Of Technology\Areas\T3Y1\AAI1001 Data engineering and visualisation\week 4\nycflights13\data\airlines.csv'
CSV HEADER;

-- Import table for airports
DROP TABLE IF EXISTS airports CASCADE;
CREATE TABLE airports (
    faa CHAR(3),
    name VARCHAR(255),
    lat NUMERIC,
    lon NUMERIC,
    alt INT,
    tz INT,
    dst CHAR(1),
    tzone VARCHAR(255),
    PRIMARY KEY (faa)
);
COPY airports
FROM 'C:\Users\Chanj\OneDrive - Singapore Institute Of Technology\Areas\T3Y1\AAI1001 Data engineering and visualisation\week 4\nycflights13\data\airports.csv'
CSV HEADER;

/* Import table for planes
Complete the missing code here */

-- Import table for planes
DROP TABLE IF EXISTS planes CASCADE;
CREATE TABLE planes (
    tailnum VARCHAR(255) PRIMARY KEY,
    year INT,
    type VARCHAR(255),
    manufacturer VARCHAR(255),
    model VARCHAR(255),
    engines INT,
    seats INT,
    speed INT,
    engine VARCHAR(255)
);

COPY planes
FROM 'C:\Users\Chanj\OneDrive - Singapore Institute Of Technology\Areas\T3Y1\AAI1001 Data engineering and visualisation\week 4\nycflights13\data\planes.csv'
CSV HEADER;

/* Submit the missing code only in your report */





-- Import table for weather
DROP TABLE IF EXISTS weather CASCADE;
CREATE TABLE weather (
    origin CHAR(3),
    year INT,
    month INT,
    day INT,
    hour INT,
    temp NUMERIC,
    dewp NUMERIC,
    humid NUMERIC,
    wind_dir INT,
    wind_speed NUMERIC,
    wind_gust NUMERIC,
    precip NUMERIC,
    pressure NUMERIC,
    visib NUMERIC,
    time_hour TIMESTAMP,
    PRIMARY KEY (origin, time_hour)
);
COPY weather
FROM 'C:\Users\Chanj\OneDrive - Singapore Institute Of Technology\Areas\T3Y1\AAI1001 Data engineering and visualisation\week 4\nycflights13\data\weather.csv'
CSV HEADER;

-- Add foreign keys
ALTER TABLE flights
ADD FOREIGN KEY (carrier) REFERENCES airlines (carrier),
ADD FOREIGN KEY (origin) REFERENCES airports (faa),
ADD FOREIGN KEY (dest) REFERENCES airports (faa),
ADD FOREIGN KEY (tailnum) REFERENCES planes (tailnum);
ALTER TABLE weather
ADD FOREIGN KEY (origin) REFERENCES airports (faa);