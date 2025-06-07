CREATE DATABASE University;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentNAME VARCHAR(50),
    Age INT,
    PhoneNumber VARCHAR(15)
);


CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    Name VARCHAR(50),
    Schedule VARCHAR(50)
   );

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    Name VARCHAR(50),
    OfficeLocation VARCHAR(100)
);

CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50)
    );


CREATE TABLE Enrollment (
    EnrollID INT PRIMARY KEY,
        Grade VARCHAR(15)
);
INSERT INTO Student (StudentID, StudentNAME, Age, PhoneNumber) VALUES

(1, 'Ahmed Hassan', 21, '01067891234'),
(2, 'Sarah Mohamed', 22, '01123456789'),
(3, 'Ali Mahmoud', 20, '01298765432'),
(4, 'Nada Ibrahim', 23, '01534567890'),
(5, 'Youssef Khaled', 24, '01055667788'),
(6, 'Marwa Sami', 22, '01177889900'),
(7, 'Ehab Abdullah', 21, '01299887766'),
(8, 'Rana Fouad', 25, '01566554433'),
(9, 'Salim Adel', 23, '01011223344'),
(10, 'Aya Mostafa', 22, '01144556677');


INSERT INTO Course  (CourseID,Name,Schedule) VALUES
(1, 'Database Systems', 'Sun-Tue 9-10 AM'),
(2, 'Calculus', 'Mon-Wed 10-11 AM'),
(3, 'General Physics', 'Tue-Thu 11-12 AM'),
(4, 'Organic Chemistry', 'Wed-Fri 12-1 PM'),
(5, 'Genetics', 'Mon-Wed 1-2 PM'),
(6, 'English Literature', 'Tue-Thu 2-3 PM'),
(7, 'World History', 'Mon-Wed 3-4 PM'),
(8, 'Geography', 'Tue-Thu 4-5 PM'),
(9, 'Microeconomics', 'Mon-Wed 5-6 PM'),
(10, 'Political Theory', 'Tue-Thu 6-7 PM');


INSERT INTO Department   (DeptID,Name,  OfficeLocation ) VALUES
(1, 'Computer Science', 'Building A'),
(2, 'Mathematics', 'Building B'),
(3, 'Physics', 'Building C'),
(4, 'Chemistry', 'Building D'),
(5, 'Biology', 'Building E'),
(6, 'English Literature', 'Building F'),
(7, 'History', 'Building G'),
(8, 'Geography', 'Building H'),
(9, 'Economics', 'Building I'),
(10, 'Political Science', 'Building J');

INSERT INTO Instructor  (InstructorID,Name,Email) VALUES
(1, 'Dr. Sami', 'sami@gmail.com'),
(2, 'Dr. Maha', 'maha@gmail.com'),
(3, 'Dr. Ahmed', 'ahmed@gmail.com'),
(4, 'Dr. Nada', 'nada@gmail.com'),
(5, 'Dr. Khaled', 'khaled@gmail.com'),
(6, 'Dr. Ali', 'ali@gmail.com'),
(7, 'Dr. Fatima', 'fatima@gmail.com'),
(8, 'Dr. Youssef', 'youssef@gmail.com'),
(9, 'Dr. Salim', 'salim@gmail.com'),
(10, 'Dr. Aya', 'aya@gmail.com');




INSERT INTO Enrollment(EnrollID,Grade) VALUES
(1,'A'),
(2,'B+'),
(3,'B'),
(4,'C+'),
(5,'A-'),
(6,'B+'),
(7,'C'),
(8,'B'),
(9,'A'),
(10,'C+');



SELECT Student.StudentName, Enrollment.Grade
FROM Student
JOIN Enrollment ON Student.StudentID = Enrollment.EnrollID;

SELECT COUNT(*) 
FROM Instructor;

SELECT COUNT(*) 
FROM Department
WHERE OfficeLocation IN ('Building A', 'Building B');


SELECT * FROM Course
WHERE Schedule LIKE '%Mon%';

SELECT MAX(Age) , MIN(Age) 
FROM Student;

SELECT StudentName, Age, PhoneNumber
FROM Student
WHERE Age > 22;