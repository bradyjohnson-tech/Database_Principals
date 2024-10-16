USE EMPLOYEES;

DROP PROCEDURE IF EXISTS addEmployee;
DELIMITER $$
CREATE PROCEDURE EMPLOYEES.addEmployee(
    IN in_first_name VARCHAR(50),
    IN in_last_name VARCHAR(50),
    IN in_email VARCHAR(100),
    IN in_hire_date DATE,
    IN in_job_title VARCHAR(100),
    IN in_department_name VARCHAR(100)
)
    DETERMINISTIC
BEGIN
    INSERT INTO EMPLOYEES.EMPLOYEE(first_name, last_name, email, hire_date, job_id, department_id)
    VALUES (in_first_name, in_last_name, in_email, in_hire_date, (SELECT JOB.job_id FROM EMPLOYEES.JOB Where job_title = in_job_title), (SELECT DEPARTMENT.department_id FROM EMPLOYEES.DEPARTMENT WHERE department_name =  in_department_name));
    SELECT LAST_INSERT_ID();
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS getAllEmployeesInfo;
DELIMITER $$
CREATE PROCEDURE EMPLOYEES.getAllEmployeesInfo()
    DETERMINISTIC
BEGIN
    SELECT EM.employee_id as id, EM.first_name, EM.last_name, EM.email, EM.hire_date, J.job_title as role, D.department_name as department
    FROM EMPLOYEES.EMPLOYEE EM
             JOIN EMPLOYEES.JOB AS J ON EM.job_id = J.job_id
             JOIN EMPLOYEES.DEPARTMENT AS D ON EM.department_id = D.department_id
    GROUP BY EM.employee_id, J.job_id, D.department_id ORDER BY employee_id;
END$$
DELIMITER ;
