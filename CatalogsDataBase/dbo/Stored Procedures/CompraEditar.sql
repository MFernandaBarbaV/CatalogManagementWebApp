CREATE PROCEDURE [dbo].[CompraEditar]
	@IdCompra int , @IdProveedor int, @IdOperador int, @Folio nvarchar(15), @EsFactura bit,
	@Subtotal money, @IVA money, @Descuento money, @Flete money,  @Total money, @IdAlmacen smallint
AS
BEGIN


 UPDATE [dbo].[Compra]
   SET [IdProveedor] = @IdProveedor
      ,[IdUsuario] = @IdOperador    
      ,[Folio] = @Folio
      ,[EsFactura] = @EsFactura
      ,[Subtotal] = @Subtotal
      ,[IVA] =@IVA
      ,[Descuento] = @Descuento
      ,[Flete] = @Flete
      ,[Total] = @Total
	  ,IdAlmacen = @IdAlmacen
 WHERE IdCompra = @IdCompra

   set @IdCompra = cast(SCOPE_IDENTITY() as int)
   SELECT @IdCompra
END