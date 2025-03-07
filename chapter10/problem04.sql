-- 例 1

-- 存在しない親キーを参照する子データの挿入
INSERT INTO 学生(学生番号, 名前, 生年月日, 血液型, 学部ID)
VALUES ('00000001', '山田太郎', '2000-01-01', 'A', 'Z');

-- 親キーを参照している子データが存在する状態での親データ削除
DELETE FROM 学部ID
WHERE ID = 'A'
