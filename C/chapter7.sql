-- 問59
UPDATE 口座
SET 残高 = 残高 + (
    SELECT SUM(入金額) - SUM(出金額)
    FROM 取引
    WHERE 口座番号 = '0351333' AND 日付 = '2024-01-11'
)
WHERE 口座番号 = '0351333';

-- 問60
SELECT
    口座番号,
    残高 AS 現在残高,
    (SELECT COALESCE(SUM(入金額), 0)
     FROM 取引
     WHERE 口座番号 = '1115600' AND 日付 = '2023-12-28') AS 入金合計額,
    (SELECT COALESCE(SUM(出金額), 0)
     FROM  取引
     WHERE 口座番号 = '1115600' AND 日付 = '2023-12-28') AS 出金合計額
FROM
    口座
WHERE
    口座番号 = '1115600';

-- 問61
SELECT
    口座番号,
    名義,
    残高
FROM
    口座
WHERE
    口座番号 IN (
        SELECT 口座番号
        FROM 取引
        WHERE 入金額 >= 1000000
    );

-- 問62
SELECT
    *
FROM
    口座
WHERE
    更新日 > ALL (
        SELECT 日付 FROM 取引
        WHERE 日付 IS NOT NULL
    );

-- 問63
SELECT
    日付,
    入金額,
    出金額
FROM (
    SELECT
        日付,
        SUM(入金額) AS 入金額,
        SUM(出金額) AS 出金額
    FROM
        取引
    WHERE
        口座番号 = '0351333'
    GROUP BY
        日付
) AS 日別取引
WHERE 入金額 > 0 AND 出金額 > 0;

-- 問64
INSERT INTO 廃止口座 (口座番号, 名義, 種別, 解約時残高, 解約日)
SELECT
    口座番号,
    名義,
    種別,
    残高 AS 解約時残高,
    CURRENT_DATE AS 解約日
FROM
    口座
WHERE
    口座番号 = '2761055';
