
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
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');
INSERT INTO Game VALUES (4, '2006-06-30 20:49:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');
INSERT INTO Player VALUES (4, 'cat@gmail.edu', 'Catzrule');

INSERT INTO PlayerGame VALUES (1, 1, 0.00, 3);
INSERT INTO PlayerGame VALUES (1, 2, 0.00, 5);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00, 7);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00, 10);
INSERT INTO PlayerGame VALUES (2, 2, 0.00, 12 );
INSERT INTO PlayerGame VALUES (2, 3, 500.00, 8);
INSERT INTO PlayerGame VALUES (3, 2, 0.00, 9);
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