use son

create table Persons1
(
Id int primary key,
Name nvarchar(50) not null,
Age int check(Age > 10)
)
insert into Persons1 values(1,'son',9) -- s? b�o l?i 
drop table Persons1
create table Persons1
(
Id int primary key,
Name nvarchar(50) not null,
Age int 
)
--th�m check constraint b?ng alter
alter table Persons1
add constraint CK_Person check(Age<20)
insert into Persons1 values(1,'hai',3)-- th�m th�nh c�ng tho? m�n 3<20