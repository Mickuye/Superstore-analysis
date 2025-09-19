#4. Which customer segment generates the highest sales and profit?
SELECT segment, SUM(sales) AS Total_Sales
FROM superstore_orders
GROUP BY segment
ORDER BY Total_Sales DESC;

SELECT segment, SUM(Profit) AS Total_Profit
FROM superstore_orders
GROUP BY segment
ORDER BY Total_Profit DESC;
