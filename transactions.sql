drop table valuetable
create table valuetable(value int)
begin transaction
insert into valuetable values(1)
insert into valuetable values(2)
commit
select*from valuetable
select*from Student
declare @tranName varchar(20) = 'DeleteStudent'
begin transaction @tranName
delete Student where Id = 2
commit transaction @tranName