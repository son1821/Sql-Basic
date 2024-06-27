SELECT * FROM sys.dm_db_index_physical_stats  
    (DB_ID(N'AdventureWorks2017'), 
	OBJECT_ID(N'AWSales'), NULL, NULL , 'DETAILED');  

alter index PK__AWSales__C3905BAFD7DC3D75
on AWSales reorganize;

alter index PK__AWSales__C3905BAFD7DC3D75
on AWSales rebuild;