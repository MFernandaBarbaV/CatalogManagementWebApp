-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Inserta un registro en la tabla mAccessLog.
-- =============================================
CREATE PROCEDURE [dbo].[spmAccessLog_Insert]
(
	@AccessLogID int = NULL OUTPUT,
	@UserID int,
	@UserName varchar(127) = NULL,
	@ProfileID int,
	@ProfileName varchar(50) = NULL,
	@OperationID int = NULL,
	@UserLogin varchar(50) = NULL,
	@ApplicationID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF;
	
	declare @oper int
	
	select @oper=operationID from mOperations where ApplicationID=@ApplicationID and SysOperation=@OperationID
	select @UserLogin=Login, @UserName=Name + ' ' + LastName from mUsers where UserID=@UserID
	select @ProfileName=Name from mProfiles where ProfileID=@ProfileID

	INSERT
	INTO [mAccessLog]
	(
		[UserID],
		[UserName],
		[ProfileID],
		[ProfileName],
		[OperationID],
		[UserLogin],
		[ApplicationID]
	)
	VALUES
	(
		@UserID,
		@UserName,
		@ProfileID,
		@ProfileName,
		@Oper,
		@UserLogin,
		@ApplicationID
	)

END