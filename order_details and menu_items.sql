use `restaurant orders`; 

select *
from menu_items;

select*
from order_details;


# Combine the menu_items and order_details tables into a single table

select *
from order_details as od 
left join menu_items as mi 
on od.item_id = mi.ï»¿menu_item_id
;

# What were the least and most ordered items?

select item_name, count(ï»¿order_details_id) as num_purchases
from order_details as od 
left join menu_items as mi 
on od.item_id = mi.ï»¿menu_item_id
group by item_name
order by num_purchases desc;

# What categories were they in?
select item_name, category, count(ï»¿order_details_id) as num_purchases
from order_details as od 
left join menu_items as mi 
on od.item_id = mi.ï»¿menu_item_id
group by item_name, category 
order by num_purchases desc;


-- # What were the top 5 orders that spent the most money?
select order_id, round(sum(price),2) as total_spend
from order_details as od 
left join menu_items as mi 
on od.item_id = mi.ï»¿menu_item_id
group by order_id
order by total_spend desc
limit 5;




# View the details of the highest spend order. Which specific items were purchased?

select category, count(item_id) as num_items
from order_details as od 
left join menu_items as mi 
on od.item_id = mi.ï»¿menu_item_id
where order_id = 440
group by category;





# BONUS: View the details of the top 5 highest spend orders

select order_id, category, count(item_id) as num_items
from order_details as od 
left join menu_items as mi 
on od.item_id = mi.ï»¿menu_item_id
where order_id in (440, 2075, 1957, 330, 2675)
group by order_id, category;




# order_id, total_spend
'440', '192.15'
'2075', '191.05'
'1957', '190.1'
'330', '189.7'
'2675', '185.1'



