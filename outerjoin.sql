use  son
select * from Student
--left outer join
select s.Id, s.Name,c.NameClass,c.ClassId from Student s 
left join Class c on ClassId = s.Id
delete from Class where ClassId = 1
-- right outer job
select s.Id, s.Name,c.NameClass,c.ClassId from Student s 
right join Class c on ClassId = s.Id
--full outer join
select * from Student s 
full outer join Class c on ClassId = s.Id
insert into Class values(4,'Lop 4') 