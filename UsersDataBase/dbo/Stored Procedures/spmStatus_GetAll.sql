-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona todos los registros de la tabla mSatatus.
-- =============================================
CREATE PROCEDURE [dbo].[spmStatus_GetAll]
AS
BEGIN

	SET NOCOUNT ON

	SELECT
		[StatusID],
		[Name],
		[Type]
	FROM [mStatus]

END