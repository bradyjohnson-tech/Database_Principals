from DAL.employee_DAL import EmployeeDAL

class Employee:
    employee_id = None,
    first_name = None,
    last_name = None,
    email = None,
    hire_date = None,
    job_id = None,
    department_id = None

    def __init__(self):
        self.__employee_dal = EmployeeDAL()

    def post(self, first_name, last_name, email, hire_date, job_id, department_id):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.hire_date = hire_date
        self.job_id = job_id
        self.department_id = department_id
        self.employee_id = self.__employee_dal.post(first_name, last_name, email, hire_date, job_id, department_id)

    def get(self):
        return self.__employee_dal.get()