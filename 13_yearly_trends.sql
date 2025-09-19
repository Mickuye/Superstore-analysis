#13. What is the yearly trend of sales and profit?
WITH table1 AS (
    SELECT YEAR(order_date) AS Year, 
           SUM(sales) AS Total_Sales, 
           SUM(profit) AS Total_profit
    FROM superstore_orders
    GROUP BY Year
    ORDER BY Year
),
table2 AS (
    SELECT Year, Total_Sales, Total_profit,
           LAG(Total_Sales) OVER(ORDER BY Year) AS Lag_Sales,
           LAG(Total_profit) OVER(ORDER BY Year) AS Lag_Profit
    FROM table1
)
SELECT Year, Total_Sales, Total_profit,
       ROUND((Total_Sales-Lag_Sales)/Lag_Sales,2) * 100 AS Sales_Trend,
       ROUND((Total_profit-Lag_profit)/Lag_Profit,2) * 100 AS Profit_Trend
FROM table2;
