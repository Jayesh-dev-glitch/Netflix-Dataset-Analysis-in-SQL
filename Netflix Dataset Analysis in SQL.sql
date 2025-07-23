create database netflix;
use netflix;

select * from titles;

-- Count total number of records
select count(*) as total_records
from titles;

-- Distribution of Type
select type,count(*) as count
from titles
group by type
order by count desc;

-- Distribution of rating
select rating,count(*) as count
from titles
group by rating
order by count desc;

-- Distribution of release_year
select release_year,count(*) as count
from titles
group by release_year
order by release_year;

-- Top 10 Most Common Directors
select director,count(*) as count
from titles
group by director
order by count desc
limit 10;

-- Top 10 Countries
select country,count(*) as count
from titles
group by country
order by count desc
limit 10;

-- Records added per month
select date_format(str_to_date(date_added,'%b %d,%Y'),'%Y-%m') as month,count(*) as count
from titles
group by month
order by month;

-- Records added per year
select year(str_to_date(date_added,'%b,%d,%Y')) as year,count(*) as count
from titles
group by year
order by year;

-- Count dramas records
select count(*) as count
from titles
where listed_in like '%dramas%';

-- Average duration of movies/shows
select avg(cast(substring_index(duration,' ',1) as unsigned)) as average_duration
from titles
where duration regexp '^[0-9]+ min$';  

-- Find records with No director info
select count(*) as count
from titles
where director="";

-- Records released in last 5 years
select *
from titles
where release_year>=year(curdate())-5;

-- Records for india country
select type,title
from titles
where country='india';

-- Find records which have seasons
select *
from titles
where duration like '%seasons%';

-- Records which have more than 2 seasons
select *
from titles
where duration like '%seasons%'
and cast(substring_index(substring_index(duration,' ',1),' ',-1) as unsigned)>2;

    