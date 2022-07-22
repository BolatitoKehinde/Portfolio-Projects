select *
from [Portfolio Project]..Death
where continent is not null
order by 3,4

--select *
--from [Portfolio Project]..[Vacciation Data]
--order by 3,4




--Total Cases vs Total Death
select Location, date, total_cases, new_cases,total_deaths, population
from [Portfolio Project]..Death
and continent is not null
order by 1,2

--by continent
select Location, date, total_cases, new_cases,total_deaths, population
from [Portfolio Project]..Death
WHere continent is not null
order by 1,2


--Total Cases vs Population 

select Location, date,population, total_cases, (total_cases/population)* 100 as PercentageofPopulation
from [Portfolio Project]..Death
where location like 'Nigeria'
and continent is not null
order by 1,2

--by continent
select Location, date,population, total_cases, (total_cases/population)* 100 as PercentageofPopulation
from [Portfolio Project]..Death
where continent is not null
order by 1,2



--Country with highest infection Rate

select Location,population, Max(total_cases) as HigestInfectionCount, Max(total_cases/population)* 100 as PercentPopulationInfected
from [Portfolio Project]..Death
where continent is not null
group by Location,population
order by 4 desc


--Showing the countires with Highest Death Count per Population

select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
from [Portfolio Project]..Death
where continent is not null
group by Location
order by 2 desc

--Continent with highest death

select continent, MAX(cast(total_deaths as int)) as TotalDeathCount
from [Portfolio Project]..Death
where continent is not null
group by continent
order by 2 desc



-- Global Numbers per day

select date, sum(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, sum(cast(new_deaths as int)) /sum(new_cases)*100 as DeathPercentage
from [Portfolio Project]..Death
where continent is not null
group by date
order by 1,2

--Gloal Number 
select  sum(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeath, sum(cast(new_deaths as int)) /sum(new_cases)*100 as DeathPercentage
from [Portfolio Project]..Death
where continent is not null
order by 1,2


--Looking at total population vs vaccinations (combining table)


--select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
--,Sum(cast(vac.new_vaccinations as int)) over (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
--from Death Dea
--join [Vacciation Data] Vac
--	on Dea.location = Vac.location
--	and Dea.date = Vac.date
--where dea.continent is not null
--order by 2,3


--Creating View to store data for later visualizations

create view CasePerDay as
select date, sum(new_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths, sum(cast(new_deaths as int)) /sum(new_cases)*100 as DeathPercentage
from [Portfolio Project]..Death
where continent is not null
group by date
--order by 1,2










