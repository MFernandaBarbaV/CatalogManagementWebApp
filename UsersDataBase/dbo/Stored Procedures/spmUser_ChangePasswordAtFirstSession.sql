-- =============================================
-- Author:		Esteban Cruz
-- Create date: 2011/09/12
-- Description:	Actualiza la contraseña del usuario cuando inicia sesion por primera vez.
-- =============================================
CREATE PROCEDURE [dbo].[spmUser_ChangePasswordAtFirstSession] 
	-- Add the parameters for the stored procedure here
	@userID int, @currentPassword varchar(50), @newPassword varchar(50)
AS
BEGIN
	SET NOCOUNT Off;
	if exists(select * from mUsers WHERE [UserID]=@userID and [Password]=@currentPassword)
	begin
		UPDATE mUsers
		SET [Password] = @newPassword, [IsFirstSession]=0, [IsActiveSession]=0
		WHERE [UserID]=@userID and [Password]=@currentPassword
	end
	else
	begin
		raiserror('000057', 16, 1)
		return
	end
END