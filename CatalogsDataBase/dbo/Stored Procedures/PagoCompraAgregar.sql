CREATE PROCEDURE [dbo].[PagoCompraAgregar]
	@IdCompra int,
	@ImportePago money,
	@Observaciones nvarchar(150) = NULL,
	@IdFormaPago smallint,
	@IdUsuario int
AS


INSERT INTO [dbo].[PagosCompras]
           ([IdCompra]
           ,[ImportePago]
           ,[FechaPago]
           ,[Observaciones]
           ,[IdFormaDePago]
           ,[IdUsuario])
     VALUES
           (@IdCompra
           ,@ImportePago
           ,getdate()
           ,@Observaciones
           ,@IdFormaPago
           ,@IdUsuario)


		   update dbo.Compra
		   set Pagado = (select sum(ImportePago) from dbo.PagosCompras where IdCompra = @IdCompra and IdEstatus = 1 group by IdCompra)
		   where IdCompra = @IdCompra

	
	declare @adeudo money
	set @adeudo = (select sum(Total - Pagado ) from dbo.Compra where IdCompra = @IdCompra group by IdCompra)

	declare @idProveedor int
	set @idProveedor = (select top(1) IdProveedor from dbo.Compra where IdCompra = @IdCompra)

	update dbo.Proveedor
	set Adeudo = @adeudo
	where IdProveedor = @idProveedor

RETURN 0


