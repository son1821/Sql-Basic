alter table Bike 
add StudentId int foreign key references Student(Id)
alter table Student 
add constraint pk_Student primary key(Id)
alter table Bike 
add Foreign key (StudentId) references Student(Id)
alter table Bike 
drop constraint [FK__Bike__StudentId__4D94879B]