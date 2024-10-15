from DAL.Base import Base

class EnrollmentDal(Base):
    ADD_ENROLLMENT_PROC_NAME = 'SCHOOL.addEnrollment'

    def post(self, student_id, class_id, semester_id):
        try:
           with self.write_cnx_pool.get_connection() as connection:
               with connection.cursor(dictionary=True) as cursor:
                args = [student_id, class_id, semester_id]
                cursor.callproc(self.ADD_ENROLLMENT_PROC_NAME, args)
                connection.commit()
                return
        except Exception as e:
            print(f"An error occurred: {e}")
            return None


    def get_class_grade(self, student_id, class_id, semester_id):
        try:
           with self.read_cnx_pool.get_connection() as connection:
               with connection.cursor(dictionary=True) as cursor:
                query = "SELECT class_grade FROM SCHOOL.ENROLLMENTS WHERE student_id = %s AND class_id = %s AND semester_id = %s"
                cursor.execute(query, (student_id, class_id, semester_id))
                result = cursor.fetchone()
                connection.commit()
                if result:
                    return result.get('class_grade', None)
                return None
        except Exception as e:
            print(f"An error occurred: {e}")
            return None


    def get_by_semester_id(self, semester_id):
        try:
           with self.read_cnx_pool.get_connection() as connection:
               with connection.cursor(dictionary=True) as cursor:
                    query = "SELECT * FROM SCHOOL.ENROLLMENTS WHERE semester_id = %s"
                    cursor.execute(query, (semester_id,))
                    row = cursor.fetchall()
                    connection.commit()
                    return row
        except Exception as e:
            print(f"An error occurred: {e}")
            return None