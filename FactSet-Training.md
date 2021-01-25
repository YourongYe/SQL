
# Basics
```sql
SELECT 1 AS aNumber, ‘foo’ AS aString

SELECT   *
FROM     Actors

SELECT   firstName, lastName
FROM     Actors
```

# Where Clause
```sql
SELECT   firstName, lastName, gender
FROM     Actors
WHERE    gender = ‘M’ AND lastName LIKE ‘Smith%’
```

# Group By
```sql
SELECT      lastName, COUNT(*) AS actorCount
FROM        Actors
GROUP BY    lastName
```

# Having Clause
```sql
SELECT      lastName, COUNT(*) AS actorCount
FROM        Actors
GROUP BY    lastName
HAVING      COUNT(*) > 7
```

# Order By
```sql 
SELECT      lastName, COUNT(*) AS actorCount
FROM        Actors
GROUP BY    lastName
HAVING      COUNT(*) > 7
ORDER BY    actorCount DESC, lastName
```

# Fixed Syntax Order
```sql
-- Bad
SELECT    actorId, COUNT(movieId) AS movieCount
FROM      Roles
GROUP BY  actorId
HAVING    movieCount > 3 -- 这里不能用自己定义的变量，因为这个变量实际上是在having clause之后被define的

-- OK
SELECT    actorId, COUNT(movieId) AS movieCount
FROM      Roles
GROUP BY  actorId
HAVING    COUNT(movieId) > 3

-- OK
SELECT    actorId, COUNT(movieId) AS movieCount
FROM      Roles
GROUP BY  actorId
ORDER BY  movieCount DESC
```
