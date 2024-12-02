-- Получить расписание для заданного маршрута
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
