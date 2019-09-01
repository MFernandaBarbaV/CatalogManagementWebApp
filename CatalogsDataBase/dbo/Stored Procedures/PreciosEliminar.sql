CREATE PROCEDURE [dbo].[PreciosEliminar]
	@IdProducto int
AS
	delete from [dbo].[Precio]
		where  IdProducto = @IdProducto 
RETURN 0
