-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Actualiza un registro de la tabla mProfiles donde el identificador primario coincida con el parámetro @ProfileID.
-- =============================================
CREATE PROCEDURE [dbo].[spmProfiles_Update]
(
	@ProfileID int,
	@Name varchar(50),
	@ApplicationID int
)
AS
BEGIN

	SET NOCOUNT ON
	
	UPDATE [mProfiles]
	SET
		[Name] = @Name,
		[ApplicationID] = @ApplicationID
	WHERE
		[ProfileID] = @ProfileID
		
	IF( @@ROWCOUNT = 0)
	BEGIN
	  SELECT 0 as Success
	END
	ELSE
	BEGIN
	  SELECT 1 as Success
	END		
END