CREATE DATABASE SMS;

CREATE TABLE course(
	CourseNo VARCHAR(255) PRIMARY KEY,
	CourseName VARCHAR(255),
	NumberOfCredit INT
);

CREATE TABLE Department (
	Dept_id VARCHAR(255) PRIMARY KEY,
	DepartmentName VARCHAR(255)
);

CREATE TABLE Offered (
	Dept_id VARCHAR(255),
	CourseNo VARCHAR(255)
);

CREATE TABLE Teachers(
	T_ID VARCHAR(255) PRIMARY KEY,
	T_NAME VARCHAR(255),
	T_mobile VARCHAR(255)
);

CREATE TABLE TEACHES (
	T_ID VARCHAR(255),
	CourseNo VARCHAR(255)
);

CREATE TABLE STUDENT(
	Student_ID VARCHAR(255) PRIMARY KEY,
	Student_Name VARCHAR(255),
	DOB VARCHAR(100),
	Gender VARCHAR(10)
	
);


CREATE TABLE PARENTS(
	P_ID VARCHAR(255) PRIMARY KEY AUTO INCREMENT,
	F_name VARCHAR(255),
	M_name VARCHAR(255),
	contactNo VARCHAR(255)
);

CREATE TABLE HAS(
	Student_ID VARCHAR(255),
	P_ID VARCHAR(255)
);


CREATE TABLE BELONGS (
	Student_ID VARCHAR(255),
	Dept_id VARCHAR(255)
);

CREATE TABLE REGISTERED(
	Student_ID VARCHAR(255),
	CourseNo VARCHAR(255)
);

CREATE TABLE FACULTY(
	F_ID VARCHAR(255) PRIMARY KEY
);







SELECT s.Student_ID,Student_Name,DOB,Gender,F_name,M_name,contactNo FROM STUDENT s
JOIN HAS h ON s.Student_ID = h.Student_ID
JOIN PARENTS p ON p.P_ID = h.P_ID;

SELECT c.CourseNo, c.CourseName, c.NumberOfCredit, d.DepartmentName FROM course c
JOIN Offered o ON o.CourseNo = c.CourseNo
JOIN Department d ON d.Dept_id = o.Dept_id;

SELECT s.Student_ID,Student_Name,DOB,Gender,DepartmentName FROM STUDENT s 
JOIN BELONGS b ON s.Student_ID = b.Student_ID
JOIN Department d ON d.Dept_id = b.Dept_id;

SELECT s.Student_ID,Student_Name,DOB,Gender,F_name,M_name,contactNo FROM STUDENT s
LEFT JOIN HAS h ON s.Student_ID = h.Student_ID
LEFT JOIN PARENTS p ON p.P_ID = h.P_ID;

SELECT * FROM course;

SELECT TOP 1 * FROM PARENTS ORDER BY P_ID DESC;

SELECT * FROM course c 
JOIN REGISTERED r ON c.CourseNo = r.CourseNo
WHERE r.Student_ID = '160104100'; 

SELECT s.Student_ID,Student_Name,DOB,Gender,F_name,M_name,contactNo FROM STUDENT s
LEFT JOIN HAS h ON s.Student_ID = h.Student_ID
LEFT JOIN PARENTS p ON p.P_ID = h.P_ID
WHERE s.Student_ID LIKE '';

SELECT s.Student_ID,Student_Name,DOB,Gender,F_name,M_name,contactNo FROM STUDENT s
LEFT JOIN HAS h ON s.Student_ID = h.Student_ID
LEFT JOIN PARENTS p ON p.P_ID = h.P_ID
WHERE p.contactNo LIKE '1234%';