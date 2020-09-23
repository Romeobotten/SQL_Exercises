# SQL Join exercise
#
Use world;
#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT * FROM City WHERE Name LIKE 'ping%' ORDER BY Population ASC;

# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT * FROM City WHERE Name LIKE 'ran%' ORDER BY Population DESC;

# 3: Count all cities (4079 in my world)
SELECT COUNT(*) AS NumberOfCities FROM City;

# 4: Get the average population of all cities 
SELECT AVG(Population) AS AveragePopulation FROM City;

# 5: Get the biggest population found in any of the cities
SELECT MAX(Population) AS BiggestCity FROM City;

# 6: Get the smallest population found in any of the cities
SELECT MIN(Population) AS SmallestCity FROM City;

# 7: Sum the population of all cities with a population below 10000
SELECT SUM(Population) AS SumSmallCities FROM City WHERE Population < 10000;

# 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(*) AS CitiesInMozambiqAndVietnam FROM City WHERE CountryCode IN ('MOZ','VNM');

# 9: Get individual count of cities for the countrycodes MOZ and VNM (34 cities)
SELECT CountryCode, COUNT(*) AS CitiesInMozambiqAndVietnam FROM City WHERE CountryCode IN ('MOZ','VNM') GROUP BY CountryCode;

# 10: Get average population of cities in MOZ and VNM (12 and 22)
SELECT AVG(Population) AS CitiesInMozambiqAndVietnam FROM City WHERE CountryCode IN ('MOZ','VNM');

# 11: Get the countrycodes with more than 200 cities
SELECT CountryCode, COUNT(*) AS Cities FROM City GROUP BY CountryCode HAVING COUNT(*) > 200;

# 12: Get the countrycodes with more than 200 cities ordered by city count (ascending or descending?)
SELECT CountryCode, COUNT(*) AS Cities FROM City GROUP BY CountryCode HAVING COUNT(*) > 200 ORDER BY COUNT(*);

# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT city.Name, countrylanguage.Language FROM City LEFT JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE Population BETWEEN 400 AND 500;

# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT city.Name, countrylanguage.Language FROM City LEFT JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE Population BETWEEN 500 AND 600;

# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself) (SWE med Norrköping, 15 rows)
SELECT * FROM City WHERE Countrycode IN(SELECT Countrycode FROM City WHERE Population = 122199);

# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself) (SWE utan Norrköping, 14 rows)
SELECT * FROM City WHERE Countrycode IN(SELECT Countrycode FROM City WHERE Population = 122199) AND NOT Population = 122199;

# 17: What are the city names in the country where Luanda is capital? (The hard way or the easy way?)
SELECT Name FROM City WHERE Countrycode IN(SELECT Countrycode FROM City WHERE Name = 'Luanda');
SELECT City.Name FROM City LEFT JOIN Country ON City.Countrycode = Country.Code WHERE Capital IN(SELECT Id FROM City WHERE Name = 'Luanda');

# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT ID, city.Name, Capital, country.Code FROM city LEFT JOIN country ON City.CountryCode = country.Code WHERE Region IN(SELECT Region FROM country WHERE Code IN(SELECT CountryCode FROM City WHERE Name = 'Yaren')) GROUP BY CountryCode HAVING ID = Capital;

# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT Language FROM city LEFT JOIN country ON City.CountryCode = country.Code LEFT JOIN countrylanguage ON City.CountryCode = countrylanguage.CountryCode WHERE Region IN(SELECT Region FROM country WHERE Code IN(SELECT CountryCode FROM City WHERE Name = 'Riga')) GROUP BY city.CountryCode;

# 20: Get the name of the most populous city
SELECT Name, MAX(population) AS Population FROM city;
