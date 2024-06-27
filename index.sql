create clustered index IX_Student1_Id
on Student1(Id)

create nonclustered index IX_Student_NameAge
on Student1(Name,Age)
select * from Student1