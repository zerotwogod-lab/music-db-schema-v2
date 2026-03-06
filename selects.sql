-- Задание 2

-- 1. Самый длинный трек
SELECT title, duration
FROM track
ORDER BY duration DESC
LIMIT 1;

-- 2. Треки длительностью не менее 210 секунд
SELECT title
FROM track
WHERE duration >= 210;

-- 3. Сборники, вышедшие в 2018–2020 годах
SELECT title
FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT name
FROM artist
WHERE name NOT LIKE '% %';

-- 5. Треки, содержащие слово "my" как отдельное слово
SELECT title
FROM track
WHERE title ILIKE 'my %'
   OR title ILIKE '% my %'
   OR title ILIKE '% my'
   OR title ILIKE 'my';


-- Задание 3

-- 1. Количество исполнителей в каждом жанре
SELECT g.name, COUNT(ag.artist_id) AS artist_count
FROM genre g
LEFT JOIN artist_genre ag ON g.id = ag.genre_id
GROUP BY g.name;

-- 2. Количество треков в альбомах 2019–2020 годов
SELECT COUNT(t.id)
FROM track t
JOIN album a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по альбомам
SELECT a.title, AVG(t.duration) AS avg_duration
FROM album a
JOIN track t ON a.id = t.album_id
GROUP BY a.title;

-- 4. Исполнители, которые НЕ выпускали альбомы в 2020 году
SELECT DISTINCT ar.name
FROM artist ar
WHERE ar.id NOT IN (
    SELECT artist_id
    FROM artist_album aa
    JOIN album a ON aa.album_id = a.id
    WHERE a.release_year = 2020
);

-- 5. Сборники, в которых есть треки исполнителя Eminem
SELECT DISTINCT c.title
FROM collection c
JOIN collection_track ct ON c.id = ct.collection_id
JOIN track t ON ct.track_id = t.id
JOIN album a ON t.album_id = a.id
JOIN artist_album aa ON a.id = aa.album_id
JOIN artist ar ON aa.artist_id = ar.id
WHERE ar.name = 'Eminem';
