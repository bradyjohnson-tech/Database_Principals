import toga
from toga.style.pack import COLUMN, Pack
import toga.widgets
from BLL.student import Student
from BLL.teacher import Teacher

#instantiate Business Logic Layer
student = Student()
teacher = Teacher()

# Create View Layer

class View(toga.App):
        
    def startup(self):
        self.first_name = ""
        self.last_name = ""
        self.email = ""
        self.student_id = ""

        self.all_students = student.get_all_students()
        self.student_grades = None
        self.student_grades_table = toga.Table(headings=["First Name", "Last Name", "Subject", "Grade"], data=self.student_grades)
        self.left_container = toga.Table(headings=["Id", "First Name", "Last Name", "Email"], data=self.all_students)

        right_content = toga.Box(style=Pack(direction=COLUMN, padding_top=50))
        input_box_fn = toga.Box(style=Pack(padding=10))
        input_box_ln = toga.Box(style=Pack(padding=10))
        input_box_email = toga.Box(style=Pack(padding=10))
        input_box_student_id = toga.Box(style=Pack(padding=10))
        input_box_semester_id = toga.Box(style=Pack(padding=10))

        self.first_name = toga.TextInput(placeholder="First Name")
        self.last_name = toga.TextInput(placeholder="Last Name")
        self.email = toga.TextInput(placeholder="Email Address")
        self.student_id = toga.TextInput(placeholder="Student ID")
        self.semester_id = toga.TextInput(placeholder="Semester ID")

        input_box_fn.add(self.first_name)
        input_box_ln.add(self.last_name)
        input_box_email.add(self.email)
        input_box_student_id.add(self.student_id)
        input_box_semester_id.add(self.semester_id)


        right_content.add(
                input_box_fn,
                input_box_ln,
                input_box_email
        )
        right_content.add(
                toga.Button("Add Student",
                    on_press=self.add_student_button_handler,
                    style=Pack(width=200, padding=20),
                )
            )
        right_content.add(
            input_box_student_id,
            input_box_semester_id
        )

        right_content.add(
            toga.Button("Get Grades",
                        on_press=self.get_grades_button_handler,
                        style=Pack(width=200, padding=20),
                        )
        )
        right_content.add(
            self.student_grades_table
        )

        self.right_container = toga.ScrollContainer(horizontal=False)

        self.right_container.content = right_content




        split = toga.SplitContainer()

        # The content of the split container can be specified as a simple list:
        #    split.content = [left_container, right_container]
        # but you can also specify "weight" with each content item, which will
        # set an initial size of the columns to make a "heavy" column wider than
        # a narrower one. In this example, the right container will be twice
        # as wide as the left one.
        split.content = [(self.left_container, 1), (self.right_container, 1)]

        # Create a "Things" menu group to contain some of the commands.
        # No explicit ordering is provided on the group, so it will appear
        # after application-level menus, but *before* the Command group.
        # Items in the Things group are not explicitly ordered either, so they
        # will default to alphabetical ordering within the group.
        

        # The order in which commands are added to the app or the toolbar won't
        # alter anything. Ordering is defined by the command definitions.
     

        self.main_window = toga.MainWindow()
        # Command 2 has not been *explicitly* added to the app. Adding it to
        # a toolbar implicitly adds it to the app.
      
        self.main_window.content = split

        self.main_window.show()


    def add_student_button_handler(self, widget):

        # Add the student and refresh the student list. This sucked to figure out.
        student.post(self.first_name.value, self.last_name.value, self.email.value, None, None)
        self.all_students = student.get_all_students()

        # Refresh the left container data
        self.left_container.data = self.all_students

        # Clear the input fields
        self.first_name.value = ""
        self.last_name.value = ""
        self.email.value = ""



    def get_grades_button_handler(self,widget):
        self.student_grades = student.get_student_grades(int(self.student_id.value), int(self.semester_id.value))

        self.student_grades_table.data = self.student_grades

        self.student_id.value = ""
        self.semester_id.value = ""






    