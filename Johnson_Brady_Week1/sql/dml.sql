INSERT INTO SCHOOL.STUDENT (
    FIRST_NAME,
    LAST_NAME,
    EMAIL_ADDRESS,
    DATE_OF_BIRTH,
    STUDENT_GRADE,
    TEACHER_FIRST_NAME,
    TEACHER_LAST_NAME,
    TEACHER_EMAIL,
    ROOM_NUMBER,
    SUBJECT,
    CLASS_GRADE
) VALUES (
    'Brady',
    'Johnson',
    'Brady.Johnson1@school.com',
    '1990-01-01',
    '18',
    'MS',
    'Kopachek',
    'kopachek1@school.com',
    1,
    'Social Studies',
    'A'
);

SELECT * FROM SCHOOL.STUDENT;