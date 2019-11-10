--------------------****** SELECT ******--------------------

-- Select everything in the table.
SELECT * FROM table_name;

-- Select columns in the table.
SELECT column1, column2
FROM table_name;

-- Select all the different values from the Country column in the Customers table.
SELECT DISTINCT Country -- country name不会重复
FROM Customers;

-- Select all records where the City column has the value "Berlin".
SELECT * FROM Customers
WHERE City = "Berlin";

-- Use the NOT keyword to select all records where City is NOT "Berlin".
SELECT * FROM Customers
WHERE NOT City = "Berilin"

-- Select all records where the CustomerID column has the value 32.
SELECT * FROM Customers
WHERE CustomerID = 32;

-- Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 12209.
SELECT * FROM Customers
WHERE City = "Berilin"
AND PostalCode = 12209

-- Select all records where the City column has the value 'Berlin' or 'London'.
SELECT * FROM  Customers
WHERE City = 'Berlin'
OR CITY = "London"; 

--------------------****** ORDER BY ******--------------------

-- Select all records from the Customers table, sort the result alphabetically by the column City.
SELECT * FROM Customers
ORDER BY City;

-- 倒序
SELECT * FROM Customers
ORDER BY City DESC;

-- 多层排序
SELECT * FROM Customers
ORDER BY Country, City；


--------------------****** INSERT ******--------------------

INSERT INTO Customers 
(CustomerName, Address, City, PostalCode,Country)
VALUES ('Hekkan Burger','Gateveien 15','Sandnes','4306','Norway');

--------------------****** NULL ******--------------------

SELECT * FROM Customers
WHERE PostalCode IS NULL;

SELECT * FROM Customers
WHERE PostalCode IS NOT NULL;


--------------------****** UPDATE ******--------------------

-- Update the City column of all records in the Customers table.
UPDATE Customers
SET City = 'Oslo';

UPDATE Customers
SET City = 'Oslo'
WHERE Country = 'Norway';


UPDATE Customers
SET City = 'Oslo', Country = 'Norway'
WHERE CustomerID = 32;


--------------------****** DELETE ******--------------------

-- Delete all the records from the Customers table where the Country value is 'Norway'.
DELETE FROM Customers
WHERE Country = 'Norway';

-- Delete all the records from the Customers table.
DELETE FROM Customers;


--------------------****** FUNCTIONS ******--------------------

-- Use the MIN function to select the record with the smallest value of the Price column.
SELECT MIN(Price) -- 最大值换成MAX()
FROM Products;

-- 返回满足条件的行数
SELECT COUNT(*)
FROM Products
WHERE Price = 18;

-- 返回所有product的平均值
SELECT AVG(Price) 
FROM Products;

-- 返回所有product的总和
SELECT SUM(Price)
FROM Products;


--------------------****** LIKE ******--------------------

-- Select all records where the value of the City column starts with the letter "a".
SELECT * FROM Customers
WHERE City LIKE 'a%'; -- 以a开头
WHERE City LIKE '%a'; -- 以a结尾
WHERE City LIKE 'a%b'; -- 以a开头，以b结尾
WHERE City LIKE '%a%'; -- 包含a
WHERE City NOT LIKE '%a'; -- 不以a结尾
WHERE City LIKE '_a%'; -- 第二个字母为a
WHERE City LIKE '[acs]%'; -- 以a或c或s开头
WHERE City LIKE '[a-f]%'; -- 以a到f之间的字母开头
WHERE City LIKE ‘[^acf]%’ -- 以a，f，c开头


--------------------****** IN ******--------------------

-- 如果条件比较多，是一个list
SELECT * FROM Customers
WHERE Country IN('Norway','France');



--------------------****** BETWEEN ******--------------------

-- select all the records where the value of the Price column is between 10 and 20.
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;
WHERE ProductName BETWEEN 'Geitost' AND 'Pavlova'; -- 还可以between字母

--------------------****** AS ******--------------------
-- 换名字display
SELECT CustomerName, Address, PostalCode AS Pno
FROM Customers;


--------------------****** JOIN ******--------------------
-- 两个table合并，以左边的table为准
SELECT *
FROM Orders
LEFT JOIN Customers 
ON Orders.CustomerID=Customers.CustomerID;

-- 只选交集
INNER JOIN Customers
-- 两个table合并，以右边的table为准
RIGHT JOIN Customers



--------------------****** GROUP ******--------------------
-- List the number of customers in each country.
SELECT COUNT(CustomerID),Country
FROM Customers
GROUP BY Country;

-- List the number of customers in each country, ordered by the country with the most customers first.
SELECT COUNT(CustomerID),Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;


-- CREATE a database named testDB.
CREATE DATABASE testDB;
-- delete a database named testDB.
DROP DATABASE testDB;

-- create a new table called Persons.
CREATE TABLE Persons
 (
  PersonID int,
  LastName varchar(255),
  FirstName varchar(255),
  Address varchar(255),
  City varchar(255) 
);
-- create a table called Persons.
DROP TABLE Persons

-- delete all data inside a table.
TRUNCATE TABLE Persons;

-- Add a column of type DATE called Birthday.
ALTER TABLEPersons
ADD Birthday DATE;

-- Delete the column Birthday from the Persons table.
ALTER TABLEPersons
DROP COLUMN Birthday;
