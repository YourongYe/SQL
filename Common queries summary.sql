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
