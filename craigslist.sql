--Data Base Schema For a Craigslist Clone--
-- from terminal run psql < craigslist.sql--


DROP DATABASE IF EXISTS craigslist;

CREATE craigslist;

\c craigslist

--Regions--
CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL
)

--Users--
--User Passowrd not containted here for Security reasons--
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    user_first_name TEXT,
    user_last_name TEXT,
    user_email TEXT NOT NULL,
    user_phone_number TEXT UNIQUE
)

--Perfered Region--
CREATE TABLE perfered_region(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES user,
    region_id INTEGER REFERENCES region
)

--Locaitons--
CREATE TABLE locations(
    id SERIAL PRIMARY KEY,
    location TEXT NOT NULL
)
--Categories--
CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    Category TEXT NOT NULL
)

--Posts-
CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    category_id REFERENCES categories,
    region_id REFERENCES region,
    post_content TEXT,
    location_id REFERENCES locations

)