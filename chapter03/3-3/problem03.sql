-- 問1
select * from 成績表

-- 問2
insert into 成績表
values
('S001', '織田 信長', 77, 55, 80, 75, 93, null),
('A002', '豊臣 秀吉', 64, 69, 70, 0, 59, null),
('E003', '徳川 家康', 80, 83, 85, 90, 79, null)

-- 問3
update 成績表
set 法学 = 85, 哲学 = 67
where 学籍番号 = 'S001'

-- 問4
update 成績表
set 外国語 = 81
where 学生番号 in ('A002', 'E003')

-- 問5
-- (1)
update 成績表
set 総合成績 = 'A'
where
(法学 >= 80) and 
(経済学 >= 80) and 
(哲学 >= 80) and 
(情報理論 >= 80) and
(外国語 >= 80)

-- (2)
update 成績表
set 総合成績 = 'B'
where
(法学 >= 80 or 外国語 >= 80) and 
(経済学 >= 80 or 哲学 >= 80)

-- (3)
update 成績表
set 総合成績 = 'D'
where
(法学 < 50) and 
(経済学 < 50) and 
(哲学 < 50) and 
(情報理論 < 50) and
(外国語 < 50)

-- (4)
update 成績表
set 総合成績 = 'C'
where 総合成績 is null

-- 問6
delete from 成績表
where
法学 = 0 and
経済学 = 0 and
哲学 = 0 and
情報理論 = 0 and
外国語 = 0 
