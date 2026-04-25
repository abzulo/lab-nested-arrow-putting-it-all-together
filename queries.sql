-- PART 1: Join and Filter
SELECT c.customerName, o.orderNumber, o.orderDate
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
WHERE c.country = 'USA';

-- PART 1: HAVING
SELECT c.customerName, COUNT(o.orderNumber) AS total_orders
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
GROUP BY c.customerName
HAVING COUNT(o.orderNumber) > 5;


-- PART 2: LEFT JOIN
SELECT c.customerName, o.orderNumber
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber;

-- Customers with NO orders
SELECT c.customerName
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL;


-- PART 3: CAST
SELECT orderNumber, CAST(amount AS DECIMAL) AS amount_numeric
FROM payments
ORDER BY amount_numeric DESC;


-- PART 4: GROUP BY + HAVING
SELECT c.customerName, SUM(CAST(p.amount AS DECIMAL)) AS total_spent
FROM customers c
JOIN payments p ON c.customerNumber = p.customerNumber
GROUP BY c.customerName
HAVING SUM(CAST(p.amount AS DECIMAL)) > 50000;


-- PART 5: MULTIPLE JOINS
SELECT DISTINCT c.customerName, p.productName, SUM(od.quantityOrdered)
FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
GROUP BY c.customerName, p.productName;


-- PART 6: SUBQUERY
SELECT p.productName
FROM products p
WHERE p.productCode IN (
    SELECT productCode
    FROM orderdetails
    GROUP BY productCode
    HAVING AVG(quantityOrdered) > 30
);