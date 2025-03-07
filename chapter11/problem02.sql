/*
問1
- 名前
- 学部ID
*/

-- 問２
CREATE VIEW 学部名つき学生一覧 AS
SELECT 学生.学籍番号 学生.名前 学生.生年月日 学生.血液型 学生.学部ID 学部.名前 AS 学部名
FROM 学生
JOIN 学部
ON 学生.学部ID = 学部.ID

-- 問３
INSERT INTO 学生 (学籍番号, 名前, 生年月日, 血液型, 学部ID, 登録順)
VALUES (
    'B1101023', '山田 太郎', '2002-01-14', 'A', 'K', 
    (SELECT NEXTVAL('ISTD'))
);
