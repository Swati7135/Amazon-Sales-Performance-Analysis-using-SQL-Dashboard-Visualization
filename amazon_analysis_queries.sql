--Query1
SELECT
    TO_CHAR("Order_Date"::DATE, 'YYYY-MM') AS month,
    ROUND(SUM("Total_Amount"), 2) AS total_revenue
FROM amazon_sales
GROUP BY month
ORDER BY month;

--Query 2
SELECT
    COUNT(DISTINCT "Order_ID") AS total_orders,
    ROUND(AVG("Total_Amount"), 2) AS average_order_value
FROM amazon_sales;
--Query3
-- Q3: Category-wise Sales Performance

SELECT
    "Category",
    ROUND(SUM("Total_Amount"), 2) AS total_revenue
FROM amazon_sales
GROUP BY "Category"
ORDER BY total_revenue DESC;

-- Q4: Top 10 Products by Revenue

SELECT
    "Product_Name",
    ROUND(SUM("Total_Amount"), 2) AS total_revenue
FROM amazon_sales
GROUP BY "Product_Name"
ORDER BY total_revenue DESC
LIMIT 10;

-- Q5A: City-wise Revenue Contribution

SELECT
    "City",
    ROUND(SUM("Total_Amount"), 2) AS total_revenue
FROM amazon_sales
GROUP BY "City"
ORDER BY total_revenue DESC;


-- Q6: Order Status Distribution

SELECT
    "Order_Status",
    COUNT("Order_ID") AS total_orders
FROM amazon_sales
GROUP BY "Order_Status"
ORDER BY total_orders DESC;

-- Q7: Brand-wise Revenue Analysis

SELECT
    "Brand",
    ROUND(SUM("Total_Amount"), 2) AS total_revenue
FROM amazon_sales
GROUP BY "Brand"
ORDER BY total_revenue DESC;

--
-- Q8: Impact of Discounts on Sales

SELECT
    CASE
        WHEN "Discount" = 0 THEN 'No Discount'
        WHEN "Discount" > 0 AND "Discount" <= 10 THEN 'Low Discount (1–10%)'
        WHEN "Discount" > 10 AND "Discount" <= 30 THEN 'Medium Discount (11–30%)'
        ELSE 'High Discount (>30%)'
    END AS discount_range,
    ROUND(SUM("Total_Amount"), 2) AS total_revenue
FROM amazon_sales
GROUP BY discount_range
ORDER BY total_revenue DESC;

-- Q8: Impact of Discounts on Sales

SELECT
    CASE
        WHEN "Discount" = 0 THEN 'No Discount'
        WHEN "Discount" > 0 AND "Discount" <= 10 THEN 'Low Discount (1–10%)'
        WHEN "Discount" > 10 AND "Discount" <= 30 THEN 'Medium Discount (11–30%)'
        ELSE 'High Discount (>30%)'
    END AS discount_range,
    ROUND(SUM("Total_Amount"), 2) AS total_revenue
FROM amazon_sales
GROUP BY discount_range
ORDER BY total_revenue DESC;

-- Q9: Repeat vs New Customers Revenue

WITH customer_orders AS (
    SELECT
        "Customer_ID",
        COUNT("Order_ID") AS order_count,
        SUM("Total_Amount") AS customer_revenue
    FROM amazon_sales
    GROUP BY "Customer_ID"
)

SELECT
    CASE
        WHEN order_count > 1 THEN 'Repeat Customer'
        ELSE 'New Customer'
    END AS customer_type,
    ROUND(SUM(customer_revenue), 2) AS total_revenue
FROM customer_orders
GROUP BY customer_type;

-- Q10: Payment Method-wise Revenue Distribution

SELECT
    "Payment_Method",
    ROUND(SUM("Total_Amount"), 2) AS total_revenue
FROM amazon_sales
GROUP BY "Payment_Method"
ORDER BY total_revenue DESC;







