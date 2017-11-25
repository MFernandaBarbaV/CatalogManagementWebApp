-- =============================================
-- EXEC [dbo].[TipoProductoAgregar] 'CALCETINES'
-- =============================================
CREATE PROCEDURE [dbo].[TipoProductoModificar]
	-- Add the parameters for the stored procedure here
	@Descripcion nvarchar(50), @IdTipoProducto int
AS
BEGIN

	IF EXISTS( SELECT * FROM [dbo].[TipoProducto] WHERE [Descripcion] = @Descripcion and IdTipoProducto != @IdTipoProducto)
	BEGIN
		RAISERROR('Ya existe un registro similar',16,1)
		RETURN
	END
	
	UPDATE dbo.TipoProducto
	SET Descripcion = @Descripcion
	WHERE IdTipoProducto = @IdTipoProducto

END
