-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Inserta un registro en la tabla mProfiles.
-- =============================================
CREATE PROCEDURE [dbo].[spmProfiles_Insert]
(
	@ProfileID int = NULL OUTPUT,
	@Name varchar(50),
	@ApplicationID int
)
AS
BEGIN

	SET NOCOUNT ON

	INSERT
	INTO [mProfiles]
	(
		[Name],[ApplicationID],[IsReadOnly]
	)
	VALUES
	(
		@Name, @ApplicationID, 0
	)
	
	set @ProfileID =(SELECT @@IDENTITY)
	
END