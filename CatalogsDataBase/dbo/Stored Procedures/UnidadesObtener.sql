-- =============================================
-- EXEC  [dbo].[UnidadesObtener]
-- =============================================
CREATE PROCEDURE [dbo].[UnidadesObtener]
	
AS
BEGIN

	select IdUnidad, Descripcion as Unidad from dbo.Unidad
	
END



