-- 問1
select *
from 気象観測
where 月 = 6

-- 問2
select *
from 気象観測
where 月 not in (6)

-- 問3
select *
from 気象観測
where 降水量 < 100

-- 問4
select *
from 気象観測
where 降水量 > 200

-- 問5
select *
from 気象観測
where 最高気温 >= 30

-- 問6
select *
from 気象観測
where 最低気温 <= 0

-- 問7
select *
from 気象観測
where 月 in (3, 5, 7)

-- 問8
select *
from 気象観測
where 月 not in (3, 5, 7)

-- 問9
select *
from 気象観測
where (降水量 <= 100)
and (湿度 < 50)

-- 問10
select *
from 気象観測
where (最低気温 < 5)
or (最高気温 > 35)

-- 問11
select *
from 気象観測
where 湿度 between 60 and 79

-- 問12
select *
from 気象観測
where 最高気温 is null
or 最低気温 is null
or 湿度 is null
or 降水量 is null
