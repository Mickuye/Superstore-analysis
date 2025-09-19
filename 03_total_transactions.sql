#3. How many transactions (orders) are in the dataset?
SELECT COUNT(DISTINCT Order_ID) AS Total_Transactions
FROM superstore_orders;
