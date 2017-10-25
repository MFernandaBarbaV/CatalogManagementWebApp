-- =============================================
-- EXEC  [dbo].[UnidadesAgregar] 'Docena'
-- =============================================
CREATE PROCEDURE [dbo].[UnidadesAgregar]
	@Descripcion nvarchar(50)
AS
BEGIN

	INSERT INTO [dbo].[Unidad]
           ([Descripcion])
     VALUES
           (@Descripcion)

	SELECT cast(SCOPE_IDENTITY() as int) AS IdUnidad
	
END



