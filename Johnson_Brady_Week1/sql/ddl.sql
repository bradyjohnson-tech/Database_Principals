CREATE DATABASE IF NOT EXISTS SCHOOL;

CREATE TABLE IF NOT EXISTS SCHOOL.STUDENT(
    id INT NOT NULL AUTO_INCREMENT,
    first_name varchar(50),
    last_name varchar(50),
    email_address varchar(100),
    date_of_birth DATE,
    student_grade INT,
    teacher_first_name varchar(50),
    teacher_last_name varchar(50),
    teacher_email varchar(100),
    room_number INT,
    subject varchar(100),
    class_grade char(1),
    PRIMARY KEY (ID)
)
