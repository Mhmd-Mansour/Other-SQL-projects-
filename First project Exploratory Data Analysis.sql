# World Life Expectancy Exploratory Data Analysis



select *
from world_life_expectancy
;


select Country, 
min(`Life expectancy`), 
max(`Life expectancy`),
round(max(`Life expectancy`) - min(`Life expectancy`), 1) 
as Life_Increase_15_Years
from world_life_expectancy
group by Country
having min(`Life expectancy`) <> 0 
and max(`Life expectancy`) <> 0
order by Life_Increase_15_Years asc
;




select Year, round(avg(`Life expectancy`),2)
from world_life_expectancy
where `Life expectancy` <> 0 
and `Life expectancy` <> 0
group by year 
order by year 
;



select*
from world_life_expectancy
;



select Country, round(avg(`Life expectancy`),1) as Life_Exp, 
round(avg(GDP),1) as GDP
from world_life_expectancy
group by Country
having life_Exp > 0
and GDP > 0
order by GDP desc
;


select
sum(case when GDP >= 1500 then 1 else 0 end) as High_GDP_Count,
avg(case when GDP >= 1500 then `Life expectancy` else Null end) as High_GDP_Life_expectancy,
sum(case when GDP <= 1500 then 1 else 0 end) as Low_GDP_Count,
avg(case when GDP <= 1500 then `Life expectancy` else Null end) as Low_GDP_Life_expectancy
from world_life_expectancy
;


select *
from world_life_expectancy
;



select Status, round(avg(`Life expectancy`), 1)
from world_life_expectancy
group by Status
;



select Status, count(distinct Country), round(avg(`Life expectancy`), 1)
from world_life_expectancy
group by Status
;




select Country, round(avg(`Life expectancy`),1) as Life_Exp, 
round(avg(BMI),1) as BMI
from world_life_expectancy
group by Country
having life_Exp > 0
and BMI > 0
order by BMI asc
;




select Country, Year, `Life expectancy`, 
`Adult Mortality`, 
sum(`Adult Mortality`) over(partition by Country order by Year) as Rolling_Total
from world_life_expectancy
where Country like '%United%'
;




