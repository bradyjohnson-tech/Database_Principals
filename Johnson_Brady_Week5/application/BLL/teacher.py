from DAL.teacherDAL import TeacherDal

class Teacher:
    teacher_id = None
    teacher_first_name = None
    teacher_last_name = None
    teacher_email = None

    def __init__(self):
        self.__teacherDal = TeacherDal()

    def post(self, teacher_first_name, teacher_last_name, teacher_email):
        self.teacher_first_name = teacher_first_name
        self.teacher_last_name = teacher_last_name
        self.teacher_email = teacher_email
        self.teacher_id = self.__teacherDal.post(teacher_first_name, teacher_last_name, teacher_email)
        return self

    def get(self, in_teacher_id):
        result = self.__teacherDal.get(in_teacher_id)
        for i in result:
            self.teacher_id = i['teacher_id']
            self.teacher_first_name = i['teacher_first_name']
            self.teacher_last_name = i['teacher_last_name']
            self.teacher_email = i['teacher_email']
        return self

    def get_via_function_call(self, teacher_first_name, teacher_last_name):
        self.teacher_first_name = teacher_first_name
        self.teacher_last_name = teacher_last_name
        self.teacher_id = self.__teacherDal.get_via_function_call(teacher_first_name, teacher_last_name)
        return self



