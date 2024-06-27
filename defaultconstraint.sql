use son

create table Persons1
(
Id int primary key,
Name nvarchar(50) not null,
City nvarchar(50) default('Ha Noi')
)
insert into Persons1(Id,Name) values(1,'son') 
select * from Persons1
drop table Persons1
--thêm default constraint b?ng alter
create table Persons1
(
Id int primary key,
Name nvarchar(50) not null,
City nvarchar(50)  
)
alter table Persons1
add constraint DF_Person default('Nam Dinh') for City
insert into Persons1(Id,Name) values(1,'hai')