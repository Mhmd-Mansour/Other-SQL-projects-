
use `restaurant orders` ;

## find the number if items on the menu = (32)
select count(*)
from menu_items
;

## What are the least and most expensive items on the menu?
# the least expensive item on the menu   =  ('Edamame' : '5') 
SELECT *
FROM menu_items
order by price 
;
# the most expensive item on the menu  = ('Shrimp Scampi' : '19.95')
SELECT *
FROM menu_items
order by price desc
;

# -----------------------------------------------------------------------------------#
## How many Italian dishes are on the menu?   (9)

SELECT count(*)
FROM menu_items
where category = 'Italian'
;

## What are the least and most expensive Italian dishes on the menu?
## most expensive = 'Shrimp Scampi' : '19.95'
SELECT *
FROM menu_items
where category = 'Italian'
order by price desc
;

## least expensive =  'Spaghetti' : '14.5', 'Fettuccine Alfredo' : '14.5'
SELECT *
FROM menu_items
where category = 'Italian'
order by price 
;

# -----------------------------------------------------------------------------------#

# How many dishes are in each category? 
SELECT  category, count(category)
FROM menu_items
group by category
order by count(category) desc
;


# What is the average dish price within each category?
select category, avg(price)
from menu_items 
group by category
order by avg(price) desc
;

