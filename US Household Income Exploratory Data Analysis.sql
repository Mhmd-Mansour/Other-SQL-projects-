# US Household Income Exploratory Data Analysis


select *
from us_household_income
;


select *
from us_household_income_statistics
;




select State_Name, sum(ALand), sum(AWater)
from us_household_income
group by State_Name
order by 2 desc
limit 10
;



select State_Name, sum(ALand), sum(AWater)
from us_household_income
group by State_Name
order by 3 desc
limit 10
;


select *
from us_household_income as u
inner join us_household_income_statistics as us
on u.id = us.id
where mean <> 0
;


select u.State_Name, round(avg(Mean), 1), round(avg(Median), 1)
from us_household_income as u
inner join us_household_income_statistics as us
on u.id = us.id
where mean <> 0
group by u.State_Name
order by 3 desc
limit 10
;

select Type, count(Type), round(avg(Mean), 1), round(avg(Median), 1)
from us_household_income as u
inner join us_household_income_statistics as us
on u.id = us.id
where mean <> 0
group by Type
having count(Type) > 100
order by 4 desc
limit 20
;


select*
from us_household_income
where Type = 'Community'
;


select u.State_Name, City, round(Avg(Mean), 1), round(avg(Median),1)
from us_household_income as u
join us_household_income_statistics as us 
on u.id = us.id
group by u.State_Name, City
order by round(Avg(Mean), 1) desc
;




