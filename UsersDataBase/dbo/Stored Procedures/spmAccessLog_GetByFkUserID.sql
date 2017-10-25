CREATE PROCEDURE [dbo].[spmAccessLog_GetByFkUserID]
(
	@UserID int
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
		([UserID] = @UserID)

	

	
END