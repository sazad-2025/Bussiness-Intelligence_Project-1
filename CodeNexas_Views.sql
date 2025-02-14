--#1 View
 Alter View DoctorAppointments As
(
	Select 
	d.name as DoctorName,
	d.specialty,
	Count(a.AppointmentID) as TotalNumberOfAppointments
From Doctors d
Left Join Appointments a on d.DoctorID = a.DoctorID
Group By d.Name, d.Specialty
	
)

Select * from DoctorAppointments
Select * from Doctors
Select * from Appointments

--#2 View

Create View PatientsPerDepartment As
(
	Select
	d. DepartmentName,
	Count(Distinct m.PatientID) as TotalPatients
From Departments d
Join Doctors dr on dr.DepartmentID = d.DepartmentID
Join Appointments a on a.DoctorID = dr.DoctorID
Join MedicalRecords m on m.PatientID = a.PatientID
Group By d.DepartmentName
)

Select * from PatientsPerDepartment