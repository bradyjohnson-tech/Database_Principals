from DAL.Base import Base

class StudentDal(Base):
    ADD_STUDENT_PROC_NAME = 'SCHOOL.addStudent'

    def post(self, first_name, last_name, email_address, data_of_birth, student_year):
        args = [first_name, last_name, email_address, data_of_birth, student_year]
        return self.call_procedure_return_id(self.ADD_STUDENT_PROC_NAME, args)

    def get(self, in_student_id):
        cursor = self.connection.admin.cursor(dictionary=True)
        query = "SELECT * FROM SCHOOL.STUDENT WHERE student_id = %s"
        cursor.execute(query, (in_student_id,))
        row = cursor.fetchall()
        cursor.close()
        return row