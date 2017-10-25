-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Actualiza un registro de la tabla mApplications donde el identificador primario coincida con el parámetro @ApplicationID.
-- =============================================
CREATE PROCEDURE [dbo].[spmApplications_Update]
(
	@ApplicationID int,
	@Name varchar(50),
	@Type varchar(25) = NULL,
	@Origin varchar(255) = NULL,
	@ReleaseDate DateTime,
	@Version varchar(30),
	@StatusID int=null
)
AS
BEGIN

	SET NOCOUNT OFF
	
	UPDATE [mApplications]
	SET
		[Name] = @Name,
		[Type] = @Type,
		[Origin] = @Origin,
		[ReleaseDate]= @ReleaseDate,
		[Version] = @Version,
		[StatusID] = @StatusID
	WHERE
		[ApplicationID] = @ApplicationID

END