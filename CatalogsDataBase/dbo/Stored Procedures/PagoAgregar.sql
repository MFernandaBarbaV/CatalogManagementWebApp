CREATE PROCEDURE [dbo].[PagoAgregar]
	@IdVenta int,
	@ImportePago money,
	@Observaciones nvarchar(150) = NULL,
	@IdFormaPago smallint,
	@IdUsuario int, @Cambio money
AS
	INSERT INTO [dbo].[Pagos]
           ([IdVenta]
           ,[ImportePago]
           ,[FechaPago]
           ,[Observaciones]
		   ,[IdFormaDePago]
		   ,[IdUsuario]
		   ,[Cambio])
     VALUES
           (@IdVenta
           ,@ImportePago
           ,GETDATE()
           ,@Observaciones
		   ,@IdFormaPago
		   ,@IdUsuario
		   ,@Cambio)


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
