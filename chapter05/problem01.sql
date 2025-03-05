-- 問1
-- (A)
UPDATE 試験結果
SET 午後1 =  (80*4) - (86+68+91)
WHERE 受験者id = 'SW1046'

-- (B)
UPDATE 試験結果
SET 論述 = (68*4) - (65+53+70)
WHERE 受験者id = 'SW1350'

-- (C)
UPDATE 試験結果
SET 午前 = (56*4) - (59+56+36)
WHERE 受験者id = 'SW1877'

-- 問2
SELECT 受験者id AS 合格者id FROM 試験結果
WHERE (午前 >= 60)
AND (午後1 + 午後2 >= 120)
AND (論述 >= (午前 + 午後1 + 午後2) * 0.3)
