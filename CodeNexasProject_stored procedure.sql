--#1 Stored Procedure
CREATE PROCEDURE ScheduleAppointment
    @PatientID INT,
    @DoctorID INT,
    @AppointmentDate DATETIME,
    @Status VARCHAR(50)
AS
BEGIN
    -- Validate if the status is one of the allowed values
    IF @Status NOT IN ('Scheduled', 'Completed', 'Canceled')
    BEGIN
        PRINT 'Error: Invalid Appointment Status. Must be Scheduled, Completed, or Canceled.';
        RETURN;
    END

    -- Insert the appointment into the table
    INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status)
    VALUES (@PatientID, @DoctorID, @AppointmentDate, @Status);


    -- Print confirmation message
    PRINT 'Appointment Scheduled Successfully';
END

EXEC ScheduleAppointment
@PatientID = 3,
@DoctorID =  1,
@AppointmentDate = '2-14-2025', 
@Status = 'Scheduled'


Select * from Appointments

--#2 Stored Procedure
Alter procedure GetPatientHistory 
@PatientID Int
As
Begin 
	Select 
	p.FullName as PatientName,
	a.AppointmentDate as DateOfAppointment,
	d.name as WhoTreatedThePatient,
	m.Diagnosis,
	m.Treatment
	From Patients p
Left Join appointments a on p.PatientID = a.PatientID
Left Join Doctors d on d.DoctorID = a.DoctorID
Left Join MedicalRecords m on m.PatientID = a.PatientID
Where a.PatientID =@PatientID
Order By AppointmentDate DESC
End

EXEC GetPatientHistory
@PatientID = 3