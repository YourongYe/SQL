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


/* 有4张表*/
SELECT h.hacker_id, h.name
FROM submissions s
JOIN challenges c
    ON s.challenge_id = c.challenge_id -- 这里的等号左右的位置可以调换，不会影响
JOIN difficulty d
    ON c.difficulty_level = d.difficulty_level -- 注意这里的两个column都不是来自submission table，只要跟其他任意一个table有连接就可以
JOIN hackers h
    ON s.hacker_id = h.hacker_id
WHERE s.score = d.score  -- join table之后的限制条件
    AND c.difficulty_level = d.difficulty_level
GROUP BY h.hacker_id, h.name  -- group by 后面跟的column name必须跟select保持一致，如果这里只有一个h.hacker_id就会报错，因为h.name不会自动跟着一起group
    HAVING COUNT(s.hacker_id) > 1  -- group by 后面还可以进一步限制，根据group by的结果进行限制
ORDER BY COUNT(s.hacker_id) DESC, s.hacker_id ASC
