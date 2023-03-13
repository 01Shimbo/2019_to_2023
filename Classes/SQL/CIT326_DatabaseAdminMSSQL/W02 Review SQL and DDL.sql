--Sales Orders Database
--1 List the customers who ordered a helmet together with the vendors who provide helmets

use SalesOrdersExample
;

SELECT		c.CustLastName + ', ' + c.CustFirstName AS FullName
			,p.ProductName
			,'Customer' AS RowID		
FROM        ((Customers c 
INNER JOIN	Orders o ON (c.CustomerID = o.CustomerID))
INNER JOIN	Order_Details od ON (o.OrderNumber = od.OrderNumber)) 
INNER JOIN	Products p ON (p.ProductNumber = od.ProductNumber)
WHERE		p.ProductName LIKE '%helmet%'
UNION
SELECT		v.VendName, p.ProductName, 'Vendor' AS RowID
FROM		(Vendors v 
INNER JOIN	Product_Vendors pv ON (pv.VendorID = pv.VendorID))
INNER JOIN	Products p ON (p.ProductNumber = pv.ProductNumber)
WHERE		p.ProductName LIKE '%helmet%';

--Entertainment Agency Database
--1. “Display a combined list of customers and entertainers.”
USE EntertainmentAgencyExample
;

SELECT     Agents.AgtLastName + ', ' + Agents.AgtFirstName AS Name, 'Agent' AS Type
FROM         Agents
UNION
SELECT     Entertainers.EntStageName, 'Entertainer' AS Type
FROM         Entertainers;