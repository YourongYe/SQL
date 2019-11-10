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

