-- 1
SELECT matchid,player FROM goal WHERE teamid = 'GER'

-- 2
SELECT id,stadium,team1,team2 FROM game
WHERE id='1012'

-- 3
SELECT goal.player,goal.teamid,game.stadium,game.mdate 
FROM game JOIN goal ON (game.id=goal.matchid)
WHERE teamid = 'GER'

-- 4
SELECT game.team1,game.team2,goal.player 
FROM game JOIN goal ON (game.id=goal.matchid)
WHERE player LIKE '%Mario%'
-- SELECT * from goal
-- SELECT * from game

-- 5
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime FROM goal 
JOIN eteam ON (goal.teamid=eteam.id)
WHERE gtime<=10

-- 6
SELECT game.mdate,eteam.teamname FROM game
JOIN eteam ON (game.team1=eteam.id)
WHERE coach = 'Fernando Santos'

-- 7
SELECT goal.player FROM goal
JOIN game ON (game.id=goal.matchid)
WHERE stadium = 'National Stadium, Warsaw'

-- 8
SELECT DISTINCT(goal.player) FROM goal
 JOIN game ON goal.matchid=game.id
  WHERE (team1='GER' OR team2='GER') AND teamid != 'GER'

-- 9
SELECT eteam.teamname, COUNT(goal.player) FROM eteam 
JOIN goal ON eteam.id=goal.teamid
GROUP BY teamname

-- 10
SELECT game.stadium, COUNT(goal.player) AS goals FROM game
JOIN goal ON (game.id=goal.matchid)
GROUP BY stadium

-- 11
SELECT matchid, mdate, COUNT(player) AS goals FROM game
JOIN goal ON (game.id=goal.matchid AND (team1 = 'POL' OR team2 = 'POL'))
GROUP BY matchid, mdate

-- 12
SELECT id, mdate, COUNT(player) FROM game
JOIN goal ON (id=matchid AND (team1 = 'GER' OR team2 = 'GER') AND teamid='GER')
GROUP BY id, mdate

-- 13
SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM game 
       LEFT JOIN goal ON (id = matchid)
    GROUP BY mdate,team1,team2
    ORDER BY mdate, matchid, team1, team2
