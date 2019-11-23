/* 从station表格中选出city名字最短的City，并return这个城市的名字以及对应的长度，相同长度按字母排序*/
select city, length(city)
from station
order by length(city) asc, city asc
limit 1;


/* 算出表格中总的城市数量和distinct城市数量之差*/
select count(city) - count(distinct city) from station

/* 以元音字母开头并结尾的*/
select distinct city
from station
where city like '%[aeiou]' and city like '[aeiou]%';

/* substring的用法 substring（string，start，length）*/
select name
from students
where marks > 75
order by substring(name, len(name)-2, 3), id asc

/* where clause如果有两个以上的condition，必须用and 或者 or 连接*/
select name
from employee
where salary > 2000 and months<10
order by employee_id asc

/* 有两个tables，一个students，一个grades，students里有marks，对应grades里的区间min_mark和max_mark*/
select (case when g.grade>=8 then s.name else null end), grade, marks -- case when 的用法相当于if，语法是（case when (condition) then (true results) else (false results) end）
from students s, grades g
where marks between min_mark and max_mark -- 类似于where s.id = d.id, 但这里不是直接对应关系，而是需要对应到相应的区间
order by g.grade desc, name asc
