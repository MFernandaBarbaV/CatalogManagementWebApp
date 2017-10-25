-- =============================================
-- Author:		Daniel Robles
-- Create date: Thuesday May 6, 2010
-- Description:	Actualiza la columna Password de la tabla mUsers donde la columna Email coincida con el parámetro @UserEmail.
-- =============================================
CREATE PROCEDURE [dbo].[spResetUserPasswordByEmail]
( 
	@UserEmail varchar(40), 
	@NewPassword varchar(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRANSACTION
	
		UPDATE mUsers
		SET mUsers.[Password] = @NewPassword,
			IsFirstSession=1
		WHERE mUsers.[Email] = @UserEmail
	    
		IF (@@ERROR <> 0 or @@RowCount <= 0)
		BEGIN
			ROLLBACK
			RETURN
		END
		
	COMMIT TRAN
	
	RETURN(1)
	
END