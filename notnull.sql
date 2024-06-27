drop table Person
create table Person
(
PersonId int primary key,
IdEntityNo varchar(50) not null,
PersonName nvarchar(50)
)
alter table Person
alter column PersonName nvarchar(100) not null
insert into Person values(1,'123','Son')