-- 理学部の学生を工学部に所属変更する
UPDATE 学生
SET 学部ID = 'K'
WHERE 学部ID = 'R'

-- 理学部の廃止
DELETE FROM 学部ID
WHERE ID = 'R'
