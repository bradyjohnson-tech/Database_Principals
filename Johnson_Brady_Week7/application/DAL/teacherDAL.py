from DAL.Base import Base

class TeacherDal(Base):
    ADD_TEACHER_PROC_NAME = 'SCHOOL.addTeacher'

    def post(self, teacher_first_name, teacher_last_name, teacher_email):
        args = [teacher_first_name, teacher_last_name, teacher_email]
        return self.call_procedure_return_id(self.ADD_TEACHER_PROC_NAME, args )

    def get(self, in_teacher_id):
        try:
            with self.read_cnx_pool.get_connection() as connection:
                with connection.cursor(dictionary=True) as cursor:
                    query = "SELECT * FROM SCHOOL.TEACHER WHERE teacher_id = %s"
                    cursor.execute(query, (in_teacher_id,))
                    row = cursor.fetchall()
                    cursor.close()
                    return row
        except Exception as e:
            print(f"An error occurred: {e}")
            return None