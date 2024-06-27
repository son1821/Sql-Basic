
create table Orders
(
OrderId int identity(1,1) primary key,
OrderName nvarchar(50) not null,
--date
DateOfOrder Date
)
insert into Orders(OrderName,DateOfOrder) VALUES('banh xi bao',GETDATE()  ) 
select * from Orders
select * from Orders where DateOfOrder = '2023-12-15' 
--datetime
alter table Orders
alter column DateOfOrder DateTime
select * from Orders where DateOfOrder = '2023-12-15' -- khong tim thay
select DATEADD(day, 30,GETDATE()) as date
select DATEDIFF(day,GETDATE(),'2024-01-31')
select DATENAME(day,GETDATE()) 
select DAY(GETDATE()) 
select DATEADD(day, 30,GETDATE()) as date
select GETUTCDATE()
select MONTH(GETDATE()) 
select year(GETDATE()) 


