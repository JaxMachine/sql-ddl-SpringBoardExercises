--Data Base Schema For a Soccer League--
-- from terminal run psql < soccer_league.sql--


DROP DATABASE IF EXISTS soccer_league;

create soccer_league;

\c soccer_league

CREATE TABLE season(
    id PRIMARY SERIAL KEY,
    starting_date DATE NOT NULL,
    ending_date DATE NOT NULL,
)

--Team Table--
CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    team_city TEXT NOT NULL
)

--Player Table--
CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    player_first_name TEXT,
    player_last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
)

--Matches Table--
CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    season_id INTEGER REFERENCES season,
    match_date DATE NOT NULL,
    stadium_location TEXT NOT NULL
)

--Referee Table--
CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    ref_first_name TEXT,
    ref_last_name TEXT NOT NULL,
)

--Goal Table--
CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    goal_timestamp TIMESTAMP NOT NULL
)

--Offical Table--
CREATE TABLE officals(
    id SERIAL PRIMARY KEY,
    ref_id INTEGER REFERENCES referees ON DELETE SET NULL,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE,
)
--Result Table--
CREATE TABLE results(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    match_id INTEGER REFERENCES matches,
    result CHECK (result='win' OR result='loss' OR result = 'draw')

)

