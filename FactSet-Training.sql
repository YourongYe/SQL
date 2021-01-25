
-- Basics
SELECT 1 AS aNumber, ‘foo’ AS aString

SELECT   *
FROM     Actors

SELECT   firstName, lastName
FROM     Actors

SELECT   firstName, lastName, gender
FROM     Actors
WHERE    gender = ‘M’ AND lastName LIKE ‘Smith%’
