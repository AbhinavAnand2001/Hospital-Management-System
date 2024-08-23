-- Create the database
CREATE DATABASE IF NOT EXISTS hospital_management_system;
USE hospital_management_system;

-- Create the Users table
CREATE TABLE IF NOT EXISTS users (
   id INT AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(255) NOT NULL,
   password VARCHAR(255) NOT NULL,
   role ENUM('admin', 'doctor', 'staff') NOT NULL
);

-- Insert 10 rows of data into the Users table
INSERT INTO users (username, password, role) VALUES
('admin1', 'adminpassword1', 'admin'),
('doctor1', 'doctorpassword1', 'doctor'),
('staff1', 'staffpassword1', 'staff'),
('staff2', 'staffpassword2', 'staff'),
('staff3', 'staffpassword3', 'staff'),
('staff4', 'staffpassword4', 'staff'),
('staff5', 'staffpassword5', 'staff'),
('staff6', 'staffpassword6', 'staff'),
('staff7', 'staffpassword7', 'staff'),
('staff8', 'staffpassword8', 'staff');

-- Create the Doctors table
CREATE TABLE IF NOT EXISTS doctors (
   id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255) NOT NULL,
   last_name VARCHAR(255) NOT NULL,
   specialization VARCHAR(255) NOT NULL
);

-- Insert 10 rows of data into the Doctors table
INSERT INTO doctors (first_name, last_name, specialization) VALUES
('John', 'Doe', 'Cardiology'),
('Jane', 'Smith', 'Pediatrics'),
('Michael', 'Johnson', 'Orthopedics'),
('Emily', 'Brown', 'Neurology'),
('David', 'Williams', 'Ophthalmology'),
('Sarah', 'Jones', 'Dermatology'),
('Christopher', 'Davis', 'Psychiatry'),
('Jessica', 'Miller', 'Gastroenterology'),
('Ryan', 'Wilson', 'Oncology'),
('Laura', 'Moore', 'Endocrinology');

-- Create the Patients table
CREATE TABLE IF NOT EXISTS patients (
   id INT AUTO_INCREMENT PRIMARY KEY,
   first_name VARCHAR(255) NOT NULL,
   last_name VARCHAR(255) NOT NULL,
   date_of_birth DATE NOT NULL
);

-- Insert 10 rows of data into the Patients table
INSERT INTO patients (first_name, last_name, date_of_birth) VALUES
('Alice', 'Johnson', '1985-10-15'),
('Bob', 'Smith', '1978-05-25'),
('Charlie', 'Brown', '1992-12-05'),
('Diana', 'Williams', '2000-02-20'),
('Ethan', 'Davis', '1989-08-30'),
('Fiona', 'Moore', '1975-03-10'),
('George', 'Taylor', '1982-06-18'),
('Hannah', 'Clark', '1995-09-22'),
('Ian', 'White', '1980-11-08'),
('Jennifer', 'Harris', '1998-04-12');

-- Create the Medical Records table
CREATE TABLE IF NOT EXISTS medical_records (
   id INT AUTO_INCREMENT PRIMARY KEY,
   diagnosis TEXT,
   treatment_plan TEXT,
   medications TEXT,
   patient_id INT,
   FOREIGN KEY (patient_id) REFERENCES patients(id)
);

-- Create the Appointments table
CREATE TABLE IF NOT EXISTS appointments (
   id INT AUTO_INCREMENT PRIMARY KEY,
   appointment_date DATETIME NOT NULL,
   reason TEXT,
   status VARCHAR(255),
   patient_id INT,
   doctor_id INT,
   FOREIGN KEY (patient_id) REFERENCES patients(id),
   FOREIGN KEY (doctor_id) REFERENCES doctors(id)
);

-- Create the Departments table
CREATE TABLE IF NOT EXISTS departments (
   id INT AUTO_INCREMENT PRIMARY KEY,
   department_name VARCHAR(255) NOT NULL
);

-- Insert 5 rows of data into the Departments table
INSERT INTO departments (department_name) VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('Oncology');

-- Create the Medications table
CREATE TABLE IF NOT EXISTS medications (
   id INT AUTO_INCREMENT PRIMARY KEY,
   medication_name VARCHAR(255) NOT NULL,
   dosage VARCHAR(255),
   instructions TEXT
);

-- Insert 5 rows of data into the Medications table
INSERT INTO medications (medication_name, dosage, instructions) VALUES
('Medication1', '10mg', 'Take once a day with food'),
('Medication2', '20mg', 'Take twice a day with water'),
('Medication3', '5mg', 'Take as needed for pain'),
('Medication4', '15mg', 'Take before bedtime'),
('Medication5', '30mg', 'Take with meals');

