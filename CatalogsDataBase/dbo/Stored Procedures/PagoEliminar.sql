
CREATE PROCEDURE [dbo].[PagoEliminar]
	@IdPago int
AS
	
		update   [dbo].[Pagos] set IdEstatus = 2   where IdPago = @IdPago
		
		declare @IdVenta int

		set @IdVenta = isnull((select IdVenta from [dbo].[Pagos] where IdPago = @IdPago),0)

		update dbo.Venta
		set Pagado = (select sum(ImportePago - Cambio) from dbo.Pagos where IdVenta = @IdVenta and IdEstatus = 1 group by IdVenta)
		where IdVenta = @IdVenta
		
		declare @idCliente int 

		set @idCliente =  isnull((select IdCliente from dbo.Venta where IdVenta = @IdVenta),0)

		if @IdCliente > 1 
		begin			
			EXEC ClienteCalcularAdeudo @IdCliente
		end
RETURN 0
