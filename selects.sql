-- Задание 2
SELECT title, duration
FROM track
ORDER BY duration DESC
LIMIT 1;

SELECT title
FROM track
WHERE duration >= 210;

SELECT title
FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name
FROM artist
WHERE name NOT LIKE '% %';

SELECT title
FROM track
WHERE LOWER(title) LIKE '%my%' OR LOWER(title) LIKE '%мой%';

-- Задание 3
SELECT g.name, COUNT(ag.artist_id) AS artist_count
FROM genre g
LEFT JOIN artist_genre ag ON g.id = ag.genre_id
GROUP BY g.name;

SELECT COUNT(t.id)
FROM track t
JOIN album a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT a.title, AVG(t.duration)
FROM album a
JOIN track t ON a.id = t.album_id
GROUP BY a.title;

SELECT DISTINCT ar.name
FROM artist ar
WHERE ar.id NOT IN (
    SELECT artist_id
    FROM artist_album aa
    JOIN album a ON aa.album_id = a.id
    WHERE a.release_year = 2020
);

SELECT DISTINCT c.title
FROM collection c
JOIN collection_track ct ON c.id = ct.collection_id
JOIN track t ON ct.track_id = t.id
JOIN album a ON t.album_id = a.id
JOIN artist_album aa ON a.id = aa.album_id
JOIN artist ar ON aa.artist_id = ar.id
WHERE ar.name = 'Eminem';
