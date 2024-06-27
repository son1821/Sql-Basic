use son
select Name,SchoolName,AddressSchool from Student inner join School on AddressSchool = Student.Address 
delete from School where AddressSchool = 'nam dinh'
drop table Class
select * from School
create table Class  
(
ClassId int,
NameClass nvarchar(100)
)
insert into Class values(1,'Lop 1')
insert into Class values(2,'Lop 2')
insert into Class values(3,'Lop 3')

update School set SchoolId = '1' where AddressSchool = 'ha noi'
update School set SchoolId = '2' where AddressSchool = 'thai binh'
select s.Name,n.SchoolName,c.NameClass from Student s inner join Class c on ClassId = s.Id inner join School n on SchoolId = s.Id