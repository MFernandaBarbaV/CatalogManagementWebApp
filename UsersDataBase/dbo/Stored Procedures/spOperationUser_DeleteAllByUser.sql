CREATE PROCEDURE [dbo].[spOperationUser_DeleteAllByUser]
	@UserId int
AS
	DELETE FROM dbo.UserOperations WHERE UserID = @UserId
RETURN 0
