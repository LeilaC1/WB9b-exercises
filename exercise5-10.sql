-- 1
USE northwind;

INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, HomePage)
VALUES ('LeilaCo.', 'Leila Clesca', 'Purchasing Manager', '123 Sesame St', 'New York City', 'NY', '12345', 'USA', '(345)408-2625', '(177) 901-0132', 'https://github.com/LeilaC1/WB9b-exercises');
-- 2
INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
VALUES ('Haitian Cremas', 31, 1, '24 - 12 oz bottles', 39.99, 50, 3, 5, 0);
-- 3
SELECT products.ProductID, products.ProductName, suppliers.SupplierID, suppliers.CompanyName 
FROM products
JOIN suppliers on products.SupplierID = suppliers.SupplierID;
-- 4
UPDATE products
SET UnitPrice = UnitPrice * 1.15
WHERE ProductName = 'Haitian Cremas';
-- 5
SELECT products.ProductID, products.ProductName, products.UnitPrice, suppliers.SupplierID, suppliers.CompanyName 
FROM products
JOIN suppliers on products.SupplierID = suppliers.SupplierID
WHERE suppliers.SupplierID = 31;
-- 6
DELETE FROM products
WHERE ProductName = 'Haitian Cremas';
-- 7
DELETE FROM suppliers
WHERE CompanyName = 'LeilaCo.';
-- 8
SELECT * FROM northwind.products;
-- 9
SELECT * FROM northwind.suppliers;