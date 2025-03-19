
-- 問9
SELECT
    *
FROM
    口座
WHERE
    口座番号 = '0037651';

-- 問10
SELECT
    *
FROM
    口座
WHERE
    残高 > 0;

-- 問11
/*
口座番号の数値の大小を比較した
文字列比較ではASCIIコード順で '9' > '1000000'となるため
*/
SELECT
    *
FROM
    口座
WHERE
    CAST(口座番号 AS INTEGER) < 1000000; 

-- 問12
SELECT
    *
FROM
    口座
WHERE
    更新日 < '2023-03-31';

-- 問13
SELECT
    *
FROM
    口座
WHERE
    残高 >= 1000000;

-- 問14
SELECT
    *
FROM
    口座
WHERE
    種別 <> '1';

-- 問15
SELECT
    *
FROM
    口座
WHERE
    更新日 IS NULL;

-- 問16
SELECT
    *
FROM
    口座
WHERE
    名義 LIKE '%ハシ%';

-- 問17
SELECT
    *
FROM
    口座
WHERE
    更新日 BETWEEN '2024-01-01' AND '2024-01-31';

-- 問18
SELECT
    *
FROM
    口座
WHERE
    種別 IN ('2', '3');

-- 問19
SELECT
    *
FROM
    口座
WHERE
    名義 IN ('サカタ　リョウヘイ', 'マツモト　ミワコ', 'ハマダ　サトシ');

-- 問20
SELECT
    *
FROM
    口座
WHERE
    更新日 BETWEEN '2023-12-30' AND '2024-01-04';

-- 問21
SELECT
    *
FROM
    口座
WHERE
    残高 < 10000 AND 更新日 IS NOT NULL;

-- 問22
SELECT
    *
FROM
    口座
WHERE
    口座番号 LIKE '2%'
    AND SUBSTRING(名義, 1, 1) = 'サ'
    AND SUBSTRING(名義, 4, 1) = '　'
    AND RIGHT(名義, 1) = 'イ';

-- 問23
/*
口座テーブル: 口座番号
取引テーブル: 取引番号
取引事由: 取引事由ID
*/
