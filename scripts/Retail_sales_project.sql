
 Retail Sales SQL Analysis Project
 SQL Script (Tables + Inserts + Queries)


-- Use the database
USE SalesProject;
GO


 1. CREATE TABLES


 Customers table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100),
    Gender CHAR(1),
    City NVARCHAR(50),
    State NVARCHAR(50),
    JoinDate DATE
);
GO

 Products table
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    UnitPrice DECIMAL(10,2)
);
GO

 Orders table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    OrderDate DATE,
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalAmount AS (Quantity * UnitPrice)
);
GO


INSERT INTO Customers (CustomerName, Gender, City, State, JoinDate)
VALUES
(1, 'Arjun Reddy', 'M', 'Hyderabad', 'Telangana', '2021-03-12'),
(2, 'Sneha Nair', 'F', 'Kochi', 'Kerala', '2021-07-25'),
(3, 'Ravi Shankar', 'M', 'Chennai', 'Tamil Nadu', '2022-01-05'),
(4, 'Kavya Sharma', 'F', 'Delhi', 'Delhi', '2022-04-18'),
(5, 'Sanjay Verma', 'M', 'Mumbai', 'Maharashtra', '2022-08-10'),
(6, 'Priya Ramesh', 'F', 'Bangalore', 'Karnataka', '2023-02-20'),
(7, 'Aman Gupta', 'M', 'Pune', 'Maharashtra', '2021-11-15'),
(8, 'Swathi Iyer', 'F', 'Chennai', 'Tamil Nadu', '2023-05-09'),
(9, 'Vikram Singh', 'M', 'Delhi', 'Delhi', '2023-07-22'),
(10, 'Aishwarya Menon', 'F', 'Kochi', 'Kerala', '2022-02-27'),
(11, 'Rahul Joshi', 'M', 'Mumbai', 'Maharashtra', '2023-03-14'),
(12, 'Pooja Soni', 'F', 'Hyderabad', 'Telangana', '2021-09-02'),
(13, 'Harish Kumar', 'M', 'Bangalore', 'Karnataka', '2022-12-05'),
(14, 'Divya Patel', 'F', 'Pune', 'Maharashtra', '2021-06-18'),
(15, 'Karan Malhotra', 'M', 'Delhi', 'Delhi', '2023-01-11'),
(16, 'Neha Shetty', 'F', 'Mangalore', 'Karnataka', '2023-04-29'),
(17, 'Rohan Kapoor', 'M', 'Chennai', 'Tamil Nadu', '2022-10-15'),
(18, 'Shreya Chakraborty', 'F', 'Kolkata', 'West Bengal', '2021-05-20'),
(19, 'Ashok Pillai', 'M', 'Kochi', 'Kerala', '2023-06-09'),
(20, 'Meera Srinivasan', 'F', 'Bangalore', 'Karnataka', '2022-09-13');



INSERT INTO Products (ProductID, ProductName, Category, UnitPrice) VALUES
(1, 'Wireless Earbuds', 'Electronics', 1499.00),
(2, 'Cotton T-Shirt', 'Fashion', 499.00),
(3, 'Stainless Steel Bottle', 'Home Essentials', 299.00),
(4, 'A4 Notebook - 200 Pages', 'Stationery', 89.00),
(5, 'Organic Face Wash', 'Beauty', 249.50),
(6, 'Bluetooth Speaker', 'Electronics', 1299.00),
(7, 'Instant Coffee Powder', 'Grocery', 349.00),
(8, 'Sports Shoes', 'Fashion', 1999.00),
(9, 'Kitchen Knife Set', 'Kitchen', 799.00),
(10, 'LED Table Lamp', 'Home Decor', 999.00);


 Orders example

INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity, UnitPrice, TotalAmount) VALUES
(1, 1, 3, '2023-01-12', 2, 299.00, 598.00),
(2, 2, 1, '2023-01-18', 1, 1499.00, 1499.00),
(3, 3, 5, '2023-02-05', 3, 249.50, 748.50),
(4, 4, 2, '2023-02-11', 2, 499.00, 998.00),
(5, 5, 6, '2023-03-04', 1, 1299.00, 1299.00),
(6, 6, 7, '2023-03-16', 4, 349.00, 1396.00),
(7, 7, 4, '2023-04-01', 3, 89.00, 267.00),
(8, 8, 8, '2023-04-14', 1, 1999.00, 1999.00),
(9, 9, 2, '2023-04-19', 2, 499.00, 998.00),
(10, 10, 9, '2023-05-03', 1, 799.00, 799.00),
(11, 11, 1, '2023-05-12', 1, 1499.00, 1499.00),
(12, 12, 7, '2023-05-22', 2, 349.00, 698.00),
(13, 13, 10, '2023-06-02', 1, 999.00, 999.00),
(14, 14, 3, '2023-06-11', 5, 299.00, 1495.00),
(15, 15, 6, '2023-06-26', 1, 1299.00, 1299.00),
(16, 16, 4, '2023-07-07', 2, 89.00, 178.00),
(17, 17, 2, '2023-07-18', 1, 499.00, 499.00),
(18, 18, 8, '2023-07-28', 1, 1999.00, 1999.00),
(19, 19, 5, '2023-08-09', 3, 249.50, 748.50),
(20, 20, 9, '2023-08-22', 2, 799.00, 1598.00),
(21, 1, 6, '2023-09-05', 1, 1299.00, 1299.00),
(22, 3, 7, '2023-09-10', 3, 349.00, 1047.00),
(23, 5, 1, '2023-09-18', 2, 1499.00, 2998.00),
(24, 7, 3, '2023-09-25', 4, 299.00, 1196.00),
(25, 9, 10, '2023-10-04', 1, 999.00, 999.00),
(26, 11, 2, '2023-10-11', 2, 499.00, 998.00),
(27, 13, 5, '2023-10-22', 1, 249.50, 249.50),
(28, 14, 8, '2023-10-28', 1, 1999.00, 1999.00),
(29, 16, 4, '2023-11-03', 3, 89.00, 267.00),
(30, 18, 6, '2023-11-12', 1, 1299.00, 1299.00),
(31, 2, 9, '2023-11-20', 1, 799.00, 799.00),
(32, 4, 1, '2023-11-28', 1, 1499.00, 1499.00),
(33, 6, 7, '2023-12-03', 2, 349.00, 698.00),
(34, 8, 3, '2023-12-15', 3, 299.00, 897.00),
(35, 10, 2, '2023-12-21', 1, 499.00, 499.00),
(36, 12, 6, '2024-01-05', 1, 1299.00, 1299.00),
(37, 14, 9, '2024-01-17', 2, 799.00, 1598.00),
(38, 16, 5, '2024-01-21', 2, 249.50, 499.00),
(39, 18, 3, '2024-02-03', 4, 299.00, 1196.00),
(40, 20, 1, '2024-02-13', 1, 1499.00, 1499.00),
(41, 3, 8, '2024-02-22', 1, 1999.00, 1999.00),
(42, 7, 10, '2024-03-02', 1, 999.00, 999.00),
(43, 11, 4, '2024-03-10', 2, 89.00, 178.00);

 3. ANALYTICAL SQL QUERIES (15 QUERIES)


 Query 1
SELECT COUNT(*) AS TotalCustomers FROM Customers;

 Query 2
SELECT COUNT(*) AS TotalOrders FROM Orders;

 Query 3
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;

 Query 4
SELECT p.ProductName, SUM(o.TotalAmount) AS Revenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;

 Query 5
SELECT TOP 5 c.CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC;

 Query 6
SELECT FORMAT(OrderDate, 'yyyy-MM') AS Month,
       SUM(TotalAmount) AS MonthlyRevenue
FROM Orders
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY Month;

 Query 7
SELECT c.City, COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.City
ORDER BY TotalOrders DESC;

Query 8
SELECT p.Category, SUM(o.TotalAmount) AS Revenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;

 Query 9
SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders;

 Query 10
SELECT p.ProductName, SUM(o.Quantity) AS TotalUnitsSold
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalUnitsSold DESC;

 Query 11
SELECT TOP 1 p.ProductName, SUM(o.TotalAmount) AS Revenue
FROM Orders o JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;

Query 12
SELECT TOP 1 c.CustomerName, COUNT(o.OrderID) AS OrderCount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY OrderCount DESC;

 Query 13
SELECT * FROM Orders WHERE Quantity > 3 ORDER BY Quantity DESC;

 Query 14
SELECT c.State, COUNT(o.OrderID) AS TotalOrders,
       SUM(o.TotalAmount) AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.State
ORDER BY TotalRevenue DESC;

Query 15
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSpent,
       RANK() OVER (ORDER BY SUM(o.TotalAmount) DESC) AS RevenueRank
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY RevenueRank;
GO
