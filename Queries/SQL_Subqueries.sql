-- Exercises Tasks
-- 1) List each country name where the population is larger than that of 'Russia'.
-- 2) Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
-- 3) List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country. 
-- 4) Which country has a population that is more than United Kingom but less than Germany? Show the name and the population.
-- 5) Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
-- 6) Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
-- 7) Find the largest country (by area) in each continent, show the continent, the name and the area:
-- 8) List each continent and the name of the country that comes first alphabetically.
-- 9) Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
-- 10) Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.


-- Exercises
-- 1) List each country name where the population is larger than that of 'Russia'.
SELECT name 
FROM world
WHERE population > (SELECT population
                    FROM world 
                    WHERE name='Russia')

-- 2) Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM world
WHERE continent = 'Europe' AND 
      gdp/population > (SELECT gdp/population
                        FROM world 
                        WHERE name = 'United Kingdom')

-- 3) List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.                   
SELECT name, continent
FROM world
WHERE continent IN (SELECT continent
                    FROM world 
                    WHERE name IN ('Argentina', 'Australia'))
ORDER BY name

-- 4) Which country has a population that is more than United Kingom but less than Germany? Show the name and the population.
SELECT name, population
FROM world
WHERE population > (SELECT population
                    FROM world 
                    WHERE name='United Kingdom') 
AND
      population < (SELECT population
                    FROM world 
                    WHERE name='Germany')

-- 5) Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
-- Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.
-- The format should be Name, Percentage for example: 
-- name	    percentage
-- Albania	3%
-- Andorra	0%
-- Austria	11%
-- ...      ...

SELECT name, CONCAT(CONVERT(DECIMAL(10,0), population/(SELECT population FROM world WHERE name='Germany')*100), '%') AS percentage
FROM world 
WHERE continent = 'Europe'

-- 6) Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
FROM world
WHERE GDP > ALL(SELECT GDP                                    -- We can use the word ALL to allow >= or > or < or <= to act over a list.
                FROM world
                WHERE continent = 'Europe' 
                      AND GDP IS NOT NULL)

-- 7) Find the largest country (by area) in each continent, show the continent, the name and the area:
SELECT continent, name, area 
FROM world AS world1
WHERE area >= ALL(SELECT area                                 -- If '>' is used no country will it be return
                  FROM world AS world2                        -- Using alias to identify each table (i.e., world1, world2)
                  WHERE world2.continent = world1.continent   -- Filtering will occur only inside of each continent
                        AND area > 0)                         -- 'AND area IS NOT NULL', will return the same result      

-- 8) List each continent and the name of the country that comes first alphabetically.
SELECT continent, name 
FROM world AS world1
WHERE name  IN (SELECT TOP 1 name                              -- Select the first alphabetically
                FROM world AS world2 
                WHERE world2.continent = world1.continent)     -- Filtering will occur only inside of each continent
ORDER BY world1.name

-- 9) Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population
FROM world AS world1
WHERE world1.name IN (SELECT name 
                      FROM world AS world2  
                      WHERE world2.continent IN (SELECT continent
                                                 FROM world AS world3
                                                 GROUP BY continent   
                                                 HAVING MAX(world3.population) <= 25000000))
            
-- 10) Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent
FROM world AS world1
WHERE population >= ALL(SELECT 3*population
                        FROM world AS world2
                        WHERE world2.continent = world1.continent    -- Comparations are made within continents but between different countries
                              AND world2.name <> world1.name)               