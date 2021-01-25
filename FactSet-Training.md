
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