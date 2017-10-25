-- =============================================
-- EXEC [dbo].[TallasAgregar]  'M'
-- =============================================
CREATE PROCEDURE [dbo].[TallasAgregar] 
	-- Add the parameters for the stored procedure here
	@Descripcion nvarchar(30)
AS
BEGIN
    
	IF EXISTS( SELECT * FROM [dbo].[Talla] WHERE [Descripcion] = @Descripcion)
	BEGIN
		RAISERROR('Ya existe un registro similar',16,1)
		RETURN
	END

	INSERT INTO [dbo].[Talla]
           ([Descripcion])
     VALUES
           (@Descripcion)

	SELECT cast(SCOPE_IDENTITY() as int) AS IdTalla
END
