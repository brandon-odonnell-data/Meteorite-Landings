/* 
PROJECT: Meteorite Landings Exploration and Analysis in SQL
*/

--Exploratory queries
SELECT *
FROM Project_Meteorite_Landings..meteorite_landings
--WHERE year IS NOT NULL AND year = '2101'
ORDER BY year DESC;

/*
Looking at maximum and minimum years.
Year 2101 is associated with the 'Northwest Africe 7701' meteorite; research indicates this year should be 2010.
Year 860 is associated with the 'Nogata' meteorite; research indicates this year is correct.
*/
SELECT
	MAX(year) as max_year,
	MIN(year) as min_year
FROM Project_Meteorite_Landings..meteorite_landings;

--Replace 'Northwest Africe 7701' meteorite year with 2010.
UPDATE
    Project_Meteorite_Landings..meteorite_landings
SET
    year = REPLACE(year,'2101','2010');

--Looking at maximum masses.
SELECT TOP 1 *
FROM Project_Meteorite_Landings..meteorite_landings
ORDER BY massgrams DESC;

--Looking at minimum masses.
SELECT TOP 1 *
FROM Project_Meteorite_Landings..meteorite_landings
WHERE massgrams IS NOT NULL AND massgrams != '0'
ORDER BY massgrams ASC;

--Looking at numbers that were seen falling and that were found.
SELECT
	COUNT(fall) AS total_found
FROM Project_Meteorite_Landings..meteorite_landings
WHERE fall = 'Found' AND fall IS NOT NULL;

SELECT
	COUNT(fall) AS total_fallen
FROM Project_Meteorite_Landings..meteorite_landings
WHERE fall = 'Fell' AND fall IS NOT NULL;