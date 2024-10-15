from BLL.classes import Classes
from BLL.semester import Semester
from VIEW.view import View

if __name__ == '__main__':
    View("CSC6302 SCHOOL DB", "User Views App").main_loop()

    # semester = Semester()
    # semester.post("2023-01-01", "2024-01-01")
    # print(semester.semester_id)