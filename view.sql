alter view v_Students_AgeGreaterThan20
as
select*from Student where Tuoi > 20
with check option
select * from v_Students_AgeGreaterThan20
update v_Students_AgeGreaterThan20
set Tuoi = 36 where ID = 3
insert into v_Students_AgeGreaterThan20 values(6,'Ninh Van A',1,21,'1998-01-18','nam dinh','nam dinh')
delete from v_Students_AgeGreaterThan20 where Id = 3