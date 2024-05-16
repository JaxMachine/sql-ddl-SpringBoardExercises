-- from the terminal run:
-- psql < outer_space_modified.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxy(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  in_galaxy INTEGER REFERENCES galaxy ON DELETE CASCADE
)

CREATE TABLE planets(
  id SERIAL PRIMARY KEY.
  name TEXT NOT NULL
  orbits_around INTEGER REFERENCES stars ON DELETE CASCADE
)

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT Null
  orbits_around INTEGER REFERENCES planets ON DELETE CASCADE
)

CREATE TABLE orbital_period(
  id SERIAL PRIMARY KEY,
  star_id REFERENCES stars ON DELETE CASCADE,
  planet_id REFERENCES planets ON DELETE CASCADE,
  years FLOAT NOT NULL
)