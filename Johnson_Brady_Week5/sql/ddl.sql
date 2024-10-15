DROP DATABASE IF EXISTS SCHOOL;
CREATE DATABASE IF NOT EXISTS SCHOOL;

CREATE TABLE IF NOT EXISTS SCHOOL.STUDENT(
    student_id INT NOT NULL AUTO_INCREMENT,
    first_name varchar(50),
    last_name varchar(50),
    email_address varchar(100) UNIQUE ,
    date_of_birth DATE,
    student_year INT,
    PRIMARY KEY (student_id)
);

CREATE TABLE IF NOT EXISTS SCHOOL.TEACHER(
    teacher_id INT NOT NULL AUTO_INCREMENT,
    teacher_first_name varchar(50),
    teacher_last_name varchar(50),
    teacher_email varchar(100) UNIQUE ,
    PRIMARY KEY (teacher_id)
);

CREATE TABLE IF NOT EXISTS SCHOOL.SEMESTER(
    semester_id INT NOT NULL AUTO_INCREMENT,
    start DATETIME NOT NULL,
    end DATETIME NOT NULL,
    PRIMARY KEY (semester_id)
);

CREATE TABLE IF NOT EXISTS SCHOOL.CLASSES(
    class_id INT NOT NULL AUTO_INCREMENT,
    teacher INT NOT NULL,
    room_number INT,
    subject varchar(100),
    PRIMARY KEY (class_id),
    FOREIGN KEY (teacher) REFERENCES SCHOOL.TEACHER(teacher_id)
);

CREATE TABLE IF NOT EXISTS SCHOOL.ENROLLMENTS(
    student_id INT NOT NULL ,
    class_id INT NOT NULL,
    semester_id INT NOT NULL,
    class_grade char(1),
    FOREIGN KEY (student_id) REFERENCES SCHOOL.STUDENT(student_id),
    FOREIGN KEY (class_id) REFERENCES SCHOOL.CLASSES(class_id),
    FOREIGN KEY (semester_id) REFERENCES SCHOOL.SEMESTER(semester_id),
    PRIMARY KEY (student_id, class_id, semester_id)
);