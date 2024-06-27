use son
create table School
(
SchoolName nvarchar(100),
AdressSchool nvarchar(50)
)
insert into School values(N'??i H?c', 'nam dinh')
insert into School values(N'Cao ??ng', 'ha noi')
insert into School values(N'??i H?c', 'thai binh')
insert into Student values(4,'Ninh Ngoc S',1,26,'1998-06-01','thai binh','thai binh')
sp_rename 'School.AdressSchool', 'AddressSchool','column'
select * from School
--in
select*from Student where Id in(1,4)
select name from Student where Address in(select AddressSchool from School where SchoolName =N'Cao ??ng')
--beween
select * from Student where Id between 2 and 4
--exists
select * from Student where exists(select AddressSchool from School where AddressSchool= 'thaibinh' )
--any,all
select name from Student where Address = any(select AddressSchool from School where AddressSchool = 'hanoi' )
select name from Student where Address = all(select AddressSchool from School where AddressSchool = 'thaibinh')
