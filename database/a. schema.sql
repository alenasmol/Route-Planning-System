CREATE TABLE Locations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    latitude DECIMAL(9, 6) NOT NULL,
    longitude DECIMAL(9, 6) NOT NULL
);

CREATE TABLE Routes (
    id SERIAL PRIMARY KEY,
    start_location_id INT REFERENCES Locations(id),
    end_location_id INT REFERENCES Locations(id),
    distance_km DECIMAL(10, 2),
    travel_time_min INT
);

CREATE TABLE Schedules (
    id SERIAL PRIMARY KEY,
    route_id INT REFERENCES Routes(id),
    departure_time TIME,
    arrival_time TIME
);

CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE
);

CREATE TABLE User_Plans (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    route_id INT REFERENCES Routes(id),
    preferred_time TIME
);
