-- Наполнение таблицы Locations
INSERT INTO Locations (name, latitude, longitude) VALUES
('New York', 40.712776, -74.005974),
('Los Angeles', 34.052235, -118.243683),
('Chicago', 41.878113, -87.629799),
('Houston', 29.760427, -95.369804),
('Miami', 25.761681, -80.191788);

-- Наполнение таблицы Routes
INSERT INTO Routes (start_location_id, end_location_id, distance_km, travel_time_min) VALUES
(1, 2, 3940.0, 2850), -- New York -> Los Angeles
(1, 3, 1146.0, 780),  -- New York -> Chicago
(3, 4, 1517.0, 1050), -- Chicago -> Houston
(4, 5, 1930.0, 1330), -- Houston -> Miami
(5, 1, 2060.0, 1440); -- Miami -> New York

-- Наполнение таблицы Schedules
INSERT INTO Schedules (route_id, departure_time, arrival_time) VALUES
(1, '08:00', '16:45'),
(2, '09:00', '21:00'),
(3, '10:00', '01:30'),
(4, '11:00', '03:10'),
(5, '12:00', '06:00');

-- Наполнение таблицы Users
INSERT INTO Users (name, email) VALUES
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Smith', 'bob.smith@example.com'),
('Charlie Brown', 'charlie.brown@example.com');

-- Наполнение таблицы User_Plans
INSERT INTO User_Plans (user_id, route_id, preferred_time) VALUES
(1, 1, '08:30'), -- Alice выбирает маршрут New York -> Los Angeles
(2, 3, '10:15'), -- Bob выбирает маршрут Chicago -> Houston
(3, 5, '12:30'); -- Charlie выбирает маршрут Miami -> New York
