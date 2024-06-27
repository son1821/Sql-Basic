use son
create table Bike
(
BikeId int primary key,
BikeName nvarchar(100),
)
alter table Bike
drop constraint [PK__Bike__7DC81721741175B6]
alter table Bike 
add constraint pk_Bike primary key(BikeId, BikeName)
alter table Bike 
alter column BikeName nvarchar(100) not null