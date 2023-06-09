﻿--SELECT--

SELECT *
FROM software_houses
WHERE country = 'United States';

SELECT *
FROM players
WHERE city = 'Rogahnland';

SELECT *
FROM players
WHERE [name] LIKE '%a';

SELECT *
FROM reviews
WHERE player_id LIKE 800;

SELECT COUNT(*) AS n_tournaments, year
FROM tournaments
WHERE year = '2015'
GROUP BY year;

SELECT *
FROM awards
WHERE description LIKE '%facere%';

SELECT DISTINCT videogame_id 
FROM category_videogame
WHERE category_id = 2 OR category_id = 6;

 
SELECT *
FROM awards
WHERE description LIKE '%facere%';

SELECT * 
FROM reviews 
WHERE rating >= 2 
AND rating <= 4;

SELECT *
FROM videogames
WHERE release_date BETWEEN '2020-01-01' AND '2020-12-31';

SELECT DISTINCT videogame_id
FROM reviews
WHERE rating = 5;

SELECT COUNT(*) as review_number, AVG(rating) as avg_rating
FROM reviews
WHERE videogame_id = 412;

SELECT COUNT(*) as numero_videogames
FROM videogames
WHERE YEAR(release_date) = 2018 AND software_house_id = 1;


--GROUP BY--

SELECT COUNT(*)
FROM software_houses
GROUP BY country;

SELECT COUNT(*)
FROM reviews
GROUP BY videogame_id;

SELECT COUNT(*)
FROM pegi_label_videogame
GROUP BY pegi_label_id;

SELECT YEAR(release_date) as anno, COUNT(videogames.id) as numero_di_videogiochi
FROM videogames
GROUP BY YEAR(release_date)
ORDER BY anno ASC;

SELECT COUNT(*)
FROM device_videogame
GROUP BY device_id;

SELECT AVG(rating)
FROM reviews
GROUP BY videogame_id;


--JOIN--

SELECT [name], lastname, nickname, city, COUNT(players.id) AS n_recensioni
FROM players
join reviews
ON players.id = reviews.player_id
GROUP BY players.[name], players.lastname, players.nickname, players.city

SELECT videogames.id,videogames.[name],tournaments.[name], COUNT(videogames.id) AS n_volte
FROM tournaments
join tournament_videogame
ON tournaments.id = tournament_videogame.tournament_id
join videogames
ON videogames.id = tournament_videogame.videogame_id
WHERE tournaments.year = 2016
GROUP BY videogames.id, videogames.[name],tournaments.[name]

SELECT videogames.[name], categories.[name]
FROM videogames
join category_videogame
ON videogames.id = category_videogame.videogame_id
join categories
ON category_videogame.category_id = categories.id

SELECT DISTINCT software_houses.[name]
FROM software_houses
join videogames
ON software_houses.id = videogames.software_house_id
WHERE year(videogames.release_date) > 2020

SELECT awards.[name],software_houses.[name]
FROM software_houses
join videogames
ON software_houses.id = videogames.software_house_id
join award_videogame
ON videogames.id = award_videogame.videogame_id
join awards
ON award_videogame.award_id = awards.id

SELECT categories.[name],pegi_labels.[name],videogames.[name]
FROM videogames
join category_videogame
ON videogames.id = category_videogame.videogame_id
join categories
ON category_videogame.category_id = categories.id
join pegi_label_videogame
ON videogames.id = pegi_label_videogame.videogame_id
join pegi_labels
ON pegi_label_videogame.pegi_label_id = pegi_labels.id
join reviews
ON videogames.id = reviews.videogame_id
WHERE reviews.rating > 3
GROUP BY categories.[name],pegi_labels.[name],videogames.[name]

SELECT DISTINCT videogames.id, videogames.name
FROM videogames
join tournament_videogame 
ON videogames.id = tournament_videogame.videogame_id
join tournaments 
ON tournament_videogame.tournament_id = tournaments.id
join player_tournament 
ON tournaments.id = player_tournament.tournament_id
join players 
ON player_tournament.player_id = players.id
WHERE players.name LIKE 'S%'

SELECT DISTINCT tournaments.city
FROM tournaments
join tournament_videogame 
ON tournaments.id = tournament_videogame.tournament_id
join videogames 
ON tournament_videogame.videogame_id = videogames.id
join award_videogame 
ON videogames.id = award_videogame.videogame_id
WHERE award_videogame.year = '2018'

SELECT DISTINCT players.nickname, tournaments.id
FROM players
join player_tournament 
ON players.id = player_tournament.player_id
join tournaments 
on player_tournament.tournament_id = tournaments.id
join tournament_videogame 
ON tournaments.id = tournament_videogame.tournament_id
join videogames 
ON tournament_videogame.videogame_id = videogames.id
join award_videogame 
ON videogames.id = award_videogame.videogame_id
WHERE tournaments.year = '2019'
and award_videogame.year = '2018'