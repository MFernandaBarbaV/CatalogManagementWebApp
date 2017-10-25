CREATE PROCEDURE [dbo].[spmAccessLog_Delete]
(
	@AccessLogID int
)
AS
BEGIN
	SET NOCOUNT OFF
	SELECT
		[AccessLogID],
		[UserID],
		[UserName],
		[ProfileID],
		[ProfileName],
		[OperationID],
		[CreationDate],
		[UserLogin],
		[ApplicationID]
	FROM [mAccessLog]
	WHERE
		([AccessLogID] = @AccessLogID)
	
	
	DELETE
	
	FROM [mAccessLog]
	WHERE
		[AccessLogID] = @AccessLogID
END