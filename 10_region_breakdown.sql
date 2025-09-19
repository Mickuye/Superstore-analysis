#10. What is the sales and profit breakdown by region?
SELECT region,
       SUM(Sales) AS Total_Sales,
       SUM(profit) AS Total_Profit,
       SUM(profit)/SUM(Sales)*100 AS Profit_margin
FROM superstore_orders
GROUP BY region;
