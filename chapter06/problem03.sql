-- エラー
SELECT 商品名, COUNT(*) FROM 販売履歴

-- エラー
SELECT 商品区分, 商品名, COUNT(*) FROM 販売履歴 GROUP BY 商品名

/*
集計関数を使用する際の「原則」としては
SELECT句には集計関数を使用する列名と、GROUP BY句には集計関数を使用する列名以外の列名を指定する
*/
