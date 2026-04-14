class SchoolManagement:
    def __init__(self):
        self.students = {}
        self.next_id = 1

    # ➔ New Admission
    def new_admission(self):
        name = input("Enter student name: ")
        age = int(input("Enter age: "))

        # Age validation
        if age < 5 or age > 18:
            print("Age must be between 5 and 18")
            return

        student_class = int(input("Enter class (1-12): "))
        if student_class < 1 or student_class > 12:
            print("Class must be between 1 and 12")
            return

        mobile = input("Enter guardian mobile number: ")

        # Mobile validation
        if not (mobile.isdigit() and len(mobile) == 10):
            print("Mobile number must be 10 digits")
            return

        student_id = self.next_id
        self.next_id += 1

        self.students[student_id] = {
            "name": name,
            "age": age,
            "class": student_class,
            "mobile": mobile
        }

        print(f"Admission successful! Student ID: {student_id}")

    # ➔ View Student Details
    def view_student(self):
        student_id = int(input("Enter student ID: "))

        if student_id in self.students:
            print("Student Details:")
            print(self.students[student_id])
        else:
            print("Student not found!")

    # ➔ Update Student Info
    def update_student(self):
        student_id = int(input("Enter student ID: "))

        if student_id not in self.students:
            print("Student not found!")
            return

        print("1. Update Mobile")
        print("2. Update Class")
        choice = input("Enter choice: ")

        if choice == "1":
            mobile = input("Enter new mobile: ")
            if mobile.isdigit() and len(mobile) == 10:
                self.students[student_id]["mobile"] = mobile
                print("Mobile updated!")
            else:
                print(" Invalid mobile number")

        elif choice == "2":
            student_class = int(input("Enter new class: "))
            if 1 <= student_class <= 12:
                self.students[student_id]["class"] = student_class
                print("Class updated!")
            else:
                print("Invalid class")

        else:
            print("Invalid choice")

    # ➔ Remove Student Record
    def remove_student(self):
        student_id = int(input("Enter student ID: "))

        if student_id in self.students:
            del self.students[student_id]
            print("Student record removed")
        else:
            print("Student not found")

school = SchoolManagement()

while True:
    print("\n--- School Management System ---")
    print("1. New Admission")
    print("2. View Student")
    print("3. Update Student")
    print("4. Remove Student")
    print("5. Exit")

    choice = input("Enter choice: ")

    if choice == "1":
        school.new_admission()
    elif choice == "2":
        school.view_student()
    elif choice == "3":
        school.update_student()
    elif choice == "4":
        school.remove_student()
    elif choice == "5":
        print("Exiting...")
        break
    else:
        print("Invalid choice")