DROP DATABASE IF EXISTS EMPLOYEES;
CREATE DATABASE IF NOT EXISTS EMPLOYEES;

CREATE TABLE IF NOT EXISTS EMPLOYEES.JOB (
     job_id INT NOT NULL AUTO_INCREMENT,
     job_title VARCHAR(255),
     salary DECIMAL(15, 2),
     PRIMARY KEY (job_id)
);

CREATE TABLE IF NOT EXISTS EMPLOYEES.PROJECT (
     project_id INT NOT NULL AUTO_INCREMENT,
     project_name VARCHAR(255),
     start_date DATE,
     end_date DATE,
    PRIMARY KEY (project_id)
);

CREATE TABLE IF NOT EXISTS EMPLOYEES.DEPARTMENT (
    department_id INT NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(255),
    PRIMARY KEY (department_id)
);

CREATE TABLE IF NOT EXISTS EMPLOYEES.EMPLOYEE (
    employee_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    hire_date DATE,
    job_id INT,
    department_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (job_id) REFERENCES EMPLOYEES.JOB(job_id),
    FOREIGN KEY (department_id) REFERENCES EMPLOYEES.DEPARTMENT(department_id)
);

CREATE TABLE IF NOT EXISTS EMPLOYEES.EMPLOYEE_PROJECT_MAP (
    employee_id INT,
    project_id INT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES EMPLOYEES.EMPLOYEE(employee_id),
    FOREIGN KEY (project_id) REFERENCES EMPLOYEES.PROJECT(project_id)
);