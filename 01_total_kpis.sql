#1. What is the total sales, profit, discount, and quantity across the dataset?
SELECT ROUND(SUM(sales),0) AS Total_Sales, 
       ROUND(SUM(profit),0) AS Total_Profit, 
       ROUND(SUM(Discount),0) AS Total_Discount, 
       ROUND(SUM(quantity),0) AS Total_Quantity
FROM superstore_orders;
