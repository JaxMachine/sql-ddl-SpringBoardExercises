-- from the terminal run:
-- psql < air_traffic_modifed.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

--Passengers Table
CREATE TABLE passengers(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
)

--Airlines Table--
CREATE TABLE airlines(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
)

--Countries Table--
CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL
)

--Cities Table--
CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL
)

--Locations Table--
CREATE TABLE locations (
  id SERIAL PRIMARY KEY
  city_id INTEGER REFERENCES cities ON DELETE CASCADE
  country_id INTEGER REFERENCES countries ON DELETE CASCADE
)


--Flight Plans--
CREATE TABLE flight_plans(
  id SERIAL PRIMARY KEY,
  departure_destination INTEGER REFERENCES locations ON DELETE CASCADE
  arrival_destination INTEGER REFERENCES locations CHECK (departure_destination != arrival_destination),
)

--Ticket Information --
CREATE TABLE ticket_information(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER REFERENCES airlines
  flight_plan_id INTEGER REFERENCES flight_plans ON DELETE CASCADE
  passenger_id INTEGER REFERENCES passengers On DELETE CASCADE
  seat TEXT NOT NULL
  departure_time TIMESTAMP NOT NULL
  arrival_time TIMESTAMP NOT NULL
)