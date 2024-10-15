USE SCHOOL;

DROP PROCEDURE IF EXISTS addStudent;
DELIMITER $$
    CREATE PROCEDURE SCHOOL.addStudent(
    IN in_first_name VARCHAR(50),
    IN in_last_name VARCHAR(50),
    IN in_email_address VARCHAR(100),
    IN in_date_of_birth DATE,
    IN in_student_year INT
    )
    DETERMINISTIC
    BEGIN
        INSERT INTO SCHOOL.STUDENT(first_name, last_name, email_address, date_of_birth, student_year)
            VALUES (in_first_name, in_last_name, in_email_address, in_date_of_birth, in_student_year);
        SELECT LAST_INSERT_ID();
    END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS addTeacher;
DELIMITER $$
    CREATE PROCEDURE SCHOOL.addTeacher(
        IN in_first_name VARCHAR(50),
        IN in_last_name VARCHAR(50),
        IN in_email_address VARCHAR(100)
    )
        DETERMINISTIC
    BEGIN
        INSERT INTO SCHOOL.TEACHER(teacher_first_name, teacher_last_name, teacher_email)
        VALUES (in_first_name, in_last_name, in_email_address);
        SELECT LAST_INSERT_ID();
    END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS addSemester;
DELIMITER $$
    CREATE PROCEDURE SCHOOL.addSemester(
        IN in_start DATETIME,
        IN in_end DATETIME
    )
        DETERMINISTIC
    BEGIN
        INSERT INTO SCHOOL.SEMESTER(start, end)
        VALUES (in_start, in_end);
        SELECT LAST_INSERT_ID();
    END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS addClass;
DELIMITER $$
    CREATE PROCEDURE SCHOOL.addClass(
        IN in_teacher VARCHAR(50),
        IN in_room_number INT,
        IN in_subject VARCHAR(50)
    )
        DETERMINISTIC
    BEGIN
        INSERT INTO SCHOOL.CLASSES(teacher, room_number, subject)
        VALUES (in_teacher, in_room_number, in_subject);
        SELECT LAST_INSERT_ID();
    END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS addEnrollment;
DELIMITER $$
    CREATE PROCEDURE SCHOOL.addEnrollment(
        IN in_student_id INT,
        IN in_class_id INT,
        IN in_semester_id INT
    )
        DETERMINISTIC
    BEGIN
        INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id)
        VALUES (in_student_id, in_class_id, in_semester_id);
    END$$
DELIMITER ;


DROP FUNCTION IF EXISTS getTeacherId;
DELIMITER $$
    CREATE FUNCTION getTeacherId(in_first_name VARCHAR(50), in_last_name VARCHAR(50))
        RETURNS INT
        DETERMINISTIC
        BEGIN
            DECLARE teacherID INT;
            SELECT TEACHER.teacher_id INTO teacherID FROM TEACHER WHERE teacher_first_name = in_first_name AND teacher_last_name = in_last_name;
            RETURN teacherID;
        END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS getAllStudents;
DELIMITER $$
    CREATE PROCEDURE getAllStudents()
        BEGIN
            SELECT * FROM SCHOOL.STUDENT;
        END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS getTeacherStudents;
DELIMITER $$
    CREATE PROCEDURE getTeacherStudents(in_teacher_first_name VARCHAR(50), in_teacher_last_name VARCHAR(50))
        BEGIN
            SELECT ST.student_id, ST.first_name, ST.last_name
            FROM SCHOOL.ENROLLMENTS EN
                 INNER JOIN SCHOOL.STUDENT AS ST ON EN.student_id = ST.student_id
                 INNER JOIN SCHOOL.CLASSES AS CL ON EN.class_id = CL.class_id
                 INNER JOIN SCHOOL.TEACHER AS T ON CL.teacher = T.teacher_id
            WHERE T.teacher_id = (SELECT getTeacherId(in_teacher_first_name, in_teacher_last_name));
        END $$
DELIMITER ;