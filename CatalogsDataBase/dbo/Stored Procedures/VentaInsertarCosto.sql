CREATE PROCEDURE [dbo].[VentaInsertarCosto]
	@idVenta int
AS

	declare @costo money 
	


	set @costo = ( select top(1) sum ( CostoUnitario ) from dbo.VentaDetalle where IdVenta = @idVenta group by IdVenta)

	update dbo.Venta
	set Costo = @costo
	where IdVenta = @idVenta

RETURN 0
