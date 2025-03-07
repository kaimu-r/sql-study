CREATE TABLE departments (
    id SMAILLINT PRIMARY KEY COMMENT '部署番号',
    name VARCHAR(20) UNIQUE NOT NULL COMMENT '部署名'
)

CREATE TABLE titles (
    id SMAILLINT PRIMARY KEY COMMENT '役職番号',
    name VARCHAR(20) UNIQUE NOT NULL COMMENT '役職名'
)

CREATE TABLE employees (
    id BIGINT PRIMARY KEY COMMENT '社員番号',
    name VARCHAR(20) NOT NULL COMMENT '社員名',
    title_id SMAILLINT COMMENT '役職番号',
    age SMALLINT COMMENT '年齢',
)

CREATE TABLE department_employees (
    department_id SMAILLINT COMMENT '部署番号',
    employee_id BIGINT COMMENT '社員番号',
    PRIMARY KEY (department_id, employee_id)
)
