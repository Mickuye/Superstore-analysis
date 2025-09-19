#2. What is the average sales per order?
WITH table1 AS (
    SELECT Order_ID, SUM(sales) AS total_sales
    FROM superstore_orders
    GROUP BY Order_ID
)
SELECT AVG(total_sales) AS avg_sales
FROM table1;
