select * from Student
select id,name from Student where id != 3
select * from Student where id >= 1 and Tuoi <=21
select * from Student order by id desc
-- select distinct
select Gender from Student
select distinct Gender from Student
-- select top
select top 2 name From Student where Gender = 1
-- select min/max
select min(Id)
From Student 
where gender = 0
select max(Id)
From Student 
--COUNT
select count(gender) from Student where gender = 1
--AVG
select avg(tuoi) from Student where tuoi < 22
--SUM
select sum(tuoi) from student 
--alias
select avg(tuoi) as tuoitb from Student where tuoi < 22
select sum(tuoi) as tongtuoi from student
--union
select name from Student
UNION 
select name from Student2
--isnull
select*from Student
update Student set Address = null where Name = 'Nguyen Van C'
select name,ISNULL(Address,'no address') from Student 
-- INTO
select * into Student3 from Student where id>1
select * from student3