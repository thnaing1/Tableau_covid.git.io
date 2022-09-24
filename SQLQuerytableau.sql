/*
Queries used for Tableau Project
*/

-- continent
SELECT*
FROM porfolio_project.dbo.covid_deaths
WHERE continent IS NULL AND location NOT LIKE '%income%' AND location NOT IN ('World','European Union','International')
--AND (location <> 'Low income') OR (location <> 'Lower midd

-- income level
SELECT*
FROM porfolio_project.dbo.covid_deaths
WHERE continent IS NULL AND location LIKE '%income%' AND location NOT IN ('World','European Union','International')


-- 1. 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From porfolio_project.dbo.covid_deaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2


-- 2. 

-- We take these out as they are not inluded in the above queries and want to stay consistent
-- European Union is part of Europe

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From porfolio_project.dbo.covid_deaths
--Where location like '%states%'
WHERE continent IS NULL 
AND location NOT LIKE '%income%' 
AND location NOT IN ('World','European Union','International')
Group by location
order by TotalDeathCount desc


-- 3.

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From porfolio_project.dbo.covid_deaths
--Where location like '%states%'
Group by Location, Population
order by PercentPopulationInfected desc


-- 4.


Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From porfolio_project.dbo.covid_deaths
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc


-- 5 

Select location, SUM(cast(new_deaths as int)) as TotalDeathCount
From porfolio_project.dbo.covid_deaths
--Where location like '%states%'
WHERE continent IS NULL 
AND location LIKE '%income%' 
AND location NOT IN ('World','European Union','International')
Group by location
order by TotalDeathCount desc
