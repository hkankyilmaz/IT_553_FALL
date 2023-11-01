

-- LECTURE 5 LAB 1

-- 1

SELECT * 
FROM HR.EMPLOYEES;

DESCRIBE HEMPLOYEE;

-- 2

SELECT EMPLOYEE_ID "Employee", LAST_NAME "last Name",JOB_ID "Job Id",HIRE_DATE "STARDTDATE"
FROM HR.EMPLOYEES; 

--3

SELECT DISTINCT JOB_ID 
FROM HR.EMPLOYEES;

--4

SELECT FIRST_NAME ,JOB_ID , LAST_NAME || ' . ' || EMPLOYEE_ID 
FROM  HR.EMPLOYEES; 

--5

SELECT LAST_NAME ,SALARY 
FROM HR.EMPLOYEES 
WHERE SALARY  > 1200;

--6
SELECT LAST_NAME ,DEPARTMENT_ID 
FROM HR.EMPLOYEES 
WHERE EMPLOYEE_ID = 176;

--7

SELECT LAST_NAME , SALARY 
FROM HR.EMPLOYEES
WHERE SALARY <5000 AND SALARY <12000;

--8

SELECT LAST_NAME , JOB_ID , HIRE_DATE 
FROM HR.EMPLOYEES 
WHERE LAST_NAME = 'Matos' OR LAST_NAME = 'Tyler'
ORDER BY SALARY DESC ;

--9

SELECT LAST_NAME ,DEPARTMENT_ID 
FROM HR.EMPLOYEES 
WHERE DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 50
ORDER BY LAST_NAME ASC;

--10

SELECT LAST_NAME ,HIRE_DATE
FROM HR.EMPLOYEES
WHERE HIRE_DATE LIKE '%2007';

--11

SELECT LAST_NAME , JOB_ID , MANAGER_ID 
FROM HR.EMPLOYEES 
WHERE  MANAGER_ID IS NULL;

--12

SELECT LAST_NAME ,SALARY ,COMMISSION_PCT 
FROM HR.EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY COMMISSION_PCT DESC; 

--13

SELECT LAST_NAME 
FROM HR.EMPLOYEES
WHERE LAST_NAME LIKE '__a%'

--14

SELECT LAST_NAME 
FROM HR.EMPLOYEES
WHERE LAST_NAME LIKE '%a%'
AND LAST_NAME LIKE '%e%'

--15

SELECT LAST_NAME ,JOB_ID ,SALARY
FROM HR.EMPLOYEES 
WHERE JOB_ID IN ('SAP_REP','ST_CLERK')
AND SALARY NOT IN (2500,3500,7000)


























