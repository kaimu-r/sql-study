CREATE TABLE 学部 (
    ID CHAR(1) PRIMARY KEY,
    名前 VARCHAR(20) NOT NULL UNIQUE
    備考 VARCHAR(100) DEFAULT '特になし'
);
