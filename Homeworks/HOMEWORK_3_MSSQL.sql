
--homework 3
-- mssql



--1

SELECT DISTINCT  P.Name 
FROM SalesLT.SalesOrderDetail sod JOIN SalesLT.Product p 
ON P.ProductID = SOD.ProductID 
WHERE SOD.OrderQty >20

--2

SELECT p.Name 
from SalesLT.SalesOrderDetail sod 
join SalesLT.Product p on sod.ProductID = p.ProductID
WHERE p.ListPrice  > 2100
group by p.name

--3

SELECT p.ProductID ,p.Name ,p.ListPrice 
from SalesLT.Product p 
WHERE p.ListPrice > (SELECT avg(sod.UnitPrice)
					from SalesLT.SalesOrderDetail sod )
					
--4
					
SELECT c.CompanyName ,c.FirstName ,c.LastName ,soh.SalesOrderID ,soh.TotalDue 
from SalesLT.Customer c left join SalesLT.SalesOrderHeader soh on c.CustomerID = soh.CustomerID 

--5

SELECT p.Name ,
	   case when p.SellEndDate >= GETDATE()
	   then 'for sale'
	   else 'Out of Sale' end "salestatus"
from SalesLT.Product p 

--6

SELECT p.ProductNumber ,p.Name 
from SalesLT.Product p 
where p.Color in ('black','red','white') and p.Size in ('S','M')

--7

SELECT C.CompanyName ,C.FirstName ,C.LastName ,C.CompanyName 
FROM SalesLT.Customer c 
LEFT JOIN SalesLT.SalesOrderHeader soh ON SOH.CustomerID =C.CustomerID 
WHERE SOH.SalesOrderID IS NULL

--8

SELECT a.CountryRegion ,a.StateProvince , sum(soh.SubTotal) "sum"
from SalesLT.SalesOrderHeader soh right join SalesLT.Address a on soh.ShipToAddressID  = a.AddressID  
group by a.CountryRegion ,a.StateProvince
HAVING  sum (soh.SubTotal) is not null

--9

SELECT p.ProductID ,p.Name ,p.SellStartDate 
from SalesLT.Product p 
where year(p.SellStartDate) = 2005

--10

SELECT p.name, p.ProductCategoryID , P.ProductNumber 
from SalesLT.Product p 
WHERE p.ProductCategoryID in (5,6,7) and p.ProductNumber like 'FR%'

--11

SELECT c.CompanyName ,a.AddressLine1 , a.City 
FROM SalesLT.Customer c  JOIN SalesLT.SalesOrderHeader soh ON C.CustomerID = SOH.CustomerID 
JOIN SalesLT.Address a ON soh.ShipToAddressID  = a.AddressID 

--12

SELECT p.Name , p.ListPrice 
from SalesLT.Product p 
where p.ListPrice > 1000

--13

SELECT p.ProductID ,p.Name ,p.ListPrice 
from SalesLT.Product p 
WHERE p.ListPrice > (SELECT avg(sod.UnitPrice)
					from SalesLT.SalesOrderDetail sod )















