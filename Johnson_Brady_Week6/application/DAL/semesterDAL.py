from DAL.Base import Base

class SemesterDal(Base):
    ADD_SEMESTER_PROC_NAME = 'SCHOOL.addSemester'

    def post(self, start, end):
        args = [start, end]
        return self.call_procedure_return_id(self.ADD_SEMESTER_PROC_NAME, args)

    def get(self, semester_id):
        try:
           with self.read_cnx_pool.get_connection() as connection:
               with connection.cursor(dictionary=True) as cursor:
                query = "SELECT * FROM SCHOOL.SEMESTER WHERE semester_id = %s"
                cursor.execute(query, (semester_id,))
                row = cursor.fetchall()
                connection.commit()
                return row
        except Exception as e:
            print(f"An error occurred: {e}")
            return None