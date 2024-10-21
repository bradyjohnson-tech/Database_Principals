from application.DAL.Base_DAL import Base

class DepartmentDAL(Base):

    def get(self):
        try:
            with self.read_cnx_pool.get_connection() as connection:
                with connection.cursor(dictionary=True) as cursor:
                    query = "SELECT department_name FROM EMPLOYEES.DEPARTMENT;"
                    cursor.execute(query)
                    rows = cursor.fetchall()
                    department_names = [job['department_name'] for job in rows]
                    connection.commit()
                    return department_names
        except Exception as e:
            print(f"An error occurred: {e}")
            return None