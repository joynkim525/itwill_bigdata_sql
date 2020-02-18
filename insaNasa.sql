select * from session_privs; -- check the user's system privileges 
select * from user_sys_privs; -- check the user's system privileges given from dba
select * from role_sys_privs; -- check the user's system privileges given with roles
select * from user_ts_quotas; -- check the capacity of quota

select * from user_tab_privs; -- check the user's table privileges
select * from user_objects; -- check objects the user makes
select * from user_segments; -- check the user's semgnets
select * from user_extents; -- check the user's extents

select * from employees;
select * from hr.employees;

create table employees
as select * from hr.employees;

CREATE TABLE departments
AS SELECT * FROM hr.departments;

SELECT * FROM tab;

DROP TABLE employees purge;
DROP TABLE departments purge;

SELECT * FROM tab;
SELECT * FROM tabs;

CREATE TABLE emp
AS SELECT * FROM hr.employees
WHERE 1 = 2;

INSERT INTO emp
SELECT * FROM hr.employees;

COMMIT;

CREATE TABLE emp_new_test
AS (SELECT employee_id, last_name
FROM hr.employees
WHERE 1 = 2);

INSERT INTO emp_new(employee_id, last_name)
SELECT employee_id, upper(last_name)
FROM hr.employees
WHERE department_id = 20;

SELECT * FROM emp_new;

COMMIT;

DELETE FROM emp_new;

ROLLBACK;

TRUNCATE TABLE emp_new_test;

DROP TABLE emp_new_test purge;

ROLLBACK;

select * from dict;

DROP TABLE emp_2020 purge;

CREATE TABLE emp_2020
AS SELECT employee_id, last_name, department_id
FROM hr.employees
WHERE 1=2;

INSERT INTO emp_2020(employee_id, last_name)
SELECT employee_id, lower(last_name)
FROM hr.employees;

COMMIT;

SELECT * FROM emp_2020;

UPDATE emp_2020 
SET department_id = (SELECT department_id FROM hr.employees
                        WHERE employee_id = emp_2020.employee_id);

COMMIT;

SELECT * FROM tab;

DELETE FROM emp_2020
WHERE employee_id in (SELECT employee_id FROM hr.job_history);

DELETE FROM emp_2020
WHERE exists (SELECT 1 
                FROM hr.job_history 
                WHERE employee_id = emp_2020.employee_id);

DELETE FROM emp_2020
WHERE employee_id in (SELECT employee_id 
                        FROM hr.job_history 
                        WHERE employee_id = emp_2020.employee_id);
                        
purge recyclebin;

DROP TABLE emp purge;

CREATE TABLE emp(
id number (4),
name varchar2(30),
day date)
tablespace users;

DESC emp;

ALTER TABLE emp
ADD job_id varchar2(20);

ALTER TABLE emp
MODIFY job_id varchar(30);

ALTER TABLE emp
DROP COLUMN job_id;

ALTER TABLE emp
ADD CONSTRAINTS emp_id_pk primary key(id);

SELECT *
FROM user_constraints
WHERE table_name = 'EMP';

SELECT *
FROM user_cons_columns
WHERE table_name = 'EMP';

SELECT *
FROM user_indexes
WHERE table_name = 'EMP';

SELECT *
FROM user_ind_columns
WHERE table_name = 'EMP';

INSERT INTO emp(id, name, day)
VALUES (1, '홍길동', sysdate);

COMMIT;

INSERT INTO emp(id, name, day)
VALUES (1, '나영석', sysdate);

INSERT INTO emp(id, name, day)
VALUES (NULL, '강호동', sysdate);

CREATE TABLE dept(
dept_id number constraint dept_id_pk primary key,
dept_name varchar2(20)
);

INSERT INTO dept(dept_id, dept_name)
VALUES (10, '총무부');

INSERT INTO dept(dept_id, dept_name)
VALUES (20, '분석팀');

SELECT * FROM dept;

COMMIT;

ALTER TABLE emp
ADD dept_id number;

UPDATE emp
SET name = '나영석'
WHERE id = 1;

SELECT * FROM emp;

ALTER TABLE emp
ADD CONSTRAINT emp_dept_id_fk foreign key(dept_id) 
REFERENCES dept(dept_id);

SELECT * FROM emp;

UPDATE emp
SET dept_id = 10
WHERE id = 1;

SELECT * FROM dept;

DELETE FROM dept
WHERE dept_id = 10;

INSERT INTO emp(id, name, day, dept_id)
VALUES (2, '신효정', sysdate, 20);

ALTER TABLE dept
ADD CONSTRAINT dept_name_uk unique (dept_name);

INSERT INTO dept(dept_id, dept_name)
VALUES(30, NULL);]

COMMIT;

UPDATE DEPT
SET dept_name = '총무부'
WHERE dept_id = 20;

DROP TABLE dept;

SELECT *
FROM user_constraints
WHERE table_name = 'EMP';

SELECT *
FROM user_constraints
WHERE table_name = 'DEPT';

DROP TABLE dept CASCADE CONSTRAINTS purge;

--- ==02/13==
select * from user_tab_privs;
SELECT * FROM hr.emp_20;