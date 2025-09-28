-- Task 4: Aggregate Functions and Grouping
-- Database: EcommerceDB

USE EcommerceDB;

-------------------------------------------------
-- 1. Total Amount Spent by Each Customer
-------------------------------------------------
SELECT c.Name, SUM(oi.Quantity * p.Price) AS Total_Spent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Items oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY c.Name;

-------------------------------------------------
-- 2. Number of Orders per Customer
-------------------------------------------------
SELECT c.Name, COUNT(o.OrderID) AS Order_Count
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;

-------------------------------------------------
-- 3. Average Quantity Ordered per Product
-------------------------------------------------
SELECT p.ProductName, AVG(oi.Quantity) AS Avg_Quantity
FROM Products p
JOIN Order_Items oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductName;

-------------------------------------------------
-- 4. Customers Who Spent More Than ₹50,000
-------------------------------------------------
SELECT c.Name, SUM(oi.Quantity * p.Price) AS Total_Spent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Items oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
GROUP BY c.Name
HAVING SUM(oi.Quantity * p.Price) > 50000;

-------------------------------------------------
-- 5. Most and Least Quantity Ordered per Product
-------------------------------------------------
SELECT p.ProductName,
       MAX(oi.Quantity) AS Max_Ordered,
       MIN(oi.Quantity) AS Min_Ordered
FROM Products p
JOIN Order_Items oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductName;
