# Retail-SQL-Sales-Analysis
 Project Overview

This project analyzes retail sales data using Microsoft SQL Server.
  It demonstrates end-to-end SQL skills including:

*Database design
*Data insertion
*Data transformation
*Joins
*Aggregations
*Window functions

#Business insights

This project is part of my SQL portfolio and showcases practical data analysis skills used in real business environments.

* Database Schema

The project contains three main tables:

1. Customers
Column	Type
CustomerID	INT (PK)
CustomerName	NVARCHAR(100)
Gender	CHAR(1)
City	NVARCHAR(50)
State	NVARCHAR(50)
JoinDate	DATE 

2️.Products
Column	Type
ProductID	INT (PK)
ProductName	NVARCHAR(100)
Category	NVARCHAR(50)
UnitPrice	DECIMAL(10,2)

3️. Orders
Column	Type
OrderID	INT (PK)
CustomerID	INT (FK → Customers)
ProductID	INT (FK → Products)
OrderDate	DATE
Quantity	INT
UnitPrice	DECIMAL(10,2)
TotalAmount	Computed (Quantity × UnitPrice)

* Sample Data Inserted

20 Customers

10 Products

45 Orders

Data represents realistic Indian retail transactions (cities, names, categories, spending behaviour).

 *SQL Queries (All 15)

Below are the main analytical queries used in this project:

 1 – Total Customers
SELECT COUNT(*) AS TotalCustomers FROM Customers;

 2 – Total Orders
SELECT COUNT(*) AS TotalOrders FROM Orders;

 3 – Total Revenue
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;

 4 – Revenue By Product
SELECT p.ProductName, SUM(o.TotalAmount) AS Revenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;

 5 – Top 5 Customers
SELECT TOP 5 c.CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC;

 6 – Monthly Revenue
SELECT FORMAT(OrderDate, 'yyyy-MM') AS Month, SUM(TotalAmount) AS MonthlyRevenue
FROM Orders
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY Month;

 7 – Orders Per City
SELECT c.City, COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP GROUP BY c.City
ORDER BY TotalOrders DESC;

 8 – Category-wise Revenue
SELECT p.Category, SUM(o.TotalAmount) AS Revenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;

 9 – Average Order Value
SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders;

 10 – Top Selling Products
SELECT p.ProductName, SUM(o.Quantity) AS TotalUnitsSold
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalUnitsSold DESC;

 11 – Highest Revenue Product
SELECT TOP 1 p.ProductName, SUM(o.TotalAmount) AS Revenue
FROM Orders o JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC;

 12 – Most Frequent Customer
SELECT TOP 1 c.CustomerName, COUNT(o.OrderID) AS OrderCount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY OrderCount DESC;

 13 – Orders with Quantity > 3
SELECT * FROM Orders WHERE Quantity > 3 ORDER BY Quantity DESC;

 14 – State-wise Revenue
SELECT c.State, COUNT(o.OrderID) AS TotalOrders, SUM(o.TotalAmount) AS TotalRevenue
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.State
ORDER BY TotalRevenue DESC;

 15 – Customer Ranking (Window Function)
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSpent,
       RANK() OVER (ORDER BY SUM(o.TotalAmount) DESC) AS RevenueRank
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY RevenueRank;

 #Screenshot

![Tables](screenshots/01_Tables.png)
![Products](screenshots/02_Products_Top5.png)
![Customers](screenshots/03_Customers_Top5.png)
![Revenue](screenshots/04_Total_Revenue.png)
![TopCustomers](screenshots/05_Top_Customers.png)
![CategoryRevenue](screenshots/06_Category_Revenue.png)
![MonthlyRevenue](screenshots/07_Monthly_Revenue.png)
![Ranking](screenshots/08_Customer_Ranking.png)



* Key Insights

*Electronics & Fashion categories generate the highest revenue

*Repeat customers contribute significant revenue

*Certain states and cities perform much better

*Window functions help identify top customers

*Monthly sales trends show seasonality

  #Tech Stack Used

SQL Server

SQL Server Management Studio (SSMS)

T-SQL

Windows

 Folder Structure
Retail-SQL-Sales-Analysis/
│── screenshots/
│── scripts/
│── data/
│── README.md

* Conclusion

This project demonstrates strong SQL skills including table creation, joins, window functions, aggregations, and generating business insights.
It simulates a real-world retail sales analytics workflow using SQL Server.
