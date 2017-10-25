CREATE PROCEDURE [dbo].[spmAccessLog_GetByFkProfileID]
(
	@ProfileID int
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
		([ProfileID] = @ProfileID)

	

	
END