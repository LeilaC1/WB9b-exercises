-- 1
SELECT ProductName
FROM products
WHERE UnitPrice = (SELECT MAX(UnitPrice)
 FROM products);
-- 2
SELECT OrderID, ShipName, ShipAddress, ShipVia
FROM orders
WHERE ShipVia = (SELECT ShipperID
 FROM shippers
 WHERE CompanyName = 'Federal Shipping');
-- 3
SELECT OrderID
FROM `order details`
WHERE ProductID = (SELECT ProductID
 FROM products
 WHERE ProductName = 'Sasquatch Ale');
-- 4
SELECT FirstName, LastName
FROM employees
WHERE EmployeeID = (SELECT EmployeeID
FROM orders
WHERE OrderID = 10266);

-- 5
SELECT ContactName
FROM customers
WHERE CustomerID = (SELECT CustomerID
FROM orders
WHERE OrderID = 10266);