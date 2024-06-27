IF OBJECT_ID (N'dbo.AWSales', N'U') IS NOT NULL
DROP TABLE dbo.AWSales;
GO
 
CREATE TABLE dbo.AWSales
(
  OrderID INT PRIMARY KEY IDENTITY(101, 1),
  SalesOrderID INT NOT NULL,
  OrderDetailID INT NOT NULL,
  ProductID INT NOT NULL,
  LineTotal MONEY NOT NULL
);

INSERT INTO dbo.AWSales 
  (SalesOrderID, OrderDetailID, ProductID, LineTotal)
SELECT SalesOrderID, SalesOrderDetailID, ProductID, LineTotal
FROM AdventureWorks2017.Sales.SalesOrderDetail
WHERE SalesOrderDetailID < 60000;

SELECT s.stats_id StatsID,
  s.name StatsName,
  sc.stats_column_id StatsColID,
  c.name ColumnName 
FROM sys.stats s 
  INNER JOIN sys.stats_columns sc
    ON s.object_id = sc.object_id AND s.stats_id = sc.stats_id
  INNER JOIN sys.columns c
    ON sc.object_id = c.object_id AND sc.column_id = c.column_id
WHERE OBJECT_NAME(s.object_id) = 'awsales' 
ORDER BY s.stats_id, sc.column_id;

SELECT *
FROM AWSales 
WHERE ProductID = 898
OPTION(RECOMPILE);

SELECT s.stats_id StatsID,
  s.name StatsName,
  sc.stats_column_id StatsColID,
  c.name ColumnName 
FROM sys.stats s 
  INNER JOIN sys.stats_columns sc
    ON s.object_id = sc.object_id AND s.stats_id = sc.stats_id
  INNER JOIN sys.columns c
    ON sc.object_id = c.object_id AND sc.column_id = c.column_id
WHERE OBJECT_NAME(s.object_id) = 'awsales'
ORDER BY s.stats_id, sc.column_id;


IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'ixOrders')  
DROP INDEX ixOrders ON dbo.AWSales; 
GO
 
CREATE INDEX ixOrders ON dbo.AWSales(SalesOrderID, OrderDetailID);

DBCC SHOW_STATISTICS (AWSales, ixOrders);

UPDATE STATISTICS dbo.AWSales WITH FULLSCAN;

  
SELECT *
FROM AWSales 
WHERE ProductID = 898

