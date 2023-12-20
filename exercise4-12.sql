-- 1
SELECT products.ProductID, products.ProductName, products.UnitPrice, categories.CategoryName
FROM products
JOIN categories ON products.CategoryID = categories.CategoryID
ORDER BY categories.CategoryName, products.ProductName;
-- 2
SELECT products.ProductID, products.ProductName, products.UnitPrice, suppliers.CompanyName
FROM products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE products.UnitPrice > 75
ORDER BY products.ProductName;
-- 3
SELECT products.ProductID, products.ProductName, products.UnitPrice, suppliers.CompanyName
FROM products
JOIN categories ON products.CategoryID = categories.CategoryID
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
ORDER BY products.ProductName;
-- 4
USE northwind;

SELECT products.ProductName, categories.CategoryName
FROM products
JOIN Categories ON products.CategoryID = categories.CategoryID
WHERE products.UnitPrice = (
    SELECT MAX(UnitPrice) 
    FROM products)
ORDER BY products.ProductName;
-- 5
USE northwind;

SELECT orders.OrderID, orders.ShipName, orders.ShipAddress, shippers.CompanyName
FROM orders
JOIN shippers ON orders.ShipVia = shippers.ShipperID
WHERE orders.ShipCountry = 'Germany';
-- 6
SELECT orders.OrderID, orders.OrderDate, orders.ShipName, orders.ShipAddress
FROM orders
JOIN `order details` ON orders.OrderID = `order details`.OrderID
JOIN products ON`order details`.ProductID = products.ProductID
WHERE products.ProductName = 'Sasquatch Ale';

