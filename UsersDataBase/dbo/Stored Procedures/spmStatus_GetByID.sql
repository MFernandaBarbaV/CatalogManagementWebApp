-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona un registro de la tabla mStatus donde el identificador primario coincida con el parámetro @StatusId.
-- =============================================
CREATE PROCEDURE [dbo].[spmStatus_GetByID]
(
	@StatusID int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT     S.StatusID, S.Name, S.Type, 
				ST.Name AS StatusTypeName
	FROM         mStatus AS S 
	INNER JOIN mStatusTypes AS ST 
	ON S.Type = ST.TypeID
	WHERE     (S.StatusID = @StatusID)

END