-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Inserta un registro en la tabla mStatus.
-- =============================================
CREATE PROCEDURE [dbo].[spmStatus_Insert]
(
	@StatusID int = NULL OUTPUT,
	@Name varchar(50),
	@Type int = NULL
)
AS
BEGIN

	SET NOCOUNT ON

	INSERT
	INTO [mStatus]
	(
		[Name],
		[Type]
	)
	VALUES
	(
		@Name,
		@Type
	)

	
	SELECT @StatusID = SCOPE_IDENTITY()

	--Seleccionamos todas las filas para que se actualize el dataset
	SELECT
		[StatusID],
		[Name],
		[Type]
	FROM [mStatus]
	WHERE
		([StatusID] = @StatusID)

	

END