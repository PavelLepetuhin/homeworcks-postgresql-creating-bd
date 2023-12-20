
CREATE TABLE IF NOT EXISTS Album (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL,
    track INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INTEGER NOT NULL,
    album_id INTEGER REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Collection (
    collection_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER NOT NULL,
    track_id INTEGER REFERENCES Track(track_id)
);

CREATE TABLE IF NOT EXISTS Genre (
    genre_id SERIAL PRIMARY KEY,
    title VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Performer (
    performer_id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS PerformerGenre (
    performer_id INTEGER REFERENCES Performer(performer_id),
    genre_id INTEGER REFERENCES Genre(genre_id),
    CONSTRAINT pg PRIMARY KEY (performer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS AlbumPerformer (
    performer_id INTEGER REFERENCES Performer(performer_id),
    album_id INTEGER REFERENCES Album(album_id),
    CONSTRAINT ap PRIMARY KEY (performer_id, album_id)
);

CREATE TABLE IF NOT EXISTS TrackCollection (
    track_id INTEGER REFERENCES Track(track_id),
    collection_id INTEGER REFERENCES Collection(collection_id),
    CONSTRAINT tc PRIMARY KEY (track_id, collection_id)
);
