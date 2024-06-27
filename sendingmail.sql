SP_CONFIGURE 'show advanced options', 1;
GO
RECONFIGURE;
GO
SP_CONFIGURE 'Database Mail XPs', 1;
GO
RECONFIGURE
GO

EXEC  msdb.dbo.sp_send_dbmail
	@profile_name = 'SQLNANGCAO', --Tên profile tạo ở trên
	@recipients =  'ninh.ngocson98@gmail.com', --list các địa chỉ nhận
	@body =  'this is test', --nội dung email
	@body_format = 'HTML', --format html hay text
	@subject = 'test email'; --tiêu đề

	SELECT *
FROM msdb.dbo.sysmail_mailitems