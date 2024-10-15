from DAL.department_DAL import DepartmentDAL

class Department:
    def __init__(self):
        self.__department_dal = DepartmentDAL()

    def get(self):
        return self.__department_dal.get()
