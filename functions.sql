use son
create function udf_CalculateAgeStudent
(
@age int 
)
returns bit
as
begin
declare @allowbytikets bit
if @age >=20 
set @allowbytikets = 1
else
set @allowbytikets = 0
return @allowbytikets
end
select *, dbo.udf_CalculateAgeStudent(Tuoi) as AllowByTiket from Student 
-- table- valued functions
create function udf_StudenAgeThan
(
@age int
)
returns table
as
return
(
select * from Student where Tuoi < @age
)
select * from [dbo].[udf_StudenAgeThan](20)
--multi lines
alter function udf_GetNumberOfStudentsByAddress()
returns @NumberOfStudentsByAddress table
(
Adress nvarchar(50),
NumberofStudents int

)
as
begin
insert into @NumberOfStudentsByAddress
select Address,count(*)  from Student
group by Address
return
end
select * from udf_GetNumberOfStudentsByAddress()
