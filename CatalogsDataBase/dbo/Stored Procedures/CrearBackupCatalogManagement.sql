CREATE PROCEDURE [dbo].[CrearBackupCatalogManagement]
	@path nvarchar(256) = NULL
AS
	IF @path IS NULL
	SET @path = N'D:\Backup\'

		DECLARE @name NVARCHAR(50) -- database name  
		DECLARE @fileName NVARCHAR(256) -- filename for backup  
		DECLARE @fileDate NVARCHAR(20) -- used for file name
		
		-- specify filename format
		SELECT @fileDate = CONVERT(NVARCHAR(20),GETDATE(),112)  
		SET @name = 'CatalogManagementDB'
		SET @fileName = @path + @name + '_' + @fileDate + '.BAK'  
		
		BACKUP DATABASE @name TO DISK = @fileName  
 
		 
RETURN 0
