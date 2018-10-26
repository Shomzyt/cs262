
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame CASCADE;
DROP TABLE IF EXISTS Game CASCADE;
DROP TABLE IF EXISTS Player CASCADE;
DROP TABLE IF EXISTS Property CASCADE;
DROP TABLE IF EXISTS GameProperty CASCADE;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	cash integer,
	location integer
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50)
	);

CREATE TABLE GameProperty (
	gameID integer REFERENCES Game(ID),
	playerID integer REFERENCES Player(ID),
	houses integer,
	hotels integer,
	propertyID integer REFERENCES Property(ID)
);
-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON GameProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2018-10-21 18:41:00');
INSERT INTO Game VALUES (4, '2018-10-20 20:49:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.com', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.com', 'Dogbreath');
INSERT INTO Player VALUES (4, 'cat@gmail.com', 'Catzrule');

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 3);
INSERT INTO PlayerGame VALUES (1, 2, 50.00, 5);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 7);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 10);
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 12 );
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 8);
INSERT INTO PlayerGame VALUES (3, 2, 100.00, 9);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00, 5);
INSERT INTO PlayerGame VALUES (4, 4, 6200.00, 4);

INSERT INTO Property VALUES (1, 'Picadilly');
INSERT INTO Property VALUES (2, 'Trafalgar');
INSERT INTO Property VALUES (3, 'Connecticut');
INSERT INTO Property VALUES (4, 'Vermont');
INSERT INTO Property VALUES (5, 'Johannesburg');
INSERT INTO Property VALUES (6, 'Pikachu Plaza');

INSERT INTO GameProperty VALUES (1, 1, 2, 0, 3);
INSERT INTO GameProperty VALUES (1, 2, 3, 1, 1);
INSERT INTO GameProperty VALUES (2, 3, 1, 1, 6);
INSERT INTO GameProperty VALUES (4, 1, 2, 0, 5);
INSERT INTO GameProperty VALUES (3, 4, 4, 1, 2);



--Testing sql commands 

--8.1

-- (a)List of all the games, ordered by date with the most recent game first

SELECT *
FROM Game
ORDER BY time DESC;

-- (b)Games that occurred in the past week

SELECT *
FROM Game
WHERE time > '2018-10-19 14:49:00';

-- (c)Players with Non-NULL names

SELECT *
FROM Player
WHERE name IS NOT NULL;

-- (d)List of IDs for players with score larger than 2000

SELECT *
FROM PlayerGame
WHERE cash > 2000;

-- (e)List of players with Gmail Accounts

SELECT *
FROM Player
WHERE emailAddress LIKE '%gmail%';


--8.2

-- (a)"The king"'s game scores in decreasing order

SELECT cash
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID
  AND Player.name = 'The King'
ORDER BY cash DESC;

-- (b)Winner of Game on 2006-06-28 13:20:00

SELECT name
FROM Player, Game, PlayerGame
WHERE Player.ID = PlayerGame.playerID
  AND PlayerGame.gameID = Game.ID
  AND Game.time = '2006-06-28 13:20:00'
 ORDER BY cash DESC
 LIMIT 1;

 -- (c)P1.ID < P2.ID ensures that you're not checking the same name in the same ID


 -- (d)A realistic situation is when you're trying to compare values within the same table without comparing the same row entry/tupule