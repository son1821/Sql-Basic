drop table Persons2
create table Persons2
(
Id int identity(1,2) primary key,
Name nvarchar(50)
)
insert into Persons2(Name) values('Quynh')
select * from Persons2