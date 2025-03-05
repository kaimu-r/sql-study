-- 6-1
-- 問1
SELECT SUM(降水量) AS 年間降水量,
       AVG(最高気温) AS 年間最高気温,
       AVG(最低気温) AS 年間最低気温
FROM 都市別気象観測

-- 問2
SELECT SUM(降水量) AS 年間平均降水量,
       AVG(最高気温) AS 年間最高気温の平均,
       AVG(最低気温) AS 年間最低気温の平均
FROM 都市別気象観測
WHERE 都市名 = '東京'

-- 問3
SELECT 都市名,
       AVG(降水量) AS 年間平均降水量,
       MIN(最高気温) AS 最も低かった最高気温,
       MAX(最低気温) AS 最も高かった最低気温
FROM 都市別気象観測
GROUP BY 都市名

-- 問4
SELECT 月,
       AVG(降水量) AS 年間平均降水量,
       AVG(最高気温) AS 年間最高気温の平均,
       AVG(最低気温) AS 年間最低気温の平均
FROM 都市別気象観測
GROUP BY 月

-- 問5
SELECT 都市名, MAX(最高気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MAX(最高気温) >= 38

-- 問6
SELECT 都市名, MIN(最低気温)
FROM 都市別気象観測
GROUP BY 都市名
HAVING MIN(最低気温) <= -10
