CREATE PROCEDURE [dbo].[PagoEliminarPorIdVenta]
	@IdVenta int
AS
	
	update   [dbo].[Pagos] set IdEstatus = 2  where idventa = @IdVenta


RETURN 0