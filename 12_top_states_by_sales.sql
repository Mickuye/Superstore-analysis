#12. Which state contributes the most to sales?
SELECT State, SUM(sales) AS Total_Sales
FROM superstore_orders
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;
