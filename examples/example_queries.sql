-- === Пример: Найти кратчайший маршрут между двумя точками ===
-- Задача: Найти кратчайший маршрут из New York в Los Angeles
WITH RouteDistances AS (
    SELECT
        start_location_id,
        end_location_id,
        distance_km
    FROM Routes
)
SELECT 
    l1.name AS start_location,
    l2.name AS end_location,
    r.distance_km AS distance
FROM RouteDistances r
JOIN Locations l1 ON r.start_location_id = l1.id
JOIN Locations l2 ON r.end_location_id = l2.id
WHERE l1.name = 'New York' AND l2.name = 'Los Angeles'
ORDER BY r.distance_km ASC
LIMIT 1;

-- === Пример: Получить расписание маршрута ===
-- Задача: Найти расписание маршрута из New York в Los Angeles
SELECT 
    r.id AS route_id,
    l1.name AS start_location,
    l2.name AS end_location,
    s.departure_time,
    s.arrival_time
FROM Schedules s
JOIN Routes r ON s.route_id = r.id
JOIN Locations l1 ON r.start_location_id = l1.id
JOIN Locations l2 ON r.end_location_id = l2.id
WHERE l1.name = 'New York' AND l2.name = 'Los Angeles';

-- === Пример: Подобрать маршрут для пользователя ===
-- Задача: Найти подходящий маршрут для Alice Johnson, предпочтительное время — 08:30
SELECT 
    u.name AS user_name,
    l1.name AS start_location,
    l2.name AS end_location,
    s.departure_time,
    s.arrival_time
FROM User_Plans up
JOIN Users u ON up.user_id = u.id
JOIN Routes r ON up.route_id = r.id
JOIN Locations l1 ON r.start_location_id = l1.id
JOIN Locations l2 ON r.end_location_id = l2.id
JOIN Schedules s ON r.id = s.route_id
WHERE u.email = 'alice.johnson@example.com' AND s.departure_time >= up.preferred_time;

-- === Пример: Найти маршруты через указанный пункт ===
-- Задача: Найти все маршруты, проходящие через Chicago
SELECT 
    r.id AS route_id,
    l1.name AS start_location,
    l2.name AS end_location,
    r.distance_km,
    r.travel_time_min
FROM Routes r
JOIN Locations l1 ON r.start_location_id = l1.id
JOIN Locations l2 ON r.end_location_id = l2.id
WHERE l1.name = 'Chicago' OR l2.name = 'Chicago';
