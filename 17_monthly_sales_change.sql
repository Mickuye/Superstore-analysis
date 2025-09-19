#17. What is the month-to-month percentage change in sales?
WITH table1 AS (
    SELECT YEAR(Order_Date) AS Year, MONTH(Order_Date) AS Month, MONTHNAME(Order_Date) AS Month_name, SUM(sales) AS sales
    FROM superstore_orders
    GROUP BY Year, Month, Month_name
    ORDER BY Year, Month
),
table2 AS (
    SELECT *,
           LAG(sales) OVER(PARTITION BY Year ORDER BY Month) AS Diff
    FROM table1
)
SELECT *, 
       ((sales - diff)/diff) * 100 AS Per_change_sales
FROM table2;
