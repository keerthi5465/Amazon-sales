use amazon;

select * from sales;

/* Revenue */ 
SELECT SUM(amount) as Revenue
FROM sales;

/* Sales Quantity */
SELECT SUM(Qty) as Sales_Quantity
FROM sales;

/* Total Orders */
SELECT COUNT('Order ID') as Total_Orders
FROM sales;

/* Average Order Value */
SELECT SUM(amount)/COUNT('Order ID') as Average_Order_Value
FROM sales;

/* The highest product ordered by category */
SELECT MAX(category)Product 
FROM sales;

/* Top 5 products ordered(Most Popular) */
SELECT MAX(category) as Most_Popular_Product
FROM sales
GROUP BY category
ORDER BY category 
DESC
LIMIT 5;

/* Total Revenue Over Different Months */ 
SELECT MONTHNAME(date)Month, SUM(amount) as Revenue
FROM sales
WHERE MONTHNAME(date) IS NOT NULL
GROUP BY MONTHNAME(date)
ORDER BY Revenue
DESC;

/* Peak Revenue By Days */
SELECT DAYOFMONTH(date)Days,SUM(amount) as Revenue 
FROM sales
WHERE DAYOFMONTH(date) IS NOT NULL
GROUP BY DAYOFMONTH(date)
ORDER BY Revenue 
DESC
LIMIT 3;

/* Revenue By Category */
SELECT category,SUM(amount) as Revenue 
FROM sales
GROUP BY category
ORDER BY Revenue 
DESC
LIMIT 5;

/* Revenue By Size */
SELECT  size,SUM(amount)as Revenue 
FROM sales
GROUP BY size
ORDER BY Revenue
DESC;

/* Top Citys By Revenue */
SELECT `ship-city`,SUM(amount) as Revenue 
FROM sales
GROUP BY `ship-city`
ORDER BY Revenue 
DESC
LIMIT 5;

/* Top States By Order */
SELECT`ship-state`,
COUNT(`Order ID`) as Count_Order_ID
FROM sales
GROUP BY `ship-state`
ORDER BY Count_Order_ID
DESC
LIMIT 10;

/* Shows the Cancelled Ordered */
SELECT * 
FROM sales 
WHERE  `Status`= 'Cancelled';

/* Trends in Order Cancellation */
SELECT `Status`,COUNT(`Status`= 'Cancelled')as Cancelled_Order
FROM sales
GROUP BY `Status`
ORDER BY Cancelled_Order
DESC;

/* Distribution of B2B and B2C Customers */
SELECT`B2B`,COUNT(`B2B`)as Count_B2B
FROM sales
WHERE `B2B` IS NOT NULL
GROUP BY `B2B`
ORDER BY `B2B`;

/* Orders Fulfilment */
SELECT Fulfilment,COUNT('Order ID') as Order_Fulfilment
FROM sales
GROUP BY Fulfilment
ORDER BY Fulfilment;

/* The most Common Promotion */
SELECT MAX(`promotion-ids`)as Common_Promotion
FROM sales;

/* Products with high Return or Cancel */ 
SELECT category,count(`status` = 'Cancelled')as Cancelled_Order
FROM sales
GROUP BY Category;
