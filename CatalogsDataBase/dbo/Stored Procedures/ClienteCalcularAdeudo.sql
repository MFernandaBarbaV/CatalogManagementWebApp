CREATE PROCEDURE [dbo].[ClienteCalcularAdeudo]
	@IdCliente int 
AS
	
	if @IdCliente != 1
	BEGIN
		
		UPDATE dbo.Clientes 
		SET Adeudo = (
			isnull(	(SELECT SUM(Total - Pagado)
				FROM dbo.Venta 
				WHERE IdCliente = @IdCliente AND IdEstatus = 1
				GROUP BY IdCliente), 0)
				)
				,Puntos = 	isnull((
				SELECT SUM(Pagado)
				FROM dbo.Venta 
				WHERE IdCliente = @IdCliente AND IdEstatus = 1 and Total >= Pagado
				GROUP BY IdCliente
				),0)
				,UltimaCompra = GETDATE()
		WHERE IdCliente = @IdCliente

		
	
	END

RETURN 0
