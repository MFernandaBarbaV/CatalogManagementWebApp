CREATE PROCEDURE [dbo].[spmAccessLog_GetLikeByUserName]
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
		([UserName] LIKE '%' + @UserName + '%')

	

	
END