-- 1 products
-- 2 
SELECT ProductID, ProductName, UnitPrice
FROM products
-- 3
SELECT ProductID, ProductName, UnitPrice
FROM products
ORDER BY unitprice ASC;
-- 4
SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE UnitPrice <= 7.50
-- 5
SELECT ProductID, ProductName, UnitPrice, UnitsInStock
FROM products
WHERE UnitsInStock >= 100
ORDER BY unitprice DESC;
-- 6
SELECT ProductID, ProductName, UnitPrice, UnitsInStock
FROM products
WHERE UnitsInStock >= 100
ORDER BY unitprice DESC, ProductName ASC;
-- 7

SELECT ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder
FROM products
WHERE UnitsInStock = 0 AND UnitsOnOrder > 0
ORDER BY ProductName;
-- 8 categories
-- 9
USE northwind;

SELECT *
FROM categories;
-- 10
USE northwind;

SELECT CategoryID, CategoryName
FROM categories
WHERE CategoryName = 'Seafood';
-- 11
SELECT ProductID, ProductName, CategoryName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Seafood';
-- 12

SELECT FirstName, LastName
FROM employees;

-- 13
SELECT EmployeeID, FirstName, LastName, Title
FROM Employees
WHERE Title LIKE '%manager%'
-- 14
SELECT DISTINCT Title
FROM Employees;
-- 15
SELECT EmployeeID, FirstName, LastName, Salary
FROM Employees
WHERE Salary BETWEEN 2000 AND 2500;
-- 16
SELECT *
FROM Suppliers
