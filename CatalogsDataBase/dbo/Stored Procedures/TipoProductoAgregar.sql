-- =============================================
-- EXEC [dbo].[TipoProductoAgregar] 'CALCETINES'
-- =============================================
CREATE PROCEDURE [dbo].[TipoProductoAgregar]
	-- Add the parameters for the stored procedure here
	@Descripcion nvarchar(50)
AS
BEGIN

	IF EXISTS( SELECT * FROM [dbo].[TipoProducto] WHERE [Descripcion] = @Descripcion)
	BEGIN
		RAISERROR('Ya existe un registro similar',16,1)
		RETURN
	END
	
	INSERT INTO [dbo].[TipoProducto]
           ([Descripcion])
     VALUES
           (@Descripcion)

	SELECT cast(SCOPE_IDENTITY() as int) AS IdTipoProducto
END
