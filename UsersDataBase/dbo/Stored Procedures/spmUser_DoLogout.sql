-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Actualiza la columna IsActiveSession de la tabla mUsers donde el identificador primario coincida con el parámetro @UserID.
-- =============================================
CREATE PROCEDURE [dbo].[spmUser_DoLogout]
(
	@UserID int
)
AS
BEGIN
	UPDATE mUsers 
	SET IsActiveSession = 0 
	WHERE UserID = @UserID 
END