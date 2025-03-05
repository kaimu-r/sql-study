-- 問1
SELECT 飼育県, COUNT(個体識別番号)
FROM 個体識別
GROUP BY 飼育県

-- 問2
SELECT 個体識別番号, 飼育県, 雌雄コード
FROM 個体識別
WHERE 飼育県 IN (
    SELECT 飼育県
    FROM 頭数集計
    ORDER BY 頭数 DESC
    LIMIT 3
)

-- 問3
SELECT 個体識別番号,
CASE 品種コード WHEN '01' THEN '乳用種'
                WHEN '02' THEN '肉用種'
                WHEN '03' THEN '交雑種'
                END AS 品種,
出生日,
母牛番号
FROM 個体識別
WHERE 母牛番号 IN (
    SELECT 個体識別番号
    FROM 個体識別
    WHERE 品種コード = '01'
)
