-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Actualiza un registro de la tabla mStatus donde el identificador primario coincida con el parámetro @StatusID.
-- =============================================
CREATE PROCEDURE [dbo].[spmStatus_Update]
(
	@StatusID int,
	@Name varchar(50),
	@Type int = NULL
)
AS
BEGIN

	SET NOCOUNT ON

	UPDATE [mStatus]
	SET
		[Name] = @Name,
		[Type] = @Type
	WHERE
		[StatusID] = @StatusID

	SELECT
		[StatusID],
		[Name],
		[Type]
	FROM [mStatus]
	WHERE
		([StatusID] = @StatusID)
END