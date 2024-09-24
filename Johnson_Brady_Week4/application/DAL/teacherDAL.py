from DAL.Base import Base

class TeacherDal(Base):
    ADD_TEACHER_PROC_NAME = 'SCHOOL.addTeacher'

    def post(self, teacher_first_name, teacher_last_name, teacher_email):
        args = [teacher_first_name, teacher_last_name, teacher_email]
        return self.call_procedure_return_id(self.ADD_TEACHER_PROC_NAME, args )

    def get(self, in_teacher_id):
        cursor = self.connection.admin.cursor(dictionary=True)
        query = "SELECT * FROM SCHOOL.TEACHER WHERE teacher_id = %s"
        cursor.execute(query, (in_teacher_id,))
        row = cursor.fetchall()
        cursor.close()
        return row

    def get_via_function_call(self, teacher_first_name, teacher_last_name):
        cursor = self.connection.admin.cursor(dictionary=True)
        query = "SELECT getTeacherId(%s, %s) as teacher_id"
        cursor.execute(query, (teacher_first_name, teacher_last_name))
        result = cursor.fetchone()
        cursor.close()

        if result:
            return result['teacher_id']
        return None








