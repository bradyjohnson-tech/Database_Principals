from DAL.studentDAL import StudentDal


class Student:

    student_id = None
    first_name = None
    last_name = None
    email_address = None
    data_of_birth = None
    student_year = None

    def __init__(self):
        self.__studentDal = StudentDal() # made this private, so I cannot be tempted to call it directly.

    def post(self, first_name, last_name, email_address, data_of_birth, student_year):
        self.first_name = first_name
        self.last_name = last_name
        self.email_address = email_address
        self.data_of_birth = data_of_birth
        self.student_year = student_year
        self.student_id = self.__studentDal.post(first_name, last_name, email_address, data_of_birth, student_year)
        return self

    def get(self, in_student_id):
        result = self.__studentDal.get(in_student_id)
        for i in result:
            self.student_id = i['student_id']
            self.first_name = i['first_name']
            self.last_name = i['last_name']
            self.email_address = i['email_address']
            self.data_of_birth = i['date_of_birth']
            self.student_year = i['student_year']
        return self

    def get_all_students(self):
        return self.__studentDal.get_all_students()

    def get_student_grades(self, in_student_id, in_semester_id):
        return self.__studentDal.get_student_grades(in_student_id, in_semester_id)





