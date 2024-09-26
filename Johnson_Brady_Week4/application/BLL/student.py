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

student = Student()
student.post("Brady", "Johnson", "brady.johnson01@school.com", "1990-01-01", 18)
student = student.get(student.student_id)
print(student.first_name)



