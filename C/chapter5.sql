-- 問33
SELECT
    口座番号, 名義, '◯' AS 状況
FROM
    口座
UNION
SELECT
    口座番号, 名義, '×' AS 状況
FROM
    廃止口座
ORDER BY
    名義;

-- 問34
SELECT
    口座番号,
    残高 / 1000 AS 千円単位の残高
FROM
    口座
WHERE
    残高 >= 1000000;

-- 問35
INSERT INTO 
    口座 (口座番号, 名義, 種別, 残高, 更新日)
VALUES
    ('0652281', 'タカギ　ノブオ', '1', 100000 + 3000, '2024-04-01')

INSERT INTO
    口座 (口座番号, 名義, 種別, 残高, 更新日)
VALUES
    ('1026413', 'マツモト　サワコ', '1', 300000 + 3000, '2024-04-02')

INSERT INTO
    口座 (口座番号, 名義, 種別, 残高, 更新日)
VALUES
    ('2239710', 'ササキ　シゲノリ', '1', 1000000 + 3000, '2024-04-01')

-- 問36
UPDATE
    口座
SET
    残高 = (残高 - 3000) + FLOOR((残高 - 3000) * 0.003)
WHERE
    口座番号 IN ('0652281', '1026413', '2239710');

-- 問37
SELECT
    口座番号,
    更新日,
    CAST(更新日 + INTERVAL '180 days' AS DATE) AS 通帳期限日
FROM
    口座
WHERE
    更新日 < '2022-12-31';

-- 問38
SELECT
    口座番号,
    'ヵ)' || 名義 AS 名義
FROM
    口座
WHERE
    種別 = '3'

-- 問39
SELECT DISTINCT
    種別 AS 種別コード,
    CASE 種別
        WHEN '1' THEN '普通'
        WHEN '2' THEN '当座'
        WHEN '3' THEN '別段'
    END AS 種別名
FROM
    口座

-- 問40
SELECT
    口座番号,
    名義,
    CASE
        WHEN 残高 < 100000 THEN 'C'
        WHEN 残高 >= 100000 AND 残高 < 1000000 THEN 'B'
        ELSE 'A'
    END AS 残高ランク
FROM
    口座

-- 問41
SELECT
    口座番号,
    REPLACE(名義, '　', '') AS 名義,
    LENGTH(CAST(残高 AS VARCHAR)) AS 残高の文字数
FROM
    口座

-- 問42
SELECT
    *
FROM
    口座
WHERE
    SUBSTRING(名義, 1, 5) LIKE '%カワ%'

-- 問43
SELECT
    *
FROM
    口座
WHERE
    LENGTH(CAST(残高 AS VARCHAR)) >= 4
    AND RIGHT(CAST(残高 AS VARCHAR), 3) = '000';

-- 問44
SELECT
    口座番号,
    残高,
    FLOOR(残高 * 0.02) AS 利息
FROM
    口座

-- 問45
SELECT
    口座番号,
    残高,
    CASE
        WHEN 残高 < 500000 THEN FLOOR(残高 * 0.01)
        WHEN 残高 >= 500000 AND 残高 < 2000000 THEN FLOOR(残高 * 0.02)
        WHEN 残高 >= 2000000 THEN FLOOR(残高 * 0.03)
    END AS 残高別利息
FROM 口座
ORDER BY
    残高別利息 DESC,
    口座番号

-- 問46
INSERT INTO 
    口座 (口座番号, 名義, 種別, 残高, 更新日)
VALUES
    ('0351262', 'イトカワ　ダイ', '2', 635110, CURRENT_DATE)

INSERT INTO
    口座 (口座番号, 名義, 種別, 残高, 更新日)
VALUES
    ('1015513', 'アキツ　ジュンジ', '1', 88463, CURRENT_DATE)

INSERT INTO
    口座 (口座番号, 名義, 種別, 残高, 更新日)
VALUES
    ('1739298', 'ホシノ　サトミ', '1', 704610, CURRENT_DATE)

-- 問47
SELECT
    *
FROM
    口座
WHERE
    更新日 >= '2024-01-01';

-- 問48
SELECT
    COALESCE(CAST(更新日 AS VARCHAR), '設定なし') AS 更新日
FROM
    口座;
