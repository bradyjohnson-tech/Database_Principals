from DAL.Base import Base

class ClassDal(Base):
    ADD_CLASS_PROC_NAME = 'SCHOOL.addClass'

    def post(self, teacher, room_number, subject):
        args = [teacher, room_number, subject]
        return self.call_procedure_return_id(self.ADD_CLASS_PROC_NAME, args)

    def get(self, in_class_id):
        try:
           with self.read_cnx_pool.get_connection() as connection:
               with connection.cursor(dictionary=True) as cursor:
                query = "SELECT * FROM SCHOOL.CLASSES WHERE class_id = %s"
                cursor.execute(query, (in_class_id,))
                row = cursor.fetchall()
                connection.commit()
                return row
        except Exception as e:
            print(f"An error occurred: {e}")
            return None
