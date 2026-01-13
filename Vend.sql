create database vendor_analysis;
use vendor_analysis;
create table supply_data(Product_type varchar(30) , SKU varchar(10), Price decimal(10,2), Availablity int , 
Number_of_product_sold int , Revenue decimal(10,2) , Customer_demographics varchar(20) , stock_level int , lead_times int , order_quantities int , supplier_name varchar(30) , 
Costs decimal(10,3)) ;
select * from supply_data;
select supplier_name , sum(revenue - costs) as Profit from supply_data 
group by supplier_name 
order by profit;
select supplier_name , sum(revenue) as revenue from supply_data
group by supplier_name
order by revenue;
select supplier_name , sum(Revenue) - sum(Costs) as profit ,
sum(Revenue - Costs)/sum(revenue)*100 as profit_margin 
from supply_data
group by supplier_name
order by profit_margin;
SELECT CASE WHEN
order_quantities > 50 then 'bulk_order' 
else 'small_order'
end as order_type ,
round(sum(Costs)/ sum(order_quantities) ,2) as avg_cost
from supply_data
group by order_type;
Select supplier_name , sum(Number_of_product_sold)/sum(stock_level) as inventory_turnover
 from supply_data
 group by supplier_name;
 
 

