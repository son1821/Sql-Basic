use tempdb;

if exists (select * from sysobjects where 
name='Sales_Order' and type='U')
drop table Sales_Order;

CREATE TABLE Sales_Order
(
	Customer varchar(20), 
	Product varchar(10), 
	Quantity int
);

insert into Sales_Order values ('Minh Thu',  	 'Laptop',  	3);
insert into Sales_Order values ('Minh Thu',  	 'iPhone',  	2);
insert into Sales_Order values ('Minh Thu',  	 'Laptop',  	5);
insert into Sales_Order values ('Tuan Anh',  	 'Laptop',  	3);
insert into Sales_Order values ('Tuan Anh',  	 'iPhone',  	3);
insert into Sales_Order values ('Tuan Anh',  	 'iPhone',  	4);


select * from Sales_Order
pivot (sum(Quantity) for Product in ([Laptop],[iPhone])) as PivotedOrder

select Customer,[Laptop] from 
Sales_Order
pivot (sum(Quantity) for Product in ([Laptop],[iPhone])) as PivotedOrder

--UNPIVOT----


if exists (select * from sysobjects 
		where name='Sales_PivotedOrder' and type='U')
drop table Sales_PivotedOrder;

CREATE TABLE Sales_PivotedOrder
(
	Customer varchar(20), 
	Laptop int, 
	iPhone int
);

insert into Sales_PivotedOrder values ('Minh Thu',  	 8,  	2);
insert into Sales_PivotedOrder values ('Tuan Anh',  	 3,  	7);

select * from Sales_PivotedOrder;

select Customer,Product,Quantity from Sales_PivotedOrder
unpivot (Quantity for Product in ([Laptop],[iPhone])) as UnPVT