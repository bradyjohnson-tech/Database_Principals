INSERT INTO SCHOOL.STUDENT (first_name, last_name, email_address, date_of_birth, student_year) VALUES (
    'Brady',
    'Johnson',
    'Brady.Johnson1@school.com',
    '1990-01-01',
    18
);

INSERT INTO SCHOOL.STUDENT (first_name, last_name, email_address, date_of_birth, student_year) VALUES (
     'Anna',
     'Johnson',
     'Anna.Johnson1@school.com',
     '1991-01-01',
     17
);

INSERT INTO SCHOOL.STUDENT (first_name, last_name, email_address, date_of_birth, student_year) VALUES (
    'Katie',
    'Johnson',
    'Katie.Johnson1@school.com',
    '1992-01-01',
    16
);

INSERT INTO SCHOOL.STUDENT (first_name, last_name, email_address, date_of_birth, student_year) VALUES (
    'Mike',
    'Johnson',
    'Mike.Johnson1@school.com',
    '1993-01-01',
    15
);

INSERT INTO SCHOOL.TEACHER (teacher_first_name, teacher_last_name, teacher_email) VALUES (
    'Maria',
    'Von Trapp',
    'Maria.VonTrapp@school.com'
);

INSERT INTO SCHOOL.TEACHER (teacher_first_name, teacher_last_name, teacher_email) VALUES (
     'Terence',
     'Tao',
     'Terence.Tao@school.com'
 );

INSERT INTO SCHOOL.TEACHER (teacher_first_name, teacher_last_name, teacher_email) VALUES (
     'Darryl',
     'Cooper',
     'Darryl.Cooper@school.com'
);

INSERT INTO SCHOOL.TEACHER (teacher_first_name, teacher_last_name, teacher_email) VALUES (
    'Tucker',
    'Carlson',
    'Tucker.Carlson@school.com'
);

INSERT INTO SCHOOL.CLASSES(teacher, room_number, subject) VALUES (
    (SELECT teacher_id FROM SCHOOL.TEACHER WHERE teacher_email = 'Darryl.Cooper@school.com'),
    123,
    'History'
);

INSERT INTO SCHOOL.CLASSES(teacher, room_number, subject) VALUES (
     (SELECT teacher_id FROM SCHOOL.TEACHER WHERE teacher_email = 'Tucker.Carlson@school.com'),
     234,
     'English'
);

INSERT INTO SCHOOL.CLASSES(teacher, room_number, subject) VALUES (
     (SELECT teacher_id FROM SCHOOL.TEACHER WHERE teacher_email = 'Terence.Tao@school.com'),
     345,
     'Math'
);

INSERT INTO SCHOOL.CLASSES(teacher, room_number, subject) VALUES (
    (SELECT teacher_id FROM SCHOOL.TEACHER WHERE teacher_email = 'Maria.VonTrapp@school.com'),
    345,
    'Science'
);

INSERT INTO SCHOOL.SEMESTER(start, end) VALUES (
    '2024-09-03',
    '2024-12-18'
);

INSERT INTO SCHOOL.SEMESTER(start, end) VALUES (
   '2025-01-07',
   '2025-04-23'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id = 1),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 1),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'A'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id = 1),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 2),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'B'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id = 1),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 3),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'C'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id = 1),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 4),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'D'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id = 2),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 1),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'B'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id = 2),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 2),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'C'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id = 2),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 3),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'D'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id = 2),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 4),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'A'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id =3),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 1),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'C'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id =3),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 2),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'D'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id =3),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 3),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'A'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id =3),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 4),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'B'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id =4),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 1),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'D'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id =4),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 2),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'A'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id =4),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 3),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'B'
);

INSERT INTO SCHOOL.ENROLLMENTS(student_id, class_id, semester_id, class_grade) VALUES (
    (SELECT student_id FROM STUDENT WHERE STUDENT.student_id =4),
    (SELECT class_id FROM CLASSES WHERE CLASSES.class_id = 4),
    (SELECT semester_id FROM SEMESTER WHERE SEMESTER.semester_id = 1),
    'C'
);