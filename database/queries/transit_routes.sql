-- Найти все маршруты, проходящие через заданный пункт
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
