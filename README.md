# Superstore-analysis
End-to-end SQL analytics project using the Superstore dataset. Includes KPI reporting, customer segmentation, product and category performance, regional and shipping insights, as well as trend and profitability analysis, showcasing advanced SQL techniques such as CTEs, window functions, subqueries, and aggregation.
# 🛒 Superstore Data SQL Analysis

## 📊 Project Overview
This project delves into the widely-used **Superstore dataset** through SQL to address crucial business inquiries related to sales, profits, customers, products, and shipping.

The analysis emphasizes the following areas:
- Key performance indicators (Sales, Profit, Quantity, Discount)
- Insights into Customers & Segments
- Breakdown of Products & Categories
- Regional Analysis and Shipping Insights
- In-depth Trend Analysis and Contribution Evaluation




## 🛠️ SQL Techniques Used
- **Aggregate Functions**: SUM, AVG, COUNT, ROUND  
- **Grouping & Filtering**: GROUP BY, HAVING, WHERE  
- **Common Table Expressions (CTEs)**  
- **Window Functions**: LAG(), OVER(PARTITION BY …)  
- **Scalar Subqueries**  
- **Joins**: INNER, CROSS  

---

## 📑 Business Questions & SQL Solutions

### 🔹 Core KPI Queries

<details>
<summary>1. What is the total sales, profit, discount, and quantity across the dataset?</summary>

```sql
select round(sum(sales),0) as Total_Sales, 
       round(sum(profit),0) as Total_Profit, 
       round(sum(Discount),0) as Total_Discount, 
       round(sum(quantity),0) as Total_Quantity
from superstore_orders;
</details> <details> <summary>2. What is the average sales per order?</summary>
sql
Copy code
with table1 as(
    select Order_ID, sum(sales) as total_sales
    from superstore_orders
    group by Order_ID)
select avg(total_sales) as avg_sales
from table1;
</details> <details> <summary>3. How many transactions (orders) are in the dataset?</summary>
sql
Copy code
select count(distinct Order_ID) as total_orders
from superstore_orders;
</details>

🔹 **Customer & Segment Analysis**
<details> <summary>4. Which customer segment generates the highest sales and profit?</summary>
sql
Copy code
select segment, sum(sales) as Total_Sales
from superstore_orders
group by segment
order by Total_Sales DESC;

select segment, sum(Profit) as Total_Profit
from superstore_orders
group by segment
order by Total_Profit DESC;
</details> <details> <summary>5. Who are the top 10 customers by sales?</summary>
sql
Copy code
select Customer_Name, sum(sales) as Total_Sales
from superstore_orders
group by customer_name
order by Total_Sales DESC
limit 10;
</details> <details> <summary>6. What is the average order value per segment?</summary>
sql
Copy code
with table1 as (
    select Order_ID, segment, sum(sales) as Total_sales
    from superstore_orders
    group by Order_ID, segment
)
select segment, avg(Total_sales) as Avg_order
from table1
group by segment;
</details>

🔹 **Product & Category Analysis**
<details> <summary>7. What is the sales and profit breakdown by product category?</summary>
sql
Copy code
select Category,
       round(sum(sales),0) as Total_sales,
       round(sum(profit),0) as Total_profit
from superstore_orders
group by category;
</details> <details> <summary>8. Which sub-category has the highest profit margin?</summary>
sql
Copy code
select sub_category,
       sum(profit)/sum(sales) *100 as profit_margin   
from superstore_orders
group by sub_category
order by Profit_margin desc;
</details> <details> <summary>9. What are the top 5 most profitable products?</summary>
sql
Copy code
select Product_ID,
       max(Product_Name) as Top_Profitable_Products,
       sum(profit) as Total_Profit
from superstore_orders 
group by Product_ID
order by Total_Profit desc
limit 5;
</details>

🔹 **Regional & Shipping Analysis**
<details> <summary>10. What is the sales and profit breakdown by region?</summary>
sql
Copy code
select region,
       sum(Sales) as Total_Sales,
       sum(profit) as Total_Profit,
       sum(profit)/sum(Sales)*100 as Profit_margin
from superstore_orders
group by region;
</details> <details> <summary>11. Which shipping mode has the highest average sales per order?</summary>
sql
Copy code
with table1 as (
    select Order_ID, Ship_mode, sum(sales) as Total_Sales
    from superstore_orders
    group by Order_ID, Ship_Mode)
select Ship_mode, avg(total_sales) as Avg_Sales
from table1
group by ship_mode
order by Avg_Sales desc;
</details> <details> <summary>12. Which state contributes the most to sales?</summary>
sql
Copy code
select State, sum(sales) as Total_Sales
from superstore_orders
group by State
order by Total_Sales desc
limit 10;
</details>

🔹**Advanced Insights**
<details> <summary>13. What is the yearly trend of sales and profit?</summary>
sql
Copy code
with table1 as (
    select Year(order_date) as Year, 
           sum(sales) as Total_Sales, 
           sum(profit) as Total_profit
    from superstore_orders
    group by Year
    order by Year),
table2 as (
    select Year, Total_Sales,Total_profit,
           lag(Total_Sales) over(order by Year) as Lag_Sales,
           lag(Total_profit) over(order by Year) as Lag_Profit
    from table1)
select Year, Total_Sales,Total_profit,
      round((Total_Sales-Lag_Sales)/Lag_Sales,2) * 100 as Sales_Trend,
      round((Total_profit-Lag_profit)/Lag_Profit,2) * 100 as Profit_Trend
from table2;
</details> <details> <summary>14. What is the percentage contribution of each category to total profit?</summary>
sql
Copy code
select Category,
       sum(Profit) / (select sum(profit) from superstore_orders) * 100 as percentage
from superstore_orders
group by Category;
</details> <details> <summary>15. Which orders had negative profit, and what categories/sub-categories do they belong to?</summary>
sql
Copy code
select Order_id, Category, Sub_Category, Profit
from superstore_orders
where profit < 0;
</details> <details> <summary>16. What is the month-to-month percentage change in profit?</summary>
sql
Copy code
with table1 as (
    select Year(order_date) as Year, month(order_date) as month, 
           monthname(order_date) as month_name, sum(profit) as profit
    from superstore_orders
    group by Year, month, month_name
    order by year),
table2 as (
    select *,
        lag(profit) over(partition by year order by month) as Diff
    from table1)
select *, 
       ((profit - diff)/diff) * 100 as Per_change_profit
from table2;
</details> <details> <summary>17. What is the month-to-month percentage change in sales?</summary>
sql
Copy code
with table1 as (
    select Year(order_date) as Year, month(order_date) as month, 
           monthname(order_date) as month_name, sum(sales) as sales
    from superstore_orders
    group by Year, month, month_name
    order by year),
table2 as (
    select *,
        lag(sales) over(partition by year order by month) as Diff
    from table1)
select *, 
       ((sales - diff)/diff) * 100 as Per_change_sales
from table2;
</details> ```
