from DAL.Base import Base

class StudentDal(Base):
    ADD_STUDENT_PROC_NAME = 'SCHOOL.addStudent'
    GET_STUDENT_GRADES_PROC_NAME = 'SCHOOL.getStudentGrades'

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

    def get_all_students(self):
        cursor = self.connection.admin.cursor(dictionary=True)
        query = "SELECT STUDENT.student_id as id, STUDENT.first_name, STUDENT.last_name, STUDENT.email_address as email FROM STUDENT;"
        cursor.execute(query)
        row = cursor.fetchall()
        cursor.close()
        return row



    def get_student_grades(self, in_student_id, in_semester_id):
        try:
            cursor = self.connection.admin.cursor(dictionary=True)
            args = [in_student_id, in_semester_id]
            cursor.callproc(self.GET_STUDENT_GRADES_PROC_NAME, args)
            rows = cursor.stored_results()
            results = []
            for row in rows:
                results = row.fetchall()

            cursor.close()
            return results

        except Exception as e:
            print(f"An error occurred: {e}")
        return []








