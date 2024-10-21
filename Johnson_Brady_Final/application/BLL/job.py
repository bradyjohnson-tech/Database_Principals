from application.DAL.job_DAL import JobDAL

class Job:

    job_id = None,
    job_title = None

    def __init__(self):
        self.__job_dal = JobDAL()

    def get(self):
        return self.__job_dal.get()