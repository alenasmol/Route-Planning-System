-- Найти кратчайший маршрут между двумя местоположениями
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
