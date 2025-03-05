-- 問1
SELECT 社員.社員番号, 社員.名前, 部署.名前 AS 部署名
FROM 社員
JOIN 部署
ON 社員.部署Id = 部署.部署id

-- 問2
SELECT S1.社員番号,
S1.名前 AS 名前,
S2.名前 AS 上司名
FROM 社員 AS S1
LEFT JOIN 社員 AS S2
ON S1.上司id = S2.社員番号

-- 問3
SELECT 社員.社員番号, 社員.名前, 部署.名前 AS 部署名, 支店.名前 AS 勤務地
FROM 社員
JOIN 部署
ON 社員.部署id = 部署.部署id
JOIN 支店
ON 社員.勤務地id = 支店.支店id

SELECT 支店.支店id AS 支店コード, 支店.名前 AS 支店名, 社員.名前 AS 支店長名, N.社員数
FROM 支店
JOIN 社員
ON 支店.支店長id = 社員.社員番号
JOIN (
    SELECT COUNT(*) AS 社員数, 勤務地id
    FROM 社員
    GROUP BY 勤務地id
) AS N
ON 社員.勤務地id = N.勤務地id

-- 問4
SELECT S1.社員番号, S1.名前, B1.名前 AS 本人勤務地, B2.名前 AS 上司勤務地
FROM 社員 AS S1
JOIN 社員 AS S2
ON S1.上司id = S2.社員番号 AND S1.勤務地id <> S2.勤務地id
JOIN 支店 AS B1
ON S1.勤務地id = B1.支店id
JOIN 支店 AS B2
ON S2.勤務地id = B2.支店id
