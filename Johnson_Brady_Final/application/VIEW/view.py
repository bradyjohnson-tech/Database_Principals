import toga
from toga.style.pack import COLUMN, Pack
import toga.widgets

from BLL.employee import Employee
from BLL.job import Job
from BLL.department import Department

#Instantiate Business Logic Layer
employee = Employee()
role = Job()
department = Department()

# Create View Layer
class View(toga.App):
        
    def startup(self):
        self.first_name = ""
        self.last_name = ""
        self.email = ""
        self.hire_date = ""


        self.all_employees = employee.get()


        self.role = toga.Selection(items=role.get(), style=Pack(padding=10))
        self.department = toga.Selection(items=department.get(), style=Pack(padding=10))


        self.all_employees_table =  toga.Table(headings=["Id", "First Name", "Last Name", "Email", "Hire Date", "Role", "Department"], data=self.all_employees)

        self.first_name =       toga.TextInput(placeholder="First Name")
        self.last_name =        toga.TextInput(placeholder="Last Name")
        self.email =            toga.TextInput(placeholder="Email Address")
        self.hire_date =        toga.TextInput(placeholder="Hire Date")



        right_content =                 toga.Box(style=Pack(direction=COLUMN, padding_top=50))
        input_box_fn =                  toga.Box(style=Pack(padding=10))
        input_box_ln =                  toga.Box(style=Pack(padding=10))
        input_box_email =               toga.Box(style=Pack(padding=10))
        input_box_hire_date =           toga.Box(style=Pack(padding=10))
        input_selection_role =          toga.Box(style=Pack(padding=10))
        input_selection_department =    toga.Box(style=Pack(padding=10))

        input_box_fn.add(self.first_name)
        input_box_ln.add(self.last_name)
        input_box_email.add(self.email)
        input_box_hire_date.add(self.hire_date)
        input_selection_role.add(self.role)
        input_selection_department.add(self.department)


        right_content.add(input_box_fn, input_box_ln, input_box_email, input_box_hire_date, input_selection_role, input_selection_department)
        right_content.add(
            toga.Button("Add Employee", on_press=self.add_employee_button_handler, style=Pack(width=200, padding=20))
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
        split.content = [(self.all_employees_table, 3), (self.right_container, 2)]

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


    def add_employee_button_handler(self, widget):


        employee.post(self.first_name.value, self.last_name.value, self.email.value, self.hire_date.value, self.role.value, self.department.value)
        self.all_employees = employee.get()

        # Refresh the left container data
        self.all_employees_table.data = self.all_employees

        # Clear the input fields
        self.first_name.value = ""
        self.last_name.value = ""
        self.email.value = ""
        self.hire_date.value = ""
        self.role = toga.Selection(items=role.get(), style=Pack(padding=10))
        self.department = toga.Selection(items=department.get(), style=Pack(padding=10))