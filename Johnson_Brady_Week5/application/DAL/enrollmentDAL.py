from DAL.Base import Base

class EnrollmentDal(Base):
    ADD_ENROLLMENT_PROC_NAME = 'SCHOOL.addEnrollment'

    def post(self, student_id, class_id, semester_id):
        args = [student_id, class_id, semester_id]
        cursor = self.connection.admin.cursor(dictionary=True)
        cursor.callproc(self.ADD_ENROLLMENT_PROC_NAME, args)
        self.connection.admin.commit()
        cursor.close()
        return

    def get_class_grade(self, student_id, class_id, semester_id):
        query = """
            SELECT class_grade 
            FROM SCHOOL.ENROLLMENTS 
            WHERE student_id = %s AND class_id = %s AND semester_id = %s
            """
        with self.connection.admin.cursor(dictionary=True) as cursor:
            cursor.execute(query, (student_id, class_id, semester_id))
            result = cursor.fetchone()

        if result:
            return result.get('class_grade', None)
        return None





    def get_by_semester_id(self, semester_id):
        cursor = self.connection.admin.cursor(dictionary=True)
        query = "SELECT * FROM SCHOOL.ENROLLMENTS WHERE semester_id = %s"
        cursor.execute(query, (semester_id,))
        row = cursor.fetchall()
        cursor.close()
        return row