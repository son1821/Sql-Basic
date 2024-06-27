create procedure usp_MakeScore
--input
@Parameter1 int,
@Parameter2 int
as 
begin
insert into Scores values(@Parameter1,2,3)
update Student set Id=Id+1 where Tuoi = @Parameter2
select*from Student
select*from Scores
end
execute usp_MakeScore 3,27
create procedure usp_StudentName
--output
@StudentID int,
@StudentName nvarchar(50) output
as
begin
Select @StudentName = Name
From Student 
where Id = @StudentID
end
DECLARE @name nvarchar(50)
execute usp_StudentName 3,@name output
select @name as name
drop procedure usp_StudentName
