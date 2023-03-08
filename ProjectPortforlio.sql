select *
from [Portfolio Project]..CovidDeaths
where continent is not null
order by 3,4

--select *
--from [Portfolio Project]..CovidVaccinations
--order by 3,4

Select Location, date, total_cases, new_cases, total_deaths, population
from [Portfolio Project]..CovidDeaths
order by 1,2

-- Looking at Total Cases Vs Total Deaths

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from [Portfolio Project]..CovidDeaths
Where location like '%Nigeria%'
order by 1,2 desc

-- Looking at Total cases Vs Population
-- shows what percentage of population got Covid

Select Location, date, Population, total_cases, (total_cases/Population)*100 as DeathPercentage
from [Portfolio Project]..CovidDeaths
Where location like '%Nigeria%'
order by 1,2 desc

-- looking at countries with highest infection rate compared to population

Select Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/Population))*100 as PercentPopulationInfected
from [Portfolio Project]..CovidDeaths
Group by location, population
order by PercentPopulationInfected desc

-- Showing Countries with Highest Death Count per population

Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
from [Portfolio Project]..CovidDeaths
where continent is not null
Group by location
order by TotaldeathCount desc

--	LET'S BREAK THINGS DOWN BY CONTINENT

-- Showing continents with Highest Death count per location

Select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from [Portfolio Project]..CovidDeaths
where continent is not null
Group by continent
order by TotaldeathCount desc


-- GLOBAL NUMBERS
