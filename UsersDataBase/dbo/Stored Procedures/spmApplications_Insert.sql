-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Inserta un registro en la tabla mApplications.
-- =============================================
CREATE PROCEDURE [dbo].[spmApplications_Insert]
(
	@ApplicationID int = NULL OUTPUT,
	@Name varchar(50),
	@Type varchar(25) = NULL,
	@Origin varchar(255) = NULL,
	@StatusID int,
	@Version varchar(30),
	@ReleaseDate datetime
)
AS
BEGIN

	SET NOCOUNT ON

	INSERT
	INTO [mApplications]
	(
		[Name],
		[Type],
		[Origin],
		[IsReadOnly],
		[StatusID],
		[Version],
		[ReleaseDate]
	)
	VALUES
	(
		@Name,
		@Type,
		@Origin,
		0,
		@StatusID,
		@Version,
		@ReleaseDate
	)

	
--	SELECT @ApplicationID = SCOPE_IDENTITY()
	set @ApplicationID = (select @@IDENTITY as ApplicationID)
	
END