
--Table 1 
Create Table Patients (
PatientID Int Primary Key Identity(1,1),
FullName NVARCHAR(255) Not Null,
DOB Date Not Null,
Gender VARCHAR (50) Not Null,
Contact NVARCHAR(50) Not Null,
Address Text Not Null
)

INSERT INTO Patients (FullName, DOB, Gender, Contact, Address) VALUES
('John Doe', '1985-06-15', 'Male', '123-456-7890', '123 Main St, New York, NY'),
('Jane Smith', '1992-09-23', 'Female', '987-654-3210', '456 Oak St, Los Angeles, CA'),
('Michael Johnson', '1978-02-11', 'Male', '555-123-4567', '789 Pine St, Chicago, IL'),
('Emily Davis', '2000-07-05', 'Female', '222-789-4561', '101 Maple St, Houston, TX'),
('David Martinez', '1995-12-30', 'Male', '333-654-7890', '202 Birch St, Miami, FL'),
('Sophia Wilson', '1988-04-20', 'Female', '444-321-9876', '303 Cedar St, Seattle, WA'),
('James Brown', '1990-10-10', 'Male', '666-987-1234', '404 Redwood St, Boston, MA'),
('Olivia Taylor', '1975-05-25', 'Female', '777-456-8520', '505 Palm St, San Francisco, CA'),
('William Anderson', '1982-08-18', 'Male', '888-159-7536', '606 Spruce St, Denver, CO'),
('Emma Thomas', '1999-11-29', 'Female', '999-852-1470', '707 Fir St, Atlanta, GA')

Select * from Patients
Select * from Departments

--table 2

Create Table Departments (
DepartmentID Int Primary Key Identity (1,1),
DepartmentName VARCHAR (250)
)
INSERT INTO Departments (DepartmentName) VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('Oncology'),
('Dermatology'),
('General Surgery'),
('Radiology'),
('Psychiatry'),
('Emergency Medicine')

--table 3
Create Table Doctors (
DoctorID Int Primary Key Identity(1,1),
Name NVARCHAR (50) Not Null,
Specialty VARCHAR (50) Not Null,
Contact VARCHAR (50) Not Null, 
DepartmentID Int Not Null,
--Define Foreign Keys

CONSTRAINT FK_Doctors_Department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
)
INSERT INTO Doctors (Name, Specialty, Contact, DepartmentID) VALUES
('Dr. John Smith', 'Cardiology', '123-456-7890', 1),
('Dr. Jane Doe', 'Neurology', '987-654-3210', 2),
('Dr. Michael Brown', 'Orthopedics', '555-123-4567', 3),
('Dr. Emily Johnson', 'Pediatrics', '222-789-4561', 4),
('Dr. David Wilson', 'Oncology', '333-654-7890', 5),
('Dr. Sophia Martinez', 'Dermatology', '444-321-9876', 6),
('Dr. James Anderson', 'General Surgery', '666-987-1234', 7),
('Dr. Olivia Thomas', 'Radiology', '777-456-8520', 8),
('Dr. William Taylor', 'Psychiatry', '888-159-7536', 9),
('Dr. Emma White', 'Emergency Medicine', '999-852-1470', 10)

--Table 4
Create Table Appointments (
AppointmentID Int Primary Key Identity(1,1),
PatientID Int Not Null,
DoctorID Int Not Null,
AppointmentDate DateTime Not Null, 
Status VARCHAR (50) Not Null Check (Status IN ('Scheduled', 'Completed', 'canceled')),
--Define Foreign Keys

CONSTRAINT FK_Appointments_Patient FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
CONSTRAINT FK_Appointments_Doctor FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
)
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status) VALUES
(1, 1, '2025-02-20 10:30:00', 'Scheduled'),
(2, 2, '2025-02-21 14:00:00', 'Scheduled'),
(3, 3, '2025-02-22 09:00:00', 'Scheduled'),
(4, 4, '2025-02-23 11:15:00', 'Scheduled'),
(5, 5, '2025-02-24 15:00:00', 'Completed'),
(6, 6, '2025-02-25 08:30:00', 'Scheduled'),
(7, 7, '2025-02-26 13:00:00', 'Canceled'),
(8, 8, '2025-02-27 10:00:00', 'Scheduled'),
(9, 9, '2025-02-28 12:00:00', 'Completed'),
(10, 10, '2025-03-01 14:30:00', 'Scheduled')

--Select * from Appointments

--Select * from Doctors

--table 5

Create Table Rooms(
RoomID Int Primary Key Identity (1,1),
RoomType VARCHAR (50) Not Null,
Status VARCHAR (50) Not Null Check (Status IN ('Available', 'Occupied', 'Under Maintenance')), 
)
INSERT INTO Rooms (RoomType, Status) VALUES
('Single', 'Available'),
('Double', 'Occupied'),
('ICU', 'Occupied'),
('Single', 'Under Maintenance'),
('Double', 'Available'),
('Ward', 'Available'),
('Private', 'Occupied'),
('Single', 'Available'),
('ICU', 'Under Maintenance'),
('Private', 'Occupied')

Select * from Rooms

--table 6
Create Table MedicalRecords(
RecordID Int Primary Key Identity (1,1),
PatientID Int Not Null,
Diagnosis Text Not Null,
Treatment Text Not Null,
AdmissionDate Date Not Null,
DischargeDate Date Not Null,
RoomID Int Not Null,

CONSTRAINT FK_MedicalRecords_Patient FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
CONSTRAINT FK_MedicalRecords_Room FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
)
Select* from MedicalRecords

--Problem to insert data
INSERT INTO MedicalRecords (PatientID, Diagnosis, Treatment, AdmissionDate, DischargeDate, RoomID) VALUES
(1, 'Hypertension', 'Prescribed Amlodipine, Lifestyle modifications', '2025-02-10', '2025-02-15', 1),
(2, 'Migraine', 'Prescribed Sumatriptan, rest, hydration', '2025-02-12', '2025-02-13', 2),
(3, 'Fracture (Leg)', 'Surgery, Pain medication', '2025-02-14', '2025-02-20', 3),
(4, 'Asthma', 'Inhalers, Pulmonary rehabilitation', '2025-02-15', '2025-02-18', 4),
(5, 'Lung Cancer', 'Chemotherapy, Radiotherapy', '2025-02-16', '2025-02-25', 5),
(6, 'Skin Infection', 'Topical Antibiotics, Dressing', '2025-02-17', '2025-02-19', 6),
(7, 'Appendicitis', 'Appendectomy surgery', '2025-02-18', '2025-02-20', 7),
(8, 'Pneumonia', 'Antibiotics, Oxygen therapy', '2025-02-19', '2025-02-22', 8),
(9, 'Chronic Back Pain', 'Pain management, Physical therapy', '2025-02-20', '2025-02-24', 9),
(10, 'Diabetes', 'Insulin therapy, Diet management', '2025-02-21', '2025-02-26', 10)

--table 7
Create Table Billing(
BillID Int Primary Key Identity (1,1),
PatientID Int Not Null,
Amount Decimal (10, 2), 
PaymentStatus VARCHAR (50) Not Null Check (PaymentStatus IN ('Paid', 'Unpaid', 'Pending')),
Date Date Not Null Default GetDate (),

CONSTRAINT FK_Billing_Patient FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
)

INSERT INTO Billing (PatientID, Amount, PaymentStatus, Date) VALUES
(1, 500.00, 'Paid', '2025-02-15'),
(2, 300.00, 'Unpaid', '2025-02-16'),
(3, 750.00, 'Pending', '2025-02-17'),
(4, 450.50, 'Paid', '2025-02-18'),
(5, 1200.00, 'Unpaid', '2025-02-19'),
(6, 800.00, 'Paid', '2025-02-20'),
(7, 600.00, 'Pending', '2025-02-21'),
(8, 350.00, 'Unpaid', '2025-02-22'),
(9, 400.75, 'Paid', '2025-02-23'),
(10, 900.50, 'Pending', '2025-02-24')



--table 8
Create Table Prescriptions(
PrescriptionID Int Primary Key Identity (1,1),
AppointmentID Int Not Null,
Medicines Text Not Null,
Dosage VARCHAR (100) Not Null,
Instructions text Not Null,

CONSTRAINT FK_Prescriptions_Appointment FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
)

Select * from Prescriptions
 
INSERT INTO Prescriptions (AppointmentID, Medicines, Dosage, Instructions) VALUES
(1, 'Paracetamol, Amoxicillin', '500mg, 250mg', 'Take Paracetamol every 6 hours for fever. Take Amoxicillin twice a day after meals.'),
(2, 'Ibuprofen, Omeprazole', '400mg, 20mg', 'Take Ibuprofen for pain relief as needed. Omeprazole should be taken before breakfast.'),
(3, 'Cough Syrup, Vitamin C', '10ml, 500mg', 'Take 10ml of cough syrup before sleeping. Take Vitamin C daily for immunity.'),
(4, 'Metformin, Atorvastatin', '1000mg, 20mg', 'Metformin to be taken with meals twice daily. Atorvastatin before bedtime.'),
(5, 'Azithromycin', '500mg', 'Take one tablet daily for three days.'),
(6, 'Cetirizine, Montelukast', '10mg, 5mg', 'Take one Cetirizine tablet for allergies. Montelukast to be taken in the evening.'),
(7, 'Losartan, Aspirin', '50mg, 81mg', 'Losartan to be taken in the morning. Aspirin to be taken with food.'),
(8, 'Insulin Injection', 'Varies', 'Administer as per doctor’s instructions before meals.'),
(9, 'Ranitidine, Antacid', '150mg, 10ml', 'Take Ranitidine twice a day. Antacid as needed for acidity relief.'),
(10, 'Doxycycline', '100mg', 'Take one capsule twice a day for 7 days.')