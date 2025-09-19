#14. What is the percentage contribution of each category to total profit?
WITH table1 AS (
    SELECT category, SUM(profit) AS total_profit
    FROM superstore_orders
    GROUP BY category
),
table2 AS (
    SELECT SUM(total_profit) AS Grand_Profit
    FROM table1
)
SELECT table1.category,
       ROUND((table1.total_profit/ table2.Grand_Profit),2)*100 AS Per_contribution_profit
FROM table2 
CROSS JOIN table1;
