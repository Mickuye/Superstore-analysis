#7. What is the sales and profit breakdown by product category?
SELECT Category,
       ROUND(SUM(sales),0) AS Total_sales,
       ROUND(SUM(profit),0) AS Total_profit
FROM superstore_orders
GROUP BY category;
