#11. Which shipping mode has the highest average sales per order?
WITH table1 AS (
    SELECT Order_ID, Ship_mode, SUM(sales) AS Total_Sales
    FROM superstore_orders
    GROUP BY Order_ID, Ship_Mode
)
SELECT Ship_mode, AVG(total_sales) AS Avg_Sales
FROM table1
GROUP BY ship_mode
ORDER BY Avg_Sales DESC;
