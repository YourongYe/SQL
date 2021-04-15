
# Basics

## Select
```sql
SELECT 1 AS aNumber, ‘foo’ AS aString

SELECT   *
FROM     Actors

SELECT   firstName, lastName
FROM     Actors
```

## Where Clause
```sql
SELECT   firstName, lastName, gender
FROM     Actors
WHERE    gender = ‘M’ AND lastName LIKE ‘Smith%’
```

## Group By
```sql
SELECT      lastName, COUNT(*) AS actorCount
FROM        Actors
GROUP BY    lastName
```

## Having Clause
```sql
SELECT      lastName, COUNT(*) AS actorCount
FROM        Actors
GROUP BY    lastName
HAVING      COUNT(*) > 7
```

## Order By
```sql 
SELECT      lastName, COUNT(*) AS actorCount
FROM        Actors
GROUP BY    lastName
HAVING      COUNT(*) > 7
ORDER BY    actorCount DESC, lastName
```

## Fixed Syntax Order
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
ORDER BY  movieCount DESC -- order by往往是最后一步，所以可以用自定义的变量名
```

### Actual Implementing Order
```sql
FROM clause  
WHERE clause  
GROUP BY clause  
HAVING clause  
SELECT clause  
ORDER BY clause  
```

# Join
## Cross Join
```sql
SELECT      *
FROM        Movies
CROSS JOIN  Genres
```
### An implicit way
```sql
-- Alternative “implicit” syntax
SELECT      *
FROM        Movies, Genres  -- if we don't specify where clause, then its a cross join in default.
```

## Inner join
```sql
SELECT      *
FROM        Movies AS m
INNER JOIN  Genres AS g
ON          m.genreId = g.genreId
```
### An Implicit Way
```sql
-- Alternative “implicit” syntax
SELECT      *
FROM        Movies AS m, Genres AS g
WHERE       m.genreId = g.genreId
```
## Left Join & Right Join & Full Outer Join
### Left Join
```sql
SELECT      *
FROM        Movies AS m    -- this is the left table
LEFT JOIN   Genres AS g    -- this is the right table
ON          m.genreId = g.genreId   --retain all rows in the left table, add null to the joined rows from the right table
```
### Right Join
```sql
SELECT      *
FROM        Movies AS m   -- left table
RIGHT JOIN  Genres AS g   -- right table
ON          m.genreId = g.genreId  --retain all rows in the right table, add null to the joined rows from the left table
```
### Full Outer Join
```sql
SELECT           *
FROM             Movies AS m
FULL OUTER JOIN  Genres AS g
ON               m.genreId = g.genreId   -- retain all columns in both tables. match as more as possible, others as null
```

# Top & Distinct
## Top
```sql
SELECT      TOP 3 title
FROM        Movies
ORDER BY    rating DESC
```
## Distinct
```sql
-- What movies has Peter Sellers been in? (an actor may paly multiple roles in a movie)
SELECT      DISTINCT m.title AS movieTitle
FROM        dbo.Roles AS r
INNER JOIN  dbo.Movies AS m
ON          r.movieId = m.movieId
INNER JOIN  dbo.Actors AS a
ON          a.actorId = r.actorId
WHERE       a.lastName = 'Sellers' AND a.firstName = 'Peter‘
```
# Union & Intersect

## Union
Listed all movies acted by either Edward (I) Norton or Brad Pitt?
```sql
select title
from Roles as r
inner join Actors as a
on r.actorId = a.actorId
inner join Movies as m
on r.movieId = m.movieId
where a.firstName = 'Edward (I)' and a.lastName = 'Norton'

union -- merge two results without duplications, Union All allows for duplications

select title
from Roles as r
inner join Actors as a
on r.actorId = a.actorId
inner join Movies as m
on r.movieId = m.movieId
where a.firstName = 'Brad' and a.lastName = 'Pitt'
```

## Intersect
What movies are in common between Edward (I) Norton and Brad Pitt?
```sql
select title
from Roles as r
inner join Actors as a
on r.actorId = a.actorId
inner join Movies as m
on r.movieId = m.movieId
where a.firstName = 'Edward (I)' and a.lastName = 'Norton'

intersect

select title
from Roles as r
inner join Actors as a
on r.actorId = a.actorId
inner join Movies as m
on r.movieId = m.movieId
where a.firstName = 'Brad' and a.lastName = 'Pitt'
```
