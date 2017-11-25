CREATE PROCEDURE [dbo].[spOperationUser_Insert]
	@Operation int ,
	@User int
AS

IF NOT EXISTS (SELECT * FROM DBO.UserOperations WHERE UserID = @User AND OperationID = @Operation)
BEGIN
	INSERT INTO dbo.UserOperations (UserID, OperationID) VALUES (@User, @Operation)
END

RETURN 0
