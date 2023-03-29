--SELECT--

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