-- Найти маршруты, соответствующие предпочтениям пользователя
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
