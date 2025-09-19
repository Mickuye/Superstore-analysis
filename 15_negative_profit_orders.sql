#15. Which orders had negative profit, and what categories/sub-categories do they belong to?
SELECT Order_id, Category, Sub_Category, Profit,
       SUM(profit) OVER(PARTITION BY category, sub_category) AS Negative_Profit
FROM superstore_orders
WHERE profit < 0;
