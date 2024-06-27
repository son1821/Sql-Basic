create table t1 (id int primary key , t1_value nvarchar(50))

insert into t1 select 1, 'value 1'
insert into t1 select 2, 'value 2'
insert into t1 select 3, 'value 3'
create table t2 (id int primary key, t2_value nvarchar(50))
insert into t2 select 1, Null
insert into t2 select 2, Null
insert into t2 select 3, Null
select * from t1
select * from t2
alter trigger update_t2
on t1 for update
as
begin
update t2 set t2_value = i.t1_value
from inserted i inner join t2 on t2.id = i.id 
end 
update t1 set t1_value = 'Son' 
--ex2
create table Oders(
OderID int identity(1,1) primary key,
OrrderDateTime datetime,
OrderStatus nvarchar(50)
)
create table tblOrderAudit
(
OrderAuditId int identity(1,1) primary key,
OderID int ,
OrrderDateTime datetime,
OrderStatus nvarchar(50),
UpdateBy nvarchar(100),
UpdateOn datetime
)
--create trigger
create trigger trig_CreateOrderAudit on Oders
after update,insert
as
begin
insert into tblOrderAudit
select i.OderId,i.OrrderDateTime,i.OrderStatus,SUSER_NAME(),GETDATE() from Oders o inner join inserted i on i.OderId = o.OderID

end
insert into Oders values(NULL,'Pending')
insert into Oders values(NULL,'Pending')
insert into Oders values(NULL,'Pending')
select * from tblOrderAudit
update Oders
set OrderStatus = 'Approved', OrrderDateTime = GETDATE() WHERE OderID = 2