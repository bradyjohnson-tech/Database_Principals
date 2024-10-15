from DAL.Base_DAL import Base

class JobDAL(Base):
    def get(self):
        try:
            with self.read_cnx_pool.get_connection() as connection:
                with connection.cursor(dictionary=True) as cursor:
                    query = "SELECT JOB.job_title FROM EMPLOYEES.JOB;"
                    cursor.execute(query)
                    rows = cursor.fetchall()
                    job_titles = [job['job_title'] for job in rows]
                    connection.commit()
                    return job_titles
        except Exception as e:
            print(f"An error occurred: {e}")
            return None