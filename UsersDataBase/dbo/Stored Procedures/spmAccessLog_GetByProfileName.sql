CREATE PROCEDURE [dbo].[spmAccessLog_GetByProfileName]
(
	@ProfileName varchar(50)
)
AS
BEGIN
	SET NOCOUNT ON
	

	SELECT
		[AccessLogID],
		[UserID],
		[UserName],
		[ProfileID],
		[ProfileName],
		[OperationID],
		[CreationDate],
		[UserLogin],
		[ApplicationID]	FROM [mAccessLog]
	WHERE
		([ProfileName] = @ProfileName)

	

	
END