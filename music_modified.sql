-- from the terminal run:
-- psql < music_modified.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)
CREATE TABLE producers(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  album_title TEXT NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER REFERENCES artists ON DELETE CASCADE
  producer_id INTEGER REFERENCES producer ON DELETE SET NULL
)

CREATE TABLE songs(
  id SERIAL PRIMARY KEY,
  song_tile TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL
  album_id INTEGER REFERENCES albums ON DELETE CASCADE
)
