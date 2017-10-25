-- =============================================
-- EXEC [dbo].[MarcaAgregar] 'GASER'
-- =============================================
CREATE PROCEDURE [dbo].[MarcaAgregar]
	-- Add the parameters for the stored procedure here
	@Descripcion nvarchar(30)
AS
BEGIN

	IF EXISTS( SELECT * FROM [dbo].[Marca] WHERE [Descripcion] = @Descripcion)
	BEGIN
		RAISERROR('Ya existe una marca similar',16,1)
		RETURN
	END
	
	INSERT INTO [dbo].[Marca]
           ([Descripcion])
     VALUES
           (@Descripcion)

    SELECT cast(SCOPE_IDENTITY() as int) AS IdMarca

END
