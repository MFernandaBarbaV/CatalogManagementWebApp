CREATE PROCEDURE [dbo].[ProductoCostoModificar]
	@IdProducto int,
	@Costo money
AS

	UPDATE [dbo].[Producto]
		SET PrecioVenta = @Costo																																																																												
		where IdProducto = @IdProducto

	insert into [dbo].[PrecioHistorial] (IdProducto, Costo) values (@IdProducto, @Costo)

RETURN 0
																																				