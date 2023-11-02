
--homework 3
-- mssql


--1

SELECT DISTINCT  P.Name 
FROM SalesLT.SalesOrderDetail sod JOIN SalesLT.Product p 
ON P.ProductID = SOD.ProductID 
WHERE SOD.OrderQty >20

--2