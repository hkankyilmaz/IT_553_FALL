-- MySQL (Part 2)

-- 1

SELECT c.customerName ,c.city , c.salesRepEmployeeNumber 
FROM classicmodels.customers c 
WHERE c.salesRepEmployeeNumber is null;

-- 2


SELECT p.productName  ,p.productDescription  
FROM classicmodels.orderdetails o
join classicmodels.orders o2 
on o2.orderNumber = o.orderNumber 
join classicmodels.products p
on o.productCode  = p.productCode
WHERE DAYNAME(o2.orderDate)  = 'Saturday'
and p.productDescription LIKE '%Ford%'; 

-- 3

SELECT p.productName  ,p.productDescription , o2.orderDate  
FROM classicmodels.orderdetails o
join classicmodels.orders o2 
on o2.orderNumber = o.orderNumber 
join classicmodels.products p
on o.productCode  = p.productCode
WHERE p.productName  = 'The Titanic'
ORDER BY o2.orderDate DESC 

-- 4

SELECT c.customerName  ,p.productName 
FROM classicmodels.orderdetails o
join classicmodels.orders o2 
on o2.orderNumber = o.orderNumber 
join classicmodels.products p
on o.productCode  = p.productCode
join classicmodels.customers c 
on o2.customerNumber  = c.customerNumber
WHERE c.customerName = 'Royale Belge'

-- 5

SELECT c.customerName , e.firstname , e.lastname
from classicmodels.customers c 
join classicmodels.employees e 
on e.employeeNumber  = c.salesRepEmployeeNumber 

-- 6

SELECT e.lastName 
from classicmodels.employees e join classicmodels.offices o 
on e.officeCode  = o.officeCode 
WHERE o.city = 'Tokyo'

-- 7


SELECT p.productName  ,p.productDescription , o2.orderDate  
FROM classicmodels.orderdetails o
join classicmodels.orders o2 
on o2.orderNumber = o.orderNumber 
join classicmodels.products p
on o.productCode  = p.productCode
WHERE p.productDescription  LIKE '%Ships%' OR
      p.productDescription  LIKE '%Planes%'OR
      p.productDescription  LIKE '%Trains%'
      
      
-- 8
      
SELECT e.firstName , e.lastName  
FROM classicmodels.employees e 
WHERE e.employeeNumber  = ( SELECT e2.reportsTo 
							from classicmodels.employees e2
							WHERE e2.employeeNumber  = 1216 )
							
-- 9
							
SELECT firstName ,lastName ,jobTitle 
FROM classicmodels.employees e 
WHERE reportsTo is null


-- 10

SELECT p.productCode ,p.productName , p.buyPrice 
FROM classicmodels.products p 
WHERE p.buyPrice BETWEEN 15 AND 20

-- 11

SELECT productCode ,productName 
from classicmodels.products p 
WHERE productCode like '%\_20%'





















