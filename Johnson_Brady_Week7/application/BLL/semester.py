from DAL.semesterDAL import SemesterDal

class Semester:
    semester_id = None
    start = None
    end = None

    def __init__(self):
        self.__semesterDAL = SemesterDal()

    def post(self, start, end):
        self.start = start
        self.end = end
        self.semester_id = self.__semesterDAL.post(start, end)
        return self

    def get(self, in_semester_id):
        result = self.__semesterDAL.get(in_semester_id)
        for i in result:
            self.semester_id = i['semester_id']
            self.start = i['start']
            self.end = i['end']
        return self
