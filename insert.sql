INSERT INTO artist (name) VALUES
('Eminem'),
('Rammstein'),
('Adele'),
('Miyagi');

INSERT INTO genre (name) VALUES
('Rap'),
('Rock'),
('Pop');

INSERT INTO artist_genre (artist_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(4, 3);

INSERT INTO album (title, release_year) VALUES
('Kamikaze', 2018),
('Zeit', 2022),
('25', 2015);

INSERT INTO artist_album (artist_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1);

INSERT INTO track (title, duration, album_id) VALUES
('Lucky You', 245, 1),
('Fall', 250, 1),
('Zeit', 300, 2),
('Angst', 235, 2),
('Hello', 295, 3),
('Send My Love', 210, 3);

INSERT INTO collection (title, release_year) VALUES
('Best Rap 2019', 2019),
('Rock Legends', 2020),
('Pop Hits', 2018),
('My Collection', 2021);

INSERT INTO collection_track (collection_id, track_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 5);
