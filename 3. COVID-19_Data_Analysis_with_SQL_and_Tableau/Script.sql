
--Reviewing the data in the tables

SELECT * FROM covid_deaths_csv cdc
 
SELECT * FROM covid_vaccination_csv  


--Selecting the data we are going to use from the deaths table

SELECT location , date , population , total_cases , new_cases , total_deaths  
FROM covid_deaths_csv cdc 
ORDER BY location 

-- **** BREAKING THINGS DOWN BY COUNTRIES ****

-- Country with Maximum death cases

SELECT location, continent,  population , total_cases , MAX(CAST(total_deaths as int)) as total_deaths_count 
FROM covid_deaths_csv
WHERE continent IS NOT ''

-- Country with highest infected Cases

SELECT  location,continent  population , total_cases , MAX(CAST(total_cases  as int)) as total_cases_count 
FROM covid_deaths_csv
WHERE continent IS NOT ''

--Calculating the mortality rate

SELECT location , date , population , total_cases , total_deaths , (total_deaths*1.0)/total_cases as mortality_rate 
FROM covid_deaths_csv 
ORDER BY location

-- Getting the mortality rate in Africa

SELECT location , date , population , total_cases , total_deaths , (total_deaths*1.0)/total_cases as mortality_rate 
FROM covid_deaths_csv 
WHERE location LIKE '%Africa%' AND continent  NOTNULL


--Getting the mortality rate in USA

SELECT location , date , population , total_cases , total_deaths , (total_deaths*1.0)/total_cases as mortality_rate 
FROM covid_deaths_csv 
WHERE location LIKE '%States%'


-- Calculating the infection rate 

SELECT location , date , population , total_cases , (total_cases *1.0)/population  as infection_rate 
FROM covid_deaths_csv 
ORDER BY location , date

--Highest infection_rate 

SELECT location , date , population , total_cases , MAX((total_cases *1.0)/population) as highest_infection_rate
FROM covid_deaths_csv 
WHERE date = "2022-02-17"

--Lowest infection_rate at the recent date
 
SELECT location , date , population , total_cases , MIN((total_cases *1.0)/population) lowest_infection_rate
FROM covid_deaths_csv
WHERE date = "2022-02-17"

--Highest Mortality rate

SELECT location , date , population , total_cases , MAX((total_deaths  *1.0)/total_cases) as highest_death_rate
FROM covid_deaths_csv 
WHERE date = "2022-02-17"

--Lowest mortality rate

SELECT location , date , population , total_cases , MIN((total_deaths  *1.0)/total_cases) as lowest_death_rate
FROM covid_deaths_csv 
WHERE date = "2022-02-17"


--List of countries arrnged according to the Infection rate up to 17/02/2022

SELECT location , population , total_cases , total_cases *1.0/population as infection_rate
FROM covid_deaths_csv
WHERE date = "2022-02-17" AND continent IS NOT ''
ORDER BY infection_rate DESC 

--List of countries arrnged according to the mortality rate up to 17/02/2022

SELECT location , population , total_cases , total_deaths  *1.0/total_cases  as mortality_rate
FROM covid_deaths_csv
WHERE date = "2022-02-17" AND continent IS NOT ''
ORDER BY mortality_rate  DESC 

-- **** BREAKING THINGS DOWN BY CONTINENT ****


--List of continent arrnged according to the Infection rate up to 17/02/2022

SELECT location , population , total_cases , total_cases *1.0/population as infection_rate
FROM covid_deaths_csv
WHERE date = "2022-02-17" AND continent IS '' AND location  NOT LIKE '%income%'
ORDER BY infection_rate DESC 

--List of countries arrnged according to the mortality rate up to 17/02/2022

SELECT location , population , total_cases , total_deaths  *1.0/total_cases  as mortality_rate
FROM covid_deaths_csv
WHERE date = "2022-02-17" AND continent IS '' AND location  NOT LIKE '%income%'
ORDER BY mortality_rate  DESC 


--SOME GLOBAL NUMBERS

--The mumber of new cases & new deaths around the world from the begining of the pandemic due date 

SELECT date  , SUM(new_cases) as total_new_cases ,SUM(new_deaths)as total_new_deaths 
FROM covid_deaths_csv cdc 
WHERE continent is not ''
GROUP BY date 

--Death infection rate & mortality rate globally day by DAY 

SELECT date  , SUM(total_cases),  SUM(total_cases*1.0)/SUM(population)  as inf_rate ,SUM(total_deaths) ,SUM(total_deaths*1.0)/SUM(total_cases) as motality_rate 
FROM covid_deaths_csv cdc 
WHERE continent is not ''
GROUP BY date 

--Overall infection rate and mortality rate

SELECT location , date ,SUM(total_cases),SUM(total_cases*1.0)/SUM(population)  as inf_rate,
	SUM(total_deaths) ,SUM(total_deaths*1.0)/SUM(total_cases) as motality_rate
FROM covid_deaths_csv cdc
WHERE location IS  'World' AND date ="2022-02-17"


--NOW ANALYZING THE VACCINATION DATA

SELECT * FROM covid_vaccination_csv 
WHERE continent IS NOT '' AND location LIKE '%states%'


-- Vaccination status for each country day by day

WITH vacc_table(location ,population, date, total_tests ,people_vaccinated,vaccinated_percentage,people_fully_vaccinated )
AS(
SELECT  location ,population, date, total_tests ,people_vaccinated ,
	(people_vaccinated *1.0)/population *100 as vaccinated_percentage,people_fully_vaccinated 
FROM covid_vaccination_csv cvc 
WHERE continent IS NOT ''
ORDER BY location 
)
SELECT * FROM vacc_table


-- Vaccination in USA

SELECT  location ,population, date, total_tests ,people_vaccinated ,
	(people_vaccinated *1.0)/population *100 as vaccinated_percentage, (people_fully_vaccinated*1.0)/population as fully_vaccinated_percentage 
FROM covid_vaccination_csv cvc 
WHERE continent IS NOT '' AND location LIKE '%states%'

--List of countries according to vaccinated people and fully vaccinated

SELECT  location ,continent ,population ,MAX(CAST(people_vaccinated as int)) as total_vaccinated,
	MAX(CAST(people_vaccinated as int))*1.0/population as percentage_vacc,
	MAX(CAST(people_fully_vaccinated  as int)) as fully_vaccinated,
	MAX(CAST(people_fully_vaccinated  as int))*1.0/population as percentage_fully_vacc
FROM covid_vaccination_csv 
WHERE continent IS NOT ""
GROUP BY location 
ORDER BY percentage_vacc DESC 



















