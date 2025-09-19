#9. What are the top 5 most profitable products?
SELECT Product_ID,
       MAX(Product_Name) AS Top_Profitable_Products,
       SUM(profit) AS Total_Profit
FROM superstore_orders 
GROUP BY Product_ID
ORDER BY Total_Profit DESC
LIMIT 5;
