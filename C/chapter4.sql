-- 問24
SELECT
    *
FROM
    口座
ORDER BY
    口座番号;

-- 問25
SELECT DISTINCT
    名義
FROM
    口座
ORDER BY
    名義;

-- 問26
SELECT
    *
FROM
    口座
ORDER BY
    4, 1;

-- 問27
SELECT
    *
FROM
    口座
WHERE
    更新日 IS NOT NULL
ORDER BY
    更新日
LIMIT 10;

-- 問28
SELECT
    更新日,
    残高
FROM
    口座
WHERE
    残高 <> 0
    AND 更新日 IS NOT NULL
ORDER BY
    残高,
    更新日 DESC
LIMIT 10
OFFSET 10;

-- 問29
SELECT
    口座番号
FROM
    口座
UNION
SELECT
    口座番号
FROM
    廃止口座
ORDER BY
    口座番号;

-- 問30
SELECT
    名義
FROM
    口座
EXCEPT
SELECT
    名義
FROM
    廃止口座
ORDER BY
    名義;

-- 問31
SELECT
    名義
FROM
    口座
INTERSECT
SELECT
    名義
FROM
    廃止口座
ORDER BY
    名義;

-- 問32
SELECT
    口座番号, 残高 FROM 口座
WHERE
    残高 = 0
UNION
SELECT
    口座番号, 解約時残高 AS 残高 FROM 廃止口座
WHERE
    解約時残高 <> 0
ORDER BY
    口座番号;
