#5. Who are the top 10 customers by sales?
SELECT Customer_Name, SUM(sales) AS Total_Sales
FROM superstore_orders
GROUP BY customer_name
ORDER BY Total_Sales DESC
LIMIT 10;
