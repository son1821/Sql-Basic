
create table ##sample_temp
(
Id INT,
Name NVARCHAR(50)
)
insert into #sample_temp values(1,'son')
select*from ##sample_temp