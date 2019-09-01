
CREATE PROCEDURE [dbo].[ProductoModificarFoto]
	@IdProducto int,
		@Imagen image = null
		
	
AS
BEGIN

	UPDATE [dbo].[Producto]
	   SET [Imagen] = @Imagen		 
	 WHERE IdProducto = @IdProducto
END



