USE customer_behavior;
GO
USE customer_behavior;
GO

CREATE TABLE customer (
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    age_group VARCHAR(20),
    item_purchased VARCHAR(100),
    category VARCHAR(100),
    purchase_amount DECIMAL(10,2),
    review_rating INT,
    shipping_type VARCHAR(20),
    discount_applied VARCHAR(10),
    subscription_status VARCHAR(20),
    previous_purchases INT
);


--Q1. Total revenue by gender
SELECT gender, SUM(CAST(purchase_amount AS FLOAT)) AS revenue
FROM customer
GROUP BY gender;


--Q2. Customers with discount but spending above average
SELECT customer_id, purchase_amount
FROM customer
WHERE discount_applied = 'Yes'
AND CAST(purchase_amount AS FLOAT) >= 
(
    SELECT AVG(CAST(purchase_amount AS FLOAT))
    FROM customer
);


--Q3. Top 5 products with highest average rating
SELECT TOP 5
    item_purchased,
    ROUND(AVG(CAST(review_rating AS FLOAT)),2) AS Average_Product_Rating
FROM customer
GROUP BY item_purchased
ORDER BY Average_Product_Rating DESC;


--Q4. Average purchase amount by shipping type
SELECT shipping_type,
ROUND(AVG(CAST(purchase_amount AS FLOAT)),2) AS avg_purchase
FROM customer
WHERE shipping_type IN ('Standard','Express')
GROUP BY shipping_type;


--Q5. Subscriber vs non-subscriber spending
SELECT subscription_status,
COUNT(customer_id) AS total_customers,
ROUND(AVG(CAST(purchase_amount AS FLOAT)),2) AS avg_spend,
ROUND(SUM(CAST(purchase_amount AS FLOAT)),2) AS total_revenue
FROM customer
GROUP BY subscription_status
ORDER BY total_revenue DESC;


--Q6. Top 5 products with highest discount rate
SELECT TOP 5
item_purchased,
ROUND(
100.0 * SUM(CASE WHEN discount_applied='Yes' THEN 1 ELSE 0 END)/COUNT(*)
,2) AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate DESC;


--Q7. Customer segmentation
WITH customer_type AS
(
SELECT customer_id,
previous_purchases,
CASE
WHEN previous_purchases = 1 THEN 'New'
WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
ELSE 'Loyal'
END AS customer_segment
FROM customer
)

SELECT customer_segment,
COUNT(*) AS Number_of_Customers
FROM customer_type
GROUP BY customer_segment;


--Q8. Top 3 products in each category
WITH item_counts AS
(
SELECT
category,
item_purchased,
COUNT(customer_id) AS total_orders,
ROW_NUMBER() OVER(PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS item_rank
FROM customer
GROUP BY category,item_purchased
)

SELECT item_rank,category,item_purchased,total_orders
FROM item_counts
WHERE item_rank <=3;


--Q9. Repeat buyers and subscription
SELECT subscription_status,
COUNT(customer_id) AS repeat_buyers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status;


--Q10. Revenue by age group
SELECT
CASE
WHEN age < 25 THEN '18-24'
WHEN age BETWEEN 25 AND 34 THEN '25-34'
WHEN age BETWEEN 35 AND 44 THEN '35-44'
ELSE '45+'
END AS age_group,
SUM(CAST(purchase_amount AS FLOAT)) AS total_revenue
FROM customer
GROUP BY
CASE
WHEN age < 25 THEN '18-24'
WHEN age BETWEEN 25 AND 34 THEN '25-34'
WHEN age BETWEEN 35 AND 44 THEN '35-44'
ELSE '45+'
END
ORDER BY total_revenue DESC;

select * from data_customer;



