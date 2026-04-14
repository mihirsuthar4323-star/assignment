class ClinicAppointment:
    def __init__(self):
        self.appointments = []
        self.time_slots = ["10am", "11am", "12pm", "2pm", "3pm"]
        self.max_per_slot = 3

    # ➔ Book Appointment
    def book_appointment(self):
        name = input("Enter patient name: ")
        age = int(input("Enter age: "))
        mobile = input("Enter mobile number: ")
        doctor = input("Enter doctor name: ")

        print("\nAvailable Time Slots:")
        for slot in self.time_slots:
            print(slot)

        slot = input("Choose a time slot: ")

        # Check valid slot
        if slot not in self.time_slots:
            print("Invalid slot!")
            return

        # Count existing bookings for doctor & slot
        count = 0
        for appt in self.appointments:
            if appt["doctor"] == doctor and appt["slot"] == slot:
                count += 1

        if count >= self.max_per_slot:
            print("Slot full for this doctor!")
        else:
            self.appointments.append({
                "name": name,
                "age": age,
                "mobile": mobile,
                "doctor": doctor,
                "slot": slot
            })
            print("Appointment booked successfully!")

    # ➔ View Appointment
    def view_appointment(self):
        mobile = input("Enter mobile number: ")
        found = False

        for appt in self.appointments:
            if appt["mobile"] == mobile:
                print("\nAppointment Details:")
                print(appt)
                found = True

        if not found:
            print("No appointment found!")

    # ➔ Cancel Appointment
    def cancel_appointment(self):
        mobile = input("Enter mobile number: ")

        for appt in self.appointments:
            if appt["mobile"] == mobile:
                self.appointments.remove(appt)
                print("Appointment cancelled!")
                return

        print("No appointment found!")

clinic = ClinicAppointment()
while True:
    print("1.appointmant booking")
    print("2.view booking")
    print("3.cancel booking")
    print("4.exit")

    choice=input("enter choice: ")
    if choice == "1":
        clinic.book_appointment()
    elif choice == "2":
        clinic.view_appointment()
    elif choice == "3":
        clinic.cancel_appointment()
    elif choice == "4":
        print("exiting....")
        break
    else:
        print("invalid choice")





