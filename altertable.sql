use son
alter table Student
add Address nvarchar(50)
alter table Student
add Province nvarchar(50), District nvarchar(50)
alter table Student 
alter column Name nvarchar(200)
alter table Student 
drop column District
sp_rename 'Student.Age','Tuoi','Column';