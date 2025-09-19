#8. Which sub-category has the highest profit margin?
SELECT sub_category,
       SUM(profit)/SUM(sales) *100 AS profit_margin   
FROM superstore_orders
GROUP BY sub_category
ORDER BY Profit_margin DESC;
