create database netflix_db;
use netflix_db;

select * from netflix_titles limit 5;

alter table netflix_titles
rename to netflix;

SET SQL_SAFE_UPDATES = 0;

UPDATE netflix
SET country = 'Unknown'
WHERE country IS NULL OR country = '';

UPDATE netflix
SET director = 'Unknown'
WHERE director IS NULL OR director = '';

UPDATE netflix
SET cast = 'Not Available'
WHERE cast IS NULL OR cast = '';

UPDATE netflix
SET rating = 'Not Rated'
WHERE rating IS NULL OR rating = '';

SELECT type, COUNT(*) AS total_content 
FROM netflix
GROUP BY type
ORDER BY total_content DESC;

SELECT release_year, type, COUNT(*) AS total 
FROM netflix
GROUP BY release_year, type
ORDER BY release_year;

SELECT listed_in, COUNT(*) AS total
FROM netflix
GROUP BY listed_in
ORDER BY total DESC
LIMIT 10;

SELECT title, duration
FROM netflix
WHERE type = 'Movie';

SELECT title, release_year,
       ROW_NUMBER() OVER (ORDER BY release_year DESC) AS row_num
FROM netflix
WHERE type = 'Movie';

SELECT country, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
GROUP BY country
ORDER BY total_movies DESC;

SELECT country, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
GROUP BY country
HAVING COUNT(*) > 10
ORDER BY total_movies DESC;

SELECT title, release_year
FROM netflix
WHERE type = 'Movie'
ORDER BY release_year DESC
LIMIT 5;

SELECT title, duration
FROM netflix
WHERE type = 'Movie'
ORDER BY duration DESC
LIMIT 1;

CREATE VIEW movie_count_by_country AS
SELECT country, COUNT(*) AS total_movies
FROM netflix
WHERE type = 'Movie'
GROUP BY country;

SELECT *
FROM movie_count_by_country
ORDER BY total_movies DESC;
