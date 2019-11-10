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


