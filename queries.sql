-- =========================
-- PART 1: JOIN AND FILTER
-- =========================

-- Query 1: Uses JOIN + WHERE filter (NO aggregation)
SELECT 
    c.customerName, 
    o.orderNumber, 
    o.orderDate
FROM customers c
JOIN orders o 
    ON c.customerNumber = o.customerNumber
WHERE c.country = 'USA';


-- Query 2: Uses JOIN + GROUP BY + HAVING (WITH aggregate)
SELECT 
    c.customerName, 
    COUNT(o.orderNumber) AS total_orders
FROM customers c
JOIN orders o 
    ON c.customerNumber = o.customerNumber
GROUP BY c.customerName
HAVING COUNT(o.orderNumber) > 5;