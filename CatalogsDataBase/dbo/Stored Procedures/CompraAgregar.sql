
CREATE PROCEDURE [dbo].[CompraAgregar]
	@IdProveedor int, @IdOperador int,@Fecha datetime, @Folio nvarchar(15), @EsFactura bit,
	@Subtotal money, @IVA money, @Descuento money, @Flete money,  @Total money, @IdAlmacen smallint,  @IdCompra int output
AS
BEGIN


INSERT INTO [dbo].[Compra]
           ([IdProveedor]
           ,[IdUsuario]
           ,[FechaCompra]
           ,[Folio]
           ,[EsFactura]
           ,[Subtotal]
           ,[IVA]
		   ,[Descuento]
           ,[Flete]
           ,[Total]
           ,[Pagado],
		   IdAlmacen)
     VALUES
           (@IdProveedor
           ,@IdOperador
           ,@Fecha
           ,@Folio
           ,@EsFactura
           ,@Subtotal
           ,@IVA
		   ,@Descuento
           ,@Flete
           ,@Total
           ,0,
		   @IdAlmacen)

   set @IdCompra = cast(SCOPE_IDENTITY() as int)
   SELECT @IdCompra
END
