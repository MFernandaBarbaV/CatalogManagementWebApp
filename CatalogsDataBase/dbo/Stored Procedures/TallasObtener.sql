-- =============================================
-- EXEC [dbo].[TallasObtener]
-- =============================================
CREATE PROCEDURE [dbo].[TallasObtener]
	 @IdTalla int = 0
AS
BEGIN
	    
	select IdTalla, Descripcion as Talla 
	from [dbo].[Talla]
	where IdTalla = @IdTalla or @IdTalla = 0
END



