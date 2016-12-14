DROP TABLE IF EXISTS songs;
  DROP TABLE IF EXISTS artists;

  create table artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    photo_url VARCHAR,
    nationality VARCHAR
  );

  CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    album VARCHAR,
    preview_url VARCHAR,
    artist_id INTEGER
  );
