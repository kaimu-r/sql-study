-- 問49
SELECT
    SUM(残高) AS 残高合計,
    MAX(残高) AS 残高最大,
    MIN(残高) AS 残高最小,
    AVG(残高) AS 残高平均,
    COUNT(*) AS 件数
FROM
    口座;

-- 問50
SELECT
    COUNT(*) AS 件数
FROM
    口座
WHERE
    種別 <> '1'
    AND 残高 >= 1000000
    AND 更新日 <= '2023-12-31';


-- 問51
SELECT
    COUNT(*) AS 件数
FROM
    口座
WHERE
    更新日 IS NULL;

-- 問52
SELECT
    MAX(名義) AS 名義最大値,
    MIN(名義) AS 名義最小値
FROM
    口座;

-- 問53
SELECT
    MAX(更新日) AS 最も新しい更新日,
    MIN(更新日) AS 最も古い更新日
FROM
    口座;

-- 問54
SELECT
    種別,
    SUM(残高) AS 残高合計,
    MAX(残高) AS 残高最大,
    MIN(残高) AS 残高最小,
    AVG(残高) AS 残高平均,
    COUNT(*) AS 件数
FROM
    口座
GROUP BY
    種別;

-- 問55
SELECT
    RIGHT(口座番号, 1) AS 口座番号下1桁,
    COUNT(*) AS 件数
FROM
    口座
GROUP BY
    RIGHT(口座番号, 1)
ORDER BY
    件数 DESC;

-- 問56
SELECT
    COALESCE(TO_CHAR(更新日, 'YYYY年'), 'XXXX年') AS 更新年,
    SUM(残高) AS 残高合計,
    MAX(残高) AS 残高最大,
    MIN(残高) AS 残高最小,
    AVG(残高) AS 残高平均,
    COUNT(*) AS 件数
FROM
    口座
GROUP BY
    COALESCE(TO_CHAR(更新日, 'YYYY年'), 'XXXX年')
ORDER BY
    更新年;

-- 問57
SELECT
    種別,
    SUM(残高) AS 残高合計,
    COUNT(*) AS 件数
FROM
    口座
GROUP BY
    種別
HAVING
    SUM(残高) > 3000000
ORDER BY
    種別;

-- 問58
SELECT
    SUBSTRING(名義, 1, 1) AS 名義の先頭文字,
    COUNT(*) AS データ件数,
    AVG(LENGTH(REPLACE(名義, '　', ''))) AS 名義文字数平均
FROM
    口座
GROUP BY
    SUBSTRING(名義, 1, 1)
HAVING
    COUNT(*) >= 10 OR AVG(LENGTH(REPLACE(名義, '　', ''))) > 5
ORDER BY
    名義の先頭文字;
