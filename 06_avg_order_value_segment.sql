#6. What is the average order value per segment?
WITH table1 AS (
    SELECT Order_ID, segment, SUM(sales) AS Total_sales
    FROM superstore_orders
    GROUP BY Order_ID, segment
)
SELECT segment, AVG(Total_sales) AS Avg_order
FROM table1
GROUP BY segment;
