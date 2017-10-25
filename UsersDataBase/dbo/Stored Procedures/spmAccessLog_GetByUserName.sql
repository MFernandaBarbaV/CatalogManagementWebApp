CREATE PROCEDURE [dbo].[spmAccessLog_GetByUserName]
(
	@UserName varchar(127)
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
		([UserName] = @UserName)

	

	
END