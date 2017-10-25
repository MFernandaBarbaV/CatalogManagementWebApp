CREATE PROCEDURE [dbo].[spmAccessLog_GetByID]
(
	@AccessLogID int
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
		[ApplicationID]
	FROM [mAccessLog]
	WHERE
		([AccessLogID] = @AccessLogID)

	

	
END