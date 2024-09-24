from DAL.enrollmentDAL import EnrollmentDal

class Enrollment:
    student_id = None
    class_id = None
    semester_id = None
    class_grade = None

    def __init__(self):
        self.__enrolmentDAL = EnrollmentDal()

    def post(self, student_id, class_id, semester_id):
        self.student_id = student_id
        self.class_id = class_id
        self.semester_id = semester_id
        self.__enrolmentDAL.post(student_id, class_id, semester_id)
        return self

    def get_grade(self, in_student_id, in_class_id, in_semester_id):
        args = [in_student_id, in_class_id, in_semester_id]
        self.class_grade = self.__enrolmentDAL.get_class_grade(in_student_id, in_class_id, in_semester_id)
        return self