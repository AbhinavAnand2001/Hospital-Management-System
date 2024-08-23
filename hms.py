import tkinter as tk
from tkinter import simpledialog, messagebox
import mysql.connector

# Connect to the database
mydb = mysql.connector.connect(
   host="localhost",
   user="root",
   password="root",
   database="hospital_management_system"
)
mycursor = mydb.cursor()

# Create the Tkinter GUI
root = tk.Tk()
root.title("Hospital Management System")

# Define CRUD functions
def create_entity(entity):
   if entity == "Users":
       create_user()
   elif entity == "Doctors":
       create_doctor()
   elif entity == "Patients":
       create_patient()
   elif entity == "Medical Records":
       create_medical_record()
   elif entity == "Appointments":
       create_appointment()
   elif entity == "Departments":
       create_department()
   elif entity == "Medications":
       create_medication()

def read_entity(entity):
   if entity == "Users":
       read_users()
   elif entity == "Doctors":
       read_doctors()
   elif entity == "Patients":
       read_patients()
   elif entity == "Medical Records":
       read_medical_records()
   elif entity == "Appointments":
       read_appointments()
   elif entity == "Departments":
       read_departments()
   elif entity == "Medications":
       read_medications()

def update_entity(entity):
   if entity == "Users":
       update_user()
   elif entity == "Doctors":
       update_doctor()
   elif entity == "Patients":
       update_patient()
   elif entity == "Medical Records":
       update_medical_record()
   elif entity == "Appointments":
       update_appointment()
   elif entity == "Departments":
       update_department()
   elif entity == "Medications":
       update_medication()

def delete_entity(entity):
   if entity == "Users":
       delete_user()
   elif entity == "Doctors":
       delete_doctor()
   elif entity == "Patients":
       delete_patient()
   elif entity == "Medical Records":
       delete_medical_record()
   elif entity == "Appointments":
       delete_appointment()
   elif entity == "Departments":
       delete_department()
   elif entity == "Medications":
       delete_medication()

# CRUD functions for Users, Doctors, Patients, Medical Records, Appointments, Departments, Medications

def update_user():
   user_id = simpledialog.askinteger("Input", "Enter user ID to update:")
   new_username = simpledialog.askstring("Input", "Enter new username:")
   new_password = simpledialog.askstring("Input", "Enter new password:")
   new_role = simpledialog.askstring("Input", "Enter new role (admin/doctor/staff):")
   sql = "UPDATE users SET username = %s, password = %s, role = %s WHERE id = %s"
   val = (new_username, new_password, new_role, user_id)
   mycursor.execute(sql, val)
   mydb.commit()
   messagebox.showinfo("Success", "User updated successfully")

def update_doctor():
   doctor_id = simpledialog.askinteger("Input", "Enter doctor ID to update:")
   new_first_name = simpledialog.askstring("Input", "Enter doctor's new first name:")
   new_last_name = simpledialog.askstring("Input", "Enter doctor's new last name:")
   new_specialization = simpledialog.askstring("Input", "Enter doctor's new specialization:")
   sql = "UPDATE doctors SET first_name = %s, last_name = %s, specialization = %s WHERE id = %s"
   val = (new_first_name, new_last_name, new_specialization, doctor_id)
   mycursor.execute(sql, val)
   mydb.commit()
   messagebox.showinfo("Success", "Doctor updated successfully")

# Implement update functions for Patients, Medical Records, Appointments, Departments, and Medications in a similar manner

# Add buttons for each entity
entities = ["Users", "Doctors", "Patients", "Medical Records", "Appointments", "Departments", "Medications"]
for entity in entities:
   btn_create = tk.Button(root, text=f"Create {entity}", command=lambda entity=entity: create_entity(entity))
   btn_create.pack()
   btn_read = tk.Button(root, text=f"Read {entity}", command=lambda entity=entity: read_entity(entity))
   btn_read.pack()
   btn_update = tk.Button(root, text=f"Update {entity}", command=lambda entity=entity: update_entity(entity))
   btn_update.pack()
   btn_delete = tk.Button(root, text=f"Delete {entity}", command=lambda entity=entity: delete_entity(entity))
   btn_delete.pack()

root.mainloop()
