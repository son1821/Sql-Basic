CREATE DATABASE PartTest
GO
USE PartTest
GO
-- tạo filegroup
ALTER DATABASE PartTest ADD FILEGROUP FG2009AndBefore 
ALTER DATABASE PartTest ADD FILEGROUP FG2010 
ALTER DATABASE PartTest ADD FILEGROUP FG2011AndAfter

--thêm data vào mỗi group
ALTER DATABASE PartTest ADD FILE (NAME = N'FY2009AndBefore', FILENAME = N'D:\PartTest\FY2009AndBefore.ndf') TO FILEGROUP FG2009AndBefore 
ALTER DATABASE PartTest ADD FILE (NAME = N'FY2010', FILENAME = N'D:\PartTest\FY2010.ndf') TO FILEGROUP FG2010 
ALTER DATABASE PartTest ADD FILE (NAME = N'FY2011AndAfter', FILENAME = N'D:\PartTest\FY201AndAfter.ndf') TO FILEGROUP FG2011AndAfter

--Tạo partition function và partition scheme

USE PartTest
GO
CREATE PARTITION FUNCTION PFunc_NGD(DATETIME) AS 
RANGE RIGHT FOR VALUES ('2010-01-01', '2011-01-01')
GO
CREATE PARTITION SCHEME PScheme_NGD AS PARTITION PFunc_NGD 
TO (FG2009AndBefore, FG2010, FG2011AndAfter)

--Đoạn 1: Từ trước đến 2009-12-31 23:59:59
--Đoạn 2: 2010-01-01 00:00:00 đến 2010-12-31 23:59:59
--Đoạn 3: 2011-01-01 00:00:00 về sau

--Tạo bảng sử dụng partition scheme
USE PartTest
GO
CREATE TABLE dbo.BanHang(
	BangHang_ID INT IDENTITY,
	NgayGiaoDich DATETIME,
	MaSP INT,
	SoLuong INT,
	ThanhTien INT
) ON PScheme_NGD(NgayGiaoDich)
GO
CREATE CLUSTERED INDEX CI_BanHang_NGD 
ON dbo.BanHang(NgayGiaoDich) ON PScheme_NGD(NgayGiaoDich)

SELECT $PARTITION.PFunc_NGD('2008-07-24')
SELECT $PARTITION.PFunc_NGD('2009-12-31')
SELECT $PARTITION.PFunc_NGD('2010-01-01')
SELECT $PARTITION.PFunc_NGD('2010-11-25')
SELECT $PARTITION.PFunc_NGD('2011-03-16')



---------Phân đoạn chiều dọc-------
CREATE TABLE BangBeo(ID INT, txt1 CHAR(10), txt2 CHAR(8000) )
CREATE TABLE BangGay(ID INT, txt1 CHAR(10) )
CREATE TABLE BangBeoPhu(ID INT, txt2 CHAR(8000) )
GO
DECLARE @i INT
SET @i=1
WHILE @i<=100   
BEGIN
INSERT BangBeo (ID, txt1, txt2)
SELECT @i, REPLICATE('a',10), REPLICATE('a',8000)
 
INSERT BangGay (ID, txt1)
SELECT @i, REPLICATE('a',10)
 
INSERT BangBeoPhu (ID, txt2)
SELECT @i, REPLICATE('a',8000)
SET @i=@i+1
END
GO
--ghi dữ liệu ra đĩa và xóa cache
CHECKPOINT
 
-- hiện thống kê về vào ra đĩa
SET STATISTICS IO ON
 
-- xóa cache để đảm bảo công bằng khi so sánh
DBCC DROPCLEANBUFFERS 
 
SELECT ID, txt1
FROM BangBeo
 
-- xóa lại cache
DBCC DROPCLEANBUFFERS
 
SELECT ID, txt1
FROM BangGay