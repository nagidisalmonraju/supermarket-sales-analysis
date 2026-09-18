-- ============================================
-- Supermarket Sales Analysis
-- SQL Analysis
-- ============================================

USE supermarket_sales;
-- Query 1: Total Sales
SELECT SUM(Total) AS total_sales
FROM sales;
-- Query 2: Sales by Product Line
SELECT
    `Product line`,
    SUM(Total) AS total_sales
FROM sales
GROUP BY `Product line`
ORDER BY total_sales DESC;
-- Query 3: Sales by Branch
SELECT
    Branch,
    SUM(Total) AS total_sales
FROM sales
GROUP BY Branch
ORDER BY total_sales DESC;
-- Query 4: Sales by Gender
SELECT
    Gender,
    SUM(Total) AS total_sales
FROM sales
GROUP BY Gender
ORDER BY total_sales DESC;
-- Query 5: Sales by Customer Type
SELECT
    `Customer type`,
    SUM(Total) AS total_sales
FROM sales
GROUP BY `Customer type`
ORDER BY total_sales DESC;
-- Query 6: Sales by Payment Method
SELECT
    Payment,
    SUM(Total) AS total_sales
FROM sales
GROUP BY Payment
ORDER BY total_sales DESC;
-- Query 7: Gross Income by Product Line
SELECT
    `Product line`,
    SUM(`Gross income`) AS total_gross_income
FROM sales
GROUP BY `Product line`
ORDER BY total_gross_income DESC;
-- Query 8: Quantity Sold by Product Line
SELECT
    `Product line`,
    SUM(Quantity) AS total_quantity
FROM sales
GROUP BY `Product line`
ORDER BY total_quantity DESC;
-- Query 9: Average Customer Rating by Product Line
SELECT
    `Product line`,
    ROUND(AVG(`Customer stratification rating`), 2) AS average_rating
FROM sales
GROUP BY `Product line`
ORDER BY average_rating DESC;
-- Query 10: Monthly Sales
SELECT
    MONTH(STR_TO_DATE(`Date`, '%m/%d/%Y')) AS month,
    ROUND(SUM(Total), 2) AS total_sales
FROM sales
GROUP BY MONTH(STR_TO_DATE(`Date`, '%m/%d/%Y'))
ORDER BY month;
-- Query 11: Top 5 Product Lines by Sales
SELECT
    `Product line`,
    ROUND(SUM(Total), 2) AS total_sales
FROM sales
GROUP BY `Product line`
ORDER BY total_sales DESC
LIMIT 5;
-- Query 12: Sales by City
SELECT
    City,
    ROUND(SUM(Total), 2) AS total_sales
FROM sales
GROUP BY City
ORDER BY total_sales DESC;
-- Query 13: Average Sales per Transaction
SELECT
    ROUND(AVG(Total), 2) AS average_transaction_value
FROM sales;
-- Query 14: Average Quantity per Transaction
SELECT
    ROUND(AVG(Quantity), 2) AS average_quantity
FROM sales;
-- Query 15: Sales by Gender and Customer Type
SELECT
    Gender,
    `Customer type`,
    ROUND(SUM(Total), 2) AS total_sales
FROM sales
GROUP BY Gender, `Customer type`
ORDER BY total_sales DESC;
-- Query 16: Sales by Product Line & Payment
SELECT
    `Product line`,
    Payment,
    ROUND(SUM(Total), 2) AS total_sales
FROM sales
GROUP BY `Product line`, Payment
ORDER BY total_sales DESC;
-- Query 17: Top Selling Invoice
SELECT
    `Invoice ID`,
    `Product line`,
    Total,
    `Gross income`
FROM sales
ORDER BY `Gross income` DESC
LIMIT 1;
-- Query 18: Top 10 Transactions by Sales
SELECT
    `Invoice ID`,
    Branch,
    City,
    `Product line`,
    Total
FROM sales
ORDER BY Total DESC
LIMIT 10;
-- Query 19: Sales by Day
SELECT
    DAY(STR_TO_DATE(`Date`, '%m/%d/%Y')) AS day,
    ROUND(SUM(Total), 2) AS total_sales
FROM sales
GROUP BY DAY(STR_TO_DATE(`Date`, '%m/%d/%Y'))
ORDER BY day;
-- Query 20: Sales & Gross Income by Branch
SELECT
    Branch,
    ROUND(SUM(Total), 2) AS total_sales,
    ROUND(SUM(`Gross income`), 2) AS total_gross_income
FROM sales
GROUP BY Branch
ORDER BY total_sales DESC;