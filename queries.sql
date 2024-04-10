SELECT o.id, o.first_name, o.last_name, v.id, v.make, v.model, v.year, v.price, v.owner_id
FROM owners o
LEFT JOIN vehicles v ON o.id = v.owner_id
UNION ALL
SELECT o.id, o.first_name, o.last_name, NULL, NULL, NULL, NULL, NULL, NULL
FROM owners o
WHERE o.id NOT IN (SELECT owner_id FROM vehicles);


SELECT o.first_name, o.last_name, COUNT(v.id) AS count
FROM owners o
JOIN vehicles v ON o.id = v.owner_id
GROUP BY o.id, o.first_name, o.last_name
ORDER BY o.first_name ASC;


SELECT o.first_name, o.last_name, CAST(AVG(v.price) AS INTEGER) AS average_price, COUNT(v.id) AS count
FROM owners o
JOIN vehicles v ON o.id = v.owner_id
GROUP BY o.id, o.first_name, o.last_name
HAVING COUNT(v.id) > 1 AND CAST(AVG(v.price) AS INTEGER) > 10000
ORDER BY o.first_name DESC;
