
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
('Ravi Kumar', 'M', 'Hyderabad', 'Telangana', '2022-01-15'),
('Sneha Reddy', 'F', 'Bangalore', 'Karnataka', '2021-12-10');

INSERT INTO Products (ProductName, Category, UnitPrice)
VALUES
('Laptop', 'Electronics', 55000.00),
('Shoes', 'Fashion', 2000.00);

 Orders example
INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity, UnitPrice)
VALUES
(1, 1, '2022-03-01', 1, 55000.00),
(2, 2, '2022-03-05', 2, 2000.00);


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
