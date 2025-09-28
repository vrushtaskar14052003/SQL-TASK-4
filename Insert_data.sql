USE EcommerceDB;

-- Insert Customers
INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('Isha Sadavarte', 'isha@gmail.com', '9876543210', 'Pune'),
('Rahul Sharma', 'rahul@gmail.com', NULL, 'Mumbai'),  -- Example with NULL Phone
('Sneha Patil', 'sneha@gmail.com', '9123456789', 'Nagpur'),
('Ravi Kumar', 'ravi@gmail.com', NULL, 'Delhi'),
('Anjali Verma', 'anjali@gmail.com', '9988776655', 'Bangalore');

select * from Customers;

-- Insert Products
INSERT INTO Products (ProductName, Price, Stock) VALUES
('Laptop', 55000.00, 10),
('Mobile', 20000.00, 25),
('Headphones', 1500.00, 50),
('Keyboard', 1200.00, 30),
('Mouse', 600.00, 40);

select * from Products ;

-- Insert Orders
INSERT INTO Orders (CustomerID, OrderDate) VALUES
(1, '2025-09-20'),
(2, '2025-09-21'),
(3, DEFAULT),  -- Uses DEFAULT CURRENT_DATE
(4, '2025-09-22');

select * from Orders;

-- Insert Order Items
INSERT INTO Order_Items (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),   -- Order 1 → Laptop
(1, 3, 2),   -- Order 1 → 2 Headphones
(2, 2, 1),   -- Order 2 → Mobile
(3, 4, 1),   -- Order 3 → Keyboard
(4, 5, 3);   -- Order 4 → 3 Mouse

select * from Order_Items;


-- 2. UPDATE DATA

-- Update customer phone number
UPDATE Customers
SET Phone = '9998887777'
WHERE CustomerID = 2;

-- Increase stock of Headphones
UPDATE Products
SET Stock = Stock + 20
WHERE ProductName = 'Headphones';

SELECT * FROM Products;


-- Reduce price of Mobile by 10%
UPDATE Products
SET Price = Price * 0.9
WHERE ProductName = 'Mobile';


-- 3. DELETE DATA

-- Delete a product (Mouse)
-- First, delete the order item related to the product 'Mouse'
DELETE FROM Order_Items
WHERE ProductID = (SELECT ProductID FROM Products WHERE ProductName = 'Mouse');

-- Now, delete the product 'Mouse'
DELETE FROM Products
WHERE ProductName = 'Mouse';


-- First, delete the order item related to OrderID = 2
DELETE FROM Order_Items
WHERE OrderID = 2;

-- Now, delete the order
DELETE FROM Orders
WHERE OrderID = 2;

