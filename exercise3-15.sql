-- 1
SELECT count(SupplierID)
FROM products
-- 2
SELECT EmployeeID, SUM(Salary)
FROM Employees
GROUP BY EmployeeID
-- 3
Select MIN(UnitPrice)
FROM products
-- 4
Select AVG(UnitPrice)
FROM products
-- 5
Select MAX(UnitPrice)
FROM products
-- 6
Select MIN(UnitPrice)
FROM products
-- 7
Select CategoryID, AVG(UnitPrice)
FROM products
GROUP BY CategoryID
-- 8
Select COUNT(SupplierID) 
FROM products
WHERE SupplierID <= 5
GROUP BY SupplierID
-- 9
Select ProductID, ProductName, UnitPrice, UnitsInStock
FROM products
ORDER BY UnitPrice * UnitsInStock DESC, ProductName ASC; 
