CREATE PROCEDURE [dbo].[spmAccessLog_GetLikeByUserLogin]
(
	@UserLogin varchar(50)
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
		([UserLogin] LIKE '%' + @UserLogin + '%')

	

	
END