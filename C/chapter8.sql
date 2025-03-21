-- 問65
SELECT
    t.口座番号,
    t.日付,
    j.取引事由名,
    CASE 
        WHEN t.入金額 IS NOT NULL THEN t.入金額
        ELSE t.出金額
    END AS 取引金額
FROM
    取引 t
JOIN
    取引事由 j ON t.取引事由ID = j.取引事由ID
WHERE
    t.口座番号 IN ('0311240', '1234161', '2750902')
ORDER BY
    t.口座番号,
    t.取引番号;

-- 問66
SELECT
    k.口座番号,
    k.名義,
    k.残高,
    t.日付,
    t.入金額,
    t.出金額
FROM
    口座 k
JOIN
    取引 t ON k.口座番号 = t.口座番号
WHERE
    k.口座番号 = '0887132'
ORDER BY
    t.日付, t.取引番号;

-- 問67
SELECT
    k.口座番号,
    k.名義,
    k.残高
FROM
    口座 k
WHERE
    k.口座番号 IN (
        SELECT DISTINCT 口座番号
        FROM 取引
        WHERE 日付 = '2022-03-01'
    );

-- 問68
SELECT
    t.口座番号,
    COALESCE(k.名義, '解約済み') AS 名義,
    COALESCE(k.残高, 0) AS 残高
FROM (
    SELECT DISTINCT 口座番号
    FROM 取引
    WHERE 日付 = '2022-03-01'
) t
LEFT JOIN
    口座 k ON t.口座番号 = k.口座番号;

-- 問69
SELECT
    j.取引事由ID,
    j.取引事由名,
    t.取引番号,
    t.口座番号,
    t.日付,
    t.入金額,
    t.出金額
FROM
    取引事由 j
LEFT JOIN
    取引 t ON j.取引事由ID = t.取引事由ID;

-- 問70
SELECT DISTINCT
    COALESCE(j.取引事由ID, t.取引事由ID) AS 取引事由ID,
    COALESCE(j.取引事由名, '未登録の取引事由') AS 取引事由名
FROM
    取引 t
FULL JOIN
    取引事由 j ON t.取引事由ID = j.取引事由ID
ORDER BY
    取引事由ID;

-- 問71
SELECT
    k.口座番号,
    k.名義,
    k.残高,
    t.日付,
    j.取引事由名,
    t.取引番号,
    t.入金額,
    t.出金額
FROM
    口座 k
INNER JOIN (
    SELECT 日付, 取引番号, 入金額, 出金額, 取引事由ID, 口座番号
    FROM 取引
    WHERE 口座番号 = '0887132'
) t ON k.口座番号 = t.口座番号
INNER JOIN
    取引事由 j ON t.取引事由ID = j.取引事由ID
ORDER BY
    t.日付, t.取引番号;

-- 問72
SELECT
    k.口座番号,
    k.名義,
    k.残高,
    t.日付,
    t.取引事由ID,
    t.入金額,
    t.出金額
FROM
    口座 k
JOIN
    取引 t ON k.口座番号 = t.口座番号
WHERE
    k.残高 >= 1000000
    AND t.日付 >= '2024-01-01'
    AND (t.入金額 >= 1000000 OR t.出金額 >= 1000000)

-- 問73
SELECT
    k.口座番号,
    k.名義,
    k.残高,
    t.日付,
    t.取引事由ID,
    t.入金額,
    t.出金額
FROM
    口座 k
JOIN (
    SELECT *
    FROM 取引
    WHERE 日付 >= '2024-01-01'
      AND (入金額 >= 1000000 OR 出金額 >= 1000000)
) t ON k.口座番号 = t.口座番号
WHERE
    k.残高 >= 1000000;

-- 問74
SELECT
    t.口座番号,
    k.名義,
    t.日付,
    COUNT(*) AS 取引回数
FROM
    取引 t
JOIN
    口座 k ON t.口座番号 = k.口座番号
GROUP BY
    t.口座番号, t.日付, k.名義
HAVING
    COUNT(*) >= 3
ORDER BY
    t.口座番号, t.日付;

-- 問75
SELECT
    口座番号,
    名義,
    種別,
    残高,
    更新日
FROM
    口座
WHERE
    名義 IN (
        SELECT 名義
        FROM 口座
        GROUP BY 名義
        HAVING COUNT(*) >= 2
    )
ORDER BY
    名義, 口座番号;
