# SQL select query exercise
#
# World database layout:
# To use this database from a default MySQL install, type: use world;
# Table: City
# Columns: Id,Name,CountryCode,District,Population
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage

USE world;

# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)
SELECT CONCAT('Hello ',SCHEMA_NAME,'!') AS Text, 123 AS Number FROM information_schema.schemata WHERE SCHEMA_NAME = 'world';

# 2: Get everything from the city table
# (Hint: Many many rows) (Only the first 100)
SELECT * FROM city LIMIT 0, 100;

# 3: Get everything on the cities whose district is "aceh"
# (Hint: 2 rows)
SELECT * FROM city WHERE District = 'aceh';

# 4: Get only the name of the cities where the countrycode is "bfa"
select Name from city where CountryCode = 'bfa';

# 5: Get both the name and district of the cities where the countrycode is "tto"
select Name, district from city where CountryCode = 'tto';

# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
select Name as nm, District as dist from city where CountryCode = 'arm';

# 7: Get the cities with a name that starts with "bor" (4 rows)
SELECT * FROM city WHERE Name LIKE 'Bor%';

# 8: Get the cities with a name that contains the string "orto" (7 rows)
SELECT * FROM city WHERE Name LIKE '%orto%';

# 9: Get the cities that has a population below 1000 (11 rows)
SELECT * FROM city WHERE population < 1000;

# 10: Get the unique countrycodes from the cities that has a population below 1000 (9 rows)
SELECT DISTINCT CountryCode FROM city WHERE population < 1000;

# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
SELECT * FROM city WHERE population > 1000000 and countrycode = 'ukr';

# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million) (7 rows)
SELECT * FROM city WHERE population > 9500000 OR population < 200;

# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM (7 rows)
SELECT * FROM city WHERE countrycode IN ('tjk','mrt','and','png','sjm');

# 14: Get the cities with a population between 200 and 700 inclusive (7 rows)
SELECT * FROM city WHERE population >= 200 AND population <= 700;

# 15: Get the countries with a population between 8000 and 20000 inclusive (8 rows)
SELECT * FROM country WHERE population >= 8000 AND population <= 20000;

# 16: Get the name of the countries with a independence year (indepyear) before year 0
select Name from country where IndepYear < 0;

# 17: Get the countries that has no recorded independence year and a population above 1000000
SELECT * FROM country WHERE IndepYear IS NULL AND Population > 1000000;

# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy (2 rows)
SELECT * FROM country WHERE SurfaceArea < 10 AND LifeExpectancy IS NOT NULL;
