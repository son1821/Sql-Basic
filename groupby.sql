USE SON
create table Scores
(
ScoresId int,
MathScores int,
StudentId int

)
insert into Scores values(1,2,1)
insert into Scores values(2,3,2)
insert into Scores values(3,4,3)
insert into Scores values(4,5,4)
insert into Scores values(5,3,5)
select * from Student
insert into Student values(4,'Pham Thuy Q',0,16,'1998-05-21','ha noi','ha noi')
insert into Student values(4,'Pham Thuy B',0,27,'1968-05-21','ha noi','ha noi')
update Student set Id = 5 where Name = 'Pham Thuy B'
--group by
select Address, count(Id) as NumberOfAddress from Student 
group by Address
order by count(Id)
--group by with join
--how many student for each math scores?
--math scores : number of students
select c.MathScores, count(c.StudentId) as NumberOfStudents from Scores c left join Student on Id = c.StudentId 
group by c.MathScores
order by c.MathScores
