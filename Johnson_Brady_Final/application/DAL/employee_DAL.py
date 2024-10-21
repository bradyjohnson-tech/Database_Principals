from application.DAL.Base_DAL import Base


class EmployeeDAL(Base):
    ADD_EMPLOYEE_STORE_PROC_NAME = 'addEmployee'
    GET_ALL_EMPLOYEES_INFO_PROC_NAME = 'getAllEmployeesInfo'

    def post(self, first_name, last_name, email, hire_date, job_id, department_id):
        args = [first_name, last_name, email, hire_date, job_id, department_id]
        try:
            with self.write_cnx_pool.get_connection() as connection:
                with connection.cursor(dictionary=True) as cursor:
                    cursor.callproc(self.ADD_EMPLOYEE_STORE_PROC_NAME, args)
                    rows = cursor.stored_results()
                    connection.commit()
                    for row in rows:
                        result = row.fetchone()
                        if 'LAST_INSERT_ID()' not in result:
                            continue
                        return result['LAST_INSERT_ID()']
                    return None
        except Exception as e:
            print(f"An error occurred: {e}")
            return None

    def get(self):
        try:
            with self.read_cnx_pool.get_connection() as connection:
                with connection.cursor(dictionary=True) as cursor:
                    cursor.callproc(self.GET_ALL_EMPLOYEES_INFO_PROC_NAME)
                    rows = cursor.stored_results()
                    results = []
                    for row in rows:
                        results = row.fetchall()
                    connection.commit()
                    return results
        except Exception as e:
            print(f"An error occurred: {e}")
            return None