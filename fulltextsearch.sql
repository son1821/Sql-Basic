SELECT SERVERPROPERTY('IsFullTextInstalled')

select * from HumanResources.Employee

select JobTitle from HumanResources.Employee
where freetext(JobTitle,'marketing manager')

select JobTitle from HumanResources.Employee
where contains(JobTitle,'"marketing" and "manager"')

select JobTitle from HumanResources.Employee
where JobTitle like '%marketing manager%'

--New database

select * from Product where Name like '%binh%'
select * from Product where Name like '%bình%'
select * from Product where contains(Name,'binh')

select * from Product where Name like '%chu%'
select * from Product where contains(Name,'chu')

--FREETEXTTABLE
select ID,Name,KEY_TBL.[KEY],KEY_TBL.RANK from Product p
inner join FREETEXTTABLE(Product,Name,'sh125') as KEY_TBL
on p.ID = KEY_TBL.[KEY]
order by KEY_TBL.RANK DESC

