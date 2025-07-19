-- netflix project

drop table if exists Netflix;

create table Netflix
(show_id varchar(10),
type varchar(20),
title varchar(200),
director varchar(250),
casts varchar(1500),
country varchar(150),
date_added varchar(80),
release_year int,
rating varchar(30),
duration varchar(20),
listed_in varchar(150),
description varchar(300)
);


select * from Netflix;

select count(*) as Total_content from Netflix;

select distinct type from Netflix;

-- Q-1  Count the no of movies vs TV shows

select type,count(*) as Total_Content
from Netflix
group by type;

-- Q-2 find the top 5 countries with the most content on netflix

select country,
count(show_id) as total_content
from Netflix
group by 1
order by 2 desc
limit 5;


-- Q-3 List all movies release in 2020 (specific year)

select * from netflix
where type='Movie'
and
release_year=2020;


-- Q-4 List All Tv shows with more than 5 seasons

select *
from netflix
where
  type='TV Show'
  and
  split_part(duration,' ',1)::numeric > 5


-- Q-5 'Salman Khan appeared movies in last 15 years'

select * from Netflix
where casts like '%Salman Khan%'
and release_year > EXTRACT(year from current_date)-15;
