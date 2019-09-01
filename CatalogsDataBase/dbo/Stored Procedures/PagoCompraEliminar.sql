CREATE PROCEDURE [dbo].[PagoCompraEliminar]
	@IdPago int, @IdCompra int,
	@IdUsuario int
AS
	update  dbo.PagosCompras set IdEstatus = 2 where IdPagoCompra = @IdPago

	update dbo.Compra
	set Pagado = isnull((select sum(ImportePago) from dbo.PagosCompras where IdCompra = @IdCompra and IdEstatus = 1 group by IdCompra),0)
	where IdCompra = @IdCompra
	
	declare @adeudo money
	set @adeudo = (select sum(total - Pagado ) from dbo.Compra where IdCompra = @IdCompra group by IdCompra)

	declare @idProveedor int
	set @idProveedor = (select top(1) IdProveedor from dbo.Compra where IdCompra = @IdCompra)

	update dbo.Proveedor
	set Adeudo = @adeudo
	where IdProveedor = @idProveedor

RETURN 0