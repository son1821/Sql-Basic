use son;
CREATE TABLE Student
(
Id INT,
[Name] NVARCHAR(50),
Gender BIT,
Age INT,
DateOfBirth DATE
)
--DROP TABLE
DROP TABLE Student;
-- insert data to table
INSERT INTO Student(Id,Name,Gender,Age,DateOfBirth) VALUES(1,'Nguyen Van A',1,20,'1998-01-18' )
INSERT INTO Student(Id,Name,Gender,Age,DateOfBirth) VALUES(2,'Nguyen Van B',0,20,'1998-01-18' )
INSERT INTO Student(Id,Name,Gender,Age,DateOfBirth) VALUES(3,'Nguyen Van C',1,20,'1998-01-18' );
 SELECT * FROM Student
 --delete table
 DELETE FROM Student WHERE Id >2
 DELETE FROM Student
 TRUNCATE TABLE Student
 -- rename table
 sp_rename 'Student1' , 'Student'
 
 --copy table
 SELECT*INTO Student2 FROM Student
 SELECT * FROM Student2