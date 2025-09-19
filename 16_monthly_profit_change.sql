#16. What is the month-to-month percentage change in profit?
WITH table1 AS (
    SELECT YEAR(Order_Date) AS Year, MONTH(Order_Date) AS Month, MONTHNAME(Order_Date) AS Month_name, SUM(profit) AS profit
    FROM superstore_orders
    GROUP BY Year, Month, Month_name
    ORDER BY Year, Month
),
table2 AS (
    SELECT *,
           LAG(profit) OVER(PARTITION BY Year ORDER BY Month) AS Diff
    FROM table1
)
SELECT *, 
       ((profit - diff)/diff) * 100 AS Per_change_profit
FROM table2;
