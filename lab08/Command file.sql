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