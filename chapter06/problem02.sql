-- 6-2
-- 問1
SELECT COUNT(*) AS 入室中の社員数
FROM 入退室管理
WHERE 退室 IS NULL

-- 問2
SELECT 社員名, COUNT(*) AS 入室回数
FROM 入退室管理
GROUP BY 社員名
ORDER BY 入室回数 DESC

-- 問3
SELECT CASE 事由区分
WHEN '1' THEN 'メンテナンス'
WHEN '2' THEN 'リリース作業'
WHEN '3' THEN '障害対応'
WHEN '9' THEN 'その他'
END AS 事由,
COUNT (*) AS 入室回数
FROM 入退室管理
GROUP BY 事由区分

-- 問4
SELECT 社員名, COUNT(*) AS 入室回数
FROM 入退室管理
GROUP BY 社員名
HAVING COUNT(*) > 10

-- 問5
SELECT 日付, COUNT(社員名) AS 対応した社員数
FROM 入退室管理
WHERE 事由区分 = '3'
GROUP BY 日付
ORDER BY 日付
