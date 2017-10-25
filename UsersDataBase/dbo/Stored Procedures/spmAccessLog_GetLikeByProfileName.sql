CREATE PROCEDURE [dbo].[spmAccessLog_GetLikeByProfileName]
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
		([ProfileName] LIKE '%' + @ProfileName + '%')

	

	
END