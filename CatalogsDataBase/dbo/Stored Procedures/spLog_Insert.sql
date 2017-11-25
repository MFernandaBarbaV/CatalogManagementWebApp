
CREATE PROCEDURE [dbo].[spLog_Insert]
(
	@AccessLogID int = NULL OUTPUT,
	@UserID int,
	@UserName varchar(127) = NULL,
	@OperationID int = NULL,
	@UserLogin varchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT OFF;
	
	declare @oper int
	
	select @oper=OperationID from Operations where  SysOperation=@OperationID
	select @UserLogin=Login, @UserName=Name + ' ' + LastName from Users where UserID=@UserID


	INSERT
	INTO [Log]
	(
		[UserID],
		[OperationID]
	)
	VALUES
	(
		@UserID,
		@Oper
	)

END