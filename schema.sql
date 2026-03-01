-- ============================
--       GENRE
-- ============================
CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- ============================
--       ARTIST
-- ============================
CREATE TABLE artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- ============================
--   ARTIST ↔ GENRE (M:N)
-- ============================
CREATE TABLE artist_genre (
    artist_id INTEGER NOT NULL REFERENCES artist(id),
    genre_id  INTEGER NOT NULL REFERENCES genre(id),
    PRIMARY KEY (artist_id, genre_id)
);

-- ============================
--        ALBUM
-- ============================
CREATE TABLE album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER
);

-- ============================
--   ARTIST ↔ ALBUM (M:N)
-- ============================
CREATE TABLE artist_album (
    artist_id INTEGER NOT NULL REFERENCES artist(id),
    album_id  INTEGER NOT NULL REFERENCES album(id),
    PRIMARY KEY (artist_id, album_id)
);

-- ============================
--         TRACK
-- ============================
CREATE TABLE track (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER NOT NULL REFERENCES album(id)
);

-- ============================
--       COLLECTION
-- ============================
CREATE TABLE collection (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER
);

-- ============================
--  COLLECTION ↔ TRACK (M:N)
-- ============================
CREATE TABLE collection_track (
    collection_id INTEGER NOT NULL REFERENCES collection(id),
    track_id      INTEGER NOT NULL REFERENCES track(id),
    PRIMARY KEY (collection_id, track_id)
);
