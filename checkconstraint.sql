use son

create table Persons1
(
Id int primary key,
Name nvarchar(50) not null,
Age int check(Age > 10)
)
insert into Persons1 values(1,'son',9) -- s? báo l?i 
drop table Persons1
create table Persons1
(
Id int primary key,
Name nvarchar(50) not null,
Age int 
)
--thêm check constraint b?ng alter
alter table Persons1
add constraint CK_Person check(Age<20)
insert into Persons1 values(1,'hai',3)-- thêm thành công tho? mãn 3<20