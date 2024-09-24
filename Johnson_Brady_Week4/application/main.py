from BLL.semester import Semester
from BLL.student import Student
from BLL.teacher import Teacher
from BLL.classes import Classes
from BLL.enrollments import Enrollment


student = Student()
# student.post("Brady", "Johnson", "brady.johnson47@school.com", "1990-01-01", 18)
# student = student.get(student.student_id)

teacher = Teacher()
teacher.get_via_function_call('maria', 'Von Trapp')
print(teacher.teacher_id)

# t = teacher.post("Larry", "Bird", "larry.bird2@school.edu")
# t = teacher.get(1)
# print(t.teacher_first_name)

semester = Semester()
# semester.post('1990-01-01', '1991-01-01')
# semester.get(3)
# print(semester.start)

class_1 = Classes()
# class_1.get(1)
# print(
#     class_1.teacher
# )

# enrollment = Enrollment()
# enrollment.post(1,1,3)
# print(enrollment.student_id)
enrollment2 = Enrollment()
enrollment2.get_grade(1,1,1)
print(enrollment2.class_grade)







