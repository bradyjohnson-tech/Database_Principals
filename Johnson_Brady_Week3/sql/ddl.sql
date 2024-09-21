CREATE DATABASE IF NOT EXISTS SCHOOL;

/*
  As a general rule of thumb I will choose an auto incrementing value as a primary key.
  Candidate key is the email. In my personal opinion, numbers are more logical/organizable than words. Also, emails are
 fairly predictable so if a person chooses to implement security through obscurity then random-ish ids are more suitable.
  A super key in this table could be (first_name, data_of_birth) or (last_name, date_of_birth).
 */
CREATE TABLE IF NOT EXISTS SCHOOL.STUDENT(
    student_id INT NOT NULL AUTO_INCREMENT,
    first_name varchar(50),
    last_name varchar(50),
    email_address varchar(100) UNIQUE ,
    date_of_birth DATE,
    student_year INT,
    PRIMARY KEY (student_id)
);

/*
 I chose a primary key of a teacher_id because I like fool-proof primary keys.
 The Candidate key is the teacher_email.
 Super keys are (teacher_first_name, teacher_last_name),
 */
CREATE TABLE IF NOT EXISTS SCHOOL.TEACHER(
    teacher_id INT NOT NULL AUTO_INCREMENT,
    teacher_first_name varchar(50),
    teacher_last_name varchar(50),
    teacher_email varchar(100) UNIQUE ,
    PRIMARY KEY (teacher_id)
);

/*
 This table is extra, it deals with the existence of multiple semester and allows us the ability to record a student
 to take a class more than once across semesters without re-inputting the class multiple times.
 */
CREATE TABLE IF NOT EXISTS SCHOOL.SEMESTER(
    semester_id INT NOT NULL AUTO_INCREMENT,
    start DATETIME NOT NULL,
    end DATETIME NOT NULL,
    PRIMARY KEY (semester_id)
);

/*
Primary key is an ID per my preference.
There are no other acceptable candidate or super keys that do not involve using the class ID because they have the potential to repeat if the teacher teaches more than one class in the same subject in the same room.
 */
CREATE TABLE IF NOT EXISTS SCHOOL.CLASSES(
    class_id INT NOT NULL AUTO_INCREMENT,
    teacher INT NOT NULL,
    room_number INT,
    subject varchar(100),
    PRIMARY KEY (class_id),
    FOREIGN KEY (teacher) REFERENCES SCHOOL.TEACHER(teacher_id)
);

/*
 This is a mapping table, and the primary key is a collection of foreign keys. There is no other combination of foreign keys that constitute either a candidate or super key.
 */
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