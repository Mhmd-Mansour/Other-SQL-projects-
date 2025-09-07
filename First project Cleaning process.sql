# world life Expectancy Project (Data Cleaning)


SELECT * 
FROM world_life_expectancy
;



SELECT Country, Year, concat(Country, Year), count(concat(Country, Year))
FROM world_life_expectancy
group by Country, Year, concat(country, Year)
having count(concat(Country, Year)) > 1

;


select *
from(
	select Row_ID, 
	concat(Country, Year),
	row_number() over(partition by concat(Country, Year) 
	order by concat(Country, Year)) as Row_Num
	from world_life_expectancy
    ) as Row_table 
where Row_Num > 1
;



delete from world_life_expectancy
where 
	Row_ID in (
    select Row_ID
from(
	select Row_ID, 
	concat(Country, Year),
	row_number() over(partition by concat(Country, Year) 
	order by concat(Country, Year)) as Row_Num
	from world_life_expectancy
    ) as Row_table 
where Row_Num > 1
)
;


SELECT * 
FROM world_life_expectancy
where Status = ''
;




SELECT distinct(Status)
FROM world_life_expectancy
where Status <>''
;



select distinct(Country)
from world_life_expectancy
where Status = 'Developing'
;


update world_life_expectancy 
set status = 'Developing'
where Country in (select distinct (Country)
				from world_life_expectancy
				where Status = 'Developing')
;



update world_life_expectancy as t1
join world_life_expectancy as t2
	on t1.Country = t2.Country
set t1.Status = 'Developing'
where t1.Status = ''
and t2.Status <> ''
and t2.Status = 'Developing'
;





select *
from world_life_expectancy
where Country = 'United States of America'
;






update world_life_expectancy as t1
join world_life_expectancy as t2
	on t1.Country = t2.Country
set t1.Status = 'Developed'
where t1.Status = ''
and t2.Status <> ''
and t2.Status = 'Developed'
;




select *
from world_life_expectancy
where `Life expectancy` = ''
;



select Country, Year, `Life expectancy`
from world_life_expectancy
#where `Life expectancy` = ''
;




select t1.Country, t1.Year, t1.`Life expectancy`, 
t2.Country, t2.Year, t2.`Life expectancy`,
t3.Country, t3.Year, t3.`Life expectancy`,
round((t2.`Life expectancy` + t3.`Life expectancy`)/2, 1)
from world_life_expectancy as t1
join world_life_expectancy as t2
	on t1.Country = t2.Country
    and t1.year = t2.Year - 1
join world_life_expectancy as t3
	on t1.Country = t3.Country
    and t1.year = t3.Year + 1
where t1.`Life expectancy` = ''
    
;


update world_life_expectancy as t1
join world_life_expectancy as t2
	on t1.Country = t2.Country
    and t1.year = t2.Year - 1
join world_life_expectancy as t3
	on t1.Country = t3.Country
    and t1.year = t3.Year + 1
set t1.`Life expectancy` = round((t2.`Life expectancy` + t3.`Life expectancy`)/2, 1)
where t1.`Life expectancy` = ''
;



select *
from world_life_expectancy
#where `Life expectancy` = ''
;





