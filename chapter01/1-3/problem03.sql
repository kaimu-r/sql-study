-- 問1
select *
from 家計簿
where 入金額 > 50000

-- 問2
delete from 家計簿
where 出金額 > 4000

-- 問3
update 家計簿
set メモ = 'カフェラテを購入'
where 日付 = '2024-02-03'
