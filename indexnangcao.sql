select ProductNumber,SellEndDate,SellStartDate  from Production.Product
where ProductNumber like 'BE%'

CREATE TABLE dbo.CaSy(
CaSy_ID INT IDENTITY PRIMARY KEY,
Ten NVARCHAR(100),
Email VARCHAR(100),
CONSTRAINT UC_CaSy UNIQUE (Email)
)
GO
INSERT INTO dbo.CaSy VALUES(N'Thái Thanh','thanh@thaithanh.com')
INSERT INTO dbo.CaSy VALUES(N'Trần Thái Hòa',NULL)

CREATE UNIQUE INDEX idx_CaSyEmail ON dbo.CaSy(Email)
WHERE Email IS NOT NULL
select * from dbo.CaSy