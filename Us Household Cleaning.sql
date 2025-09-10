# US Household Income Data Cleaning

SELECT * 
FROM us_project.us_household_income
;

SELECT * 
FROM us_project.us_household_income_statistics
;

# change column name:
alter table us_household_income_statistics rename column `ï»¿id` to `id`;


SELECT count(id)
FROM us_project.us_household_income
;

SELECT count(id)
FROM us_project.us_household_income_statistics
;



select id, count(id)
from us_household_income_statistics
group by id 
having count(id) > 1
;


select*
from (
	SELECT 
		row_id, 
		id, 
  ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) as row_num
FROM us_household_income) duplicates 
where row_num > 1
;




delete from us_household_income
where row_id in (
     select row_id
     from (
	       SELECT 
		row_id, 
		id, 
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY id) as row_num
		from us_household_income) duplicates 
where row_num > 1);



select id, count(id)
from us_household_income_statistics
group by id 
having count(id) > 1
;



select distinct State_Name
from us_household_income
order by 1
;




update us_household_income
set State_Name = 'Georgia'
where State_Name = 'georia';



update us_household_income
set State_Name = 'Alabama'
where State_Name = 'alabama';


select *
from us_household_income
;



select *
from us_household_income
where County = 'Autauga County'
order by 1
;



update us_household_income
set Place = 'Autaugaville'
where County = 'Autauga County'
and City = 'Vinemont'
;



select Type, count(Type)
from us_household_income
group by Type;



update us_household_income
set Type = 'Borough'
where Type = 'Boroughs'
;


select ALand, AWater
from us_household_income
where (AWater = 0 or AWater =  '' or AWater is NULL)
and  (ALand = 0 or ALand =  '' or ALand is NULL) 
;









