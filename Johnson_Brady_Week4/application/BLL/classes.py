from DAL.classDAL import ClassDal

class Classes:
    class_id = None
    teacher = None
    room_number = None
    subject = None

    def __init__(self):
        self.__classDal = ClassDal()

    def post(self, teacher, room_number, subject):
        self.teacher = teacher
        self.room_number = room_number
        self.subject = subject
        self.class_id = self.__classDal.post(teacher, room_number, subject)
        return self

    def get(self, in_class_id):
        result = self.__classDal.get(in_class_id)
        for i in result:
            self.class_id = i['class_id']
            self.teacher = i['teacher']
            self.room_number = i['room_number']
            self.subject = i['subject']
        return self

class_1 = Classes()
class_1.post(1,124, 'Statistics')
print(class_1.teacher)

class_1.get(1)
print(class_1.teacher, class_1.subject)
