drop table Person
create table Person
(
PersonId int primary key,
IdEntityNo varchar(50) unique ,
PersonName nvarchar(50)
)
alter table Person
add constraint UN_Person unique(PersonName) 
insert into Person values(1,'123','Son')
insert into Person values(2,'124','Quynh')
select*from Person