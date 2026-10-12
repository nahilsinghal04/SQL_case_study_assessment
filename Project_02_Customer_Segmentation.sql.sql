-- ==============================================================================
-- PROJECT 05: Customer Segmentation & Revenue Analytics
-- Resume Title: Customer Segmentation & Revenue Analytics using SQL
-- Database: Chinook Database
-- ==============================================================================

-- 1. Customer Value Segmentation using CASE WHEN (High, Medium, Low)
WITH CustomerSummary AS (
    SELECT 
        c.CustomerId,
        c.FirstName || ' ' || c.LastName AS customer_name,
        c.Country,
        COUNT(DISTINCT i.InvoiceId) AS order_count,
        SUM(i.total) AS total_spend
    FROM Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId, customer_name, c.Country
)
SELECT 
    CustomerId,
    customer_name,
    Country,
    total_spend,
    CASE 
        WHEN total_spend >= 45 THEN 'High Value'
        WHEN total_spend BETWEEN 35 AND 44.99 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM CustomerSummary
ORDER BY total_spend DESC;


-- 2. Top 3 High-Spending Customers in Each Country (Window Function: DENSE_RANK)
WITH CountryRanks AS (
    SELECT 
        c.Country,
        c.FirstName || ' ' || c.LastName AS customer_name,
        SUM(i.total) AS total_spent,
        DENSE_RANK() OVER (PARTITION BY c.Country ORDER BY SUM(i.total) DESC) AS rank_in_country
    FROM Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.Country, customer_name
)
SELECT Country, customer_name, total_spent, rank_in_country
FROM CountryRanks
WHERE rank_in_country <= 3
ORDER BY Country, rank_in_country;


-- 3. Cumulative Customer Revenue & Percentage Share (Window Function: SUM OVER)
WITH CustomerRevenue AS (
    SELECT 
        c.CustomerId,
        c.FirstName || ' ' || c.LastName AS customer_name,
        SUM(i.total) AS total_spent
    FROM Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId, customer_name
)
SELECT 
    CustomerId,
    customer_name,
    total_spent,
    SUM(total_spent) OVER (ORDER BY total_spent DESC) AS cumulative_revenue,
    ROUND(100.0 * total_spent / (SELECT SUM(total) FROM Invoice), 2) AS pct_revenue_share
FROM CustomerRevenue
ORDER BY total_spent DESC;


-- 4. Customers who purchased across more than 3 distinct Genres
SELECT 
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS customer_name,
    COUNT(DISTINCT g.GenreId) AS distinct_genres_bought
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY c.CustomerId, customer_name
HAVING COUNT(DISTINCT g.GenreId) > 3
ORDER BY distinct_genres_bought DESC;