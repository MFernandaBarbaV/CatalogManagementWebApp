-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Seleccina los registro de la tabla mStatus donde la columna Type coincida con el parámetro @Type.
-- =============================================
CREATE PROCEDURE [dbo].[spmStatus_GetByType]
(
	@Type int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT     S.StatusID, S.Name, S.Type, 
				ST.Name AS StatusTypeName
	FROM         mStatus AS S 
	INNER JOIN mStatusTypes AS ST 
	ON S.Type = ST.TypeID
	WHERE     (S.Type = @Type) 

END