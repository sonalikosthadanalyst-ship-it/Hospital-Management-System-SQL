CREATE DATABASE hospital_db;
USE hospital_db;
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(50),
    Specialization VARCHAR(50)
);

CREATE TABLE Appointments (
    ApptID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    ApptDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
SELECT 
    p.Name AS PatientName, 
    d.Name AS DoctorName, 
    d.Specialization
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID;
SELECT 
    d.Name AS DoctorName, 
    COUNT(a.ApptID) AS TotalAppointments
FROM Doctors d
JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.Name;
SELECT * FROM Patients;
SELECT * FROM Doctors WHERE Specialization = 'Cardiologist';
SELECT 
    d.Name AS DoctorName, 
    COUNT(a.ApptID) AS TotalAppointments
FROM Doctors d
JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.Name;