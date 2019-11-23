/* 从station表格中选出city名字最短的City，并return这个城市的名字以及对应的长度，相同长度按字母排序*/
select city, length(city)
from station
order by length(city) asc, city asc
limit 1;

