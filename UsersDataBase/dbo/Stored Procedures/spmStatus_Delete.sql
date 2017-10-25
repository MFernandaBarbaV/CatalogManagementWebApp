-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Elemina un registro de la tabla mStatus donde el identificador primario coincida con el parámetro @StatusID.
-- =============================================
CREATE PROCEDURE [dbo].[spmStatus_Delete]
(
	@StatusID int
)
AS
BEGIN

	SET NOCOUNT ON

	DELETE
	
	FROM [mStatus]
	WHERE
		[StatusID] = @StatusID

END