USE EMPLOYEES;

INSERT INTO EMPLOYEES.JOB(job_title, salary) VALUES ('Disco King',20000000);

INSERT INTO EMPLOYEES.JOB(job_title, salary) VALUES ('Sales Manager',200000);
INSERT INTO EMPLOYEES.JOB(job_title, salary) VALUES ('Sales Executive',150000);
INSERT INTO EMPLOYEES.JOB(job_title, salary) VALUES ('Sales Associate',100000);

INSERT INTO EMPLOYEES.JOB(job_title, salary) VALUES ('Team Manager',250000);
INSERT INTO EMPLOYEES.JOB(job_title, salary) VALUES ('Principal Engineer',350000);
INSERT INTO EMPLOYEES.JOB(job_title, salary) VALUES ('Senior Engineer',250000);
INSERT INTO EMPLOYEES.JOB(job_title, salary) VALUES ('Engineer',250000);

INSERT INTO EMPLOYEES.PROJECT(project_name, start_date, end_date) VALUES ('Man On Mars', '2002-03-01', '2029-01-01');
INSERT INTO EMPLOYEES.PROJECT(project_name, start_date, end_date) VALUES ('Sell Stuff', '2010-03-01', '2025-01-01');
INSERT INTO EMPLOYEES.PROJECT(project_name, start_date, end_date) VALUES ('Make Stuff', '2010-03-01', '2025-01-01');

INSERT INTO EMPLOYEES.DEPARTMENT(department_name) VALUES ('Sales');
INSERT INTO EMPLOYEES.DEPARTMENT(department_name) VALUES ('IT');
INSERT INTO EMPLOYEES.DEPARTMENT(department_name) VALUES ('Rockets');

INSERT INTO EMPLOYEES.EMPLOYEE(first_name, last_name, email, hire_date, job_id, department_id) VALUES ('Elon', 'Musk', 'ElonMusk@works.com', '2000-01-01',(SELECT job_id FROM EMPLOYEES.JOB WHERE job_title = 'Disco King'), (SELECT department_id FROM EMPLOYEES.DEPARTMENT WHERE department_name = 'Rockets'));
INSERT INTO EMPLOYEES.EMPLOYEE(first_name, last_name, email, hire_date, job_id, department_id) VALUES ('Shawn', 'Lewis', 'ShawnLewis@works.com', '1980-01-01',(SELECT job_id FROM EMPLOYEES.JOB WHERE job_title = 'Sales Manager'), (SELECT department_id FROM EMPLOYEES.DEPARTMENT WHERE department_name = 'Sales'));
INSERT INTO EMPLOYEES.EMPLOYEE(first_name, last_name, email, hire_date, job_id, department_id) VALUES ('Katie', 'Smith', 'KatieSmith@works.com', '2020-01-01',(SELECT job_id FROM EMPLOYEES.JOB WHERE job_title = 'Sales Executive'), (SELECT department_id FROM EMPLOYEES.DEPARTMENT WHERE department_name = 'Sales'));
INSERT INTO EMPLOYEES.EMPLOYEE(first_name, last_name, email, hire_date, job_id, department_id) VALUES ('Davis', 'Johnson', 'DavisJohnson@works.com', '2022-01-01',(SELECT job_id FROM EMPLOYEES.JOB WHERE job_title = 'Sales Associate'), (SELECT department_id FROM EMPLOYEES.DEPARTMENT WHERE department_name = 'Sales'));

INSERT INTO EMPLOYEES.EMPLOYEE(first_name, last_name, email, hire_date, job_id, department_id) VALUES ('Douglas', 'King', 'DouglasKing@works.com', '2004-01-01',(SELECT job_id FROM EMPLOYEES.JOB WHERE job_title = 'Team Manager'), (SELECT department_id FROM EMPLOYEES.DEPARTMENT WHERE department_name = 'IT'));
INSERT INTO EMPLOYEES.EMPLOYEE(first_name, last_name, email, hire_date, job_id, department_id) VALUES ('Tim', 'Dibble', 'TimDibble@works.com', '1970-01-01',(SELECT job_id FROM EMPLOYEES.JOB WHERE job_title = 'Principal Engineer'), (SELECT department_id FROM EMPLOYEES.DEPARTMENT WHERE department_name = 'IT'));
INSERT INTO EMPLOYEES.EMPLOYEE(first_name, last_name, email, hire_date, job_id, department_id) VALUES ('Prateek', 'Kumar', 'PrateekKumar@works.com', '2015-01-01',(SELECT job_id FROM EMPLOYEES.JOB WHERE job_title = 'Senior Engineer'), (SELECT department_id FROM EMPLOYEES.DEPARTMENT WHERE department_name = 'IT'));
INSERT INTO EMPLOYEES.EMPLOYEE(first_name, last_name, email, hire_date, job_id, department_id) VALUES ('Botros', 'Regbos', 'Botros@works.com', '2023-01-01',(SELECT job_id FROM EMPLOYEES.JOB WHERE job_title = 'Engineer'), (SELECT department_id FROM EMPLOYEES.DEPARTMENT WHERE department_name = 'IT'));

INSERT INTO EMPLOYEES.EMPLOYEE_PROJECT_MAP(employee_id, project_id) VALUES (1,1);
INSERT INTO EMPLOYEES.EMPLOYEE_PROJECT_MAP(employee_id, project_id) VALUES (2,2);
INSERT INTO EMPLOYEES.EMPLOYEE_PROJECT_MAP(employee_id, project_id) VALUES (3,2);
INSERT INTO EMPLOYEES.EMPLOYEE_PROJECT_MAP(employee_id, project_id) VALUES (4,2);

INSERT INTO EMPLOYEES.EMPLOYEE_PROJECT_MAP(employee_id, project_id) VALUES (5,3);
INSERT INTO EMPLOYEES.EMPLOYEE_PROJECT_MAP(employee_id, project_id) VALUES (6,3);
INSERT INTO EMPLOYEES.EMPLOYEE_PROJECT_MAP(employee_id, project_id) VALUES (7,3);
INSERT INTO EMPLOYEES.EMPLOYEE_PROJECT_MAP(employee_id, project_id) VALUES (8,3);