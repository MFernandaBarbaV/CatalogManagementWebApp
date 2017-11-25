
CREATE PROCEDURE [dbo].[spUser_DoLogout]
(
	@UserID int
)
AS
BEGIN
	UPDATE Users 
	SET IsActiveSession = 0 
	WHERE UserID = @UserID 
END