-- =============================================
-- EXEC [dbo].[VentaDetalleAgregar] 4, 1, 1, 14, 10, 100
-- =============================================
CREATE PROCEDURE [dbo].[VentaDetalleAgregar]
	@IdVenta int, @IdProducto int, @IdPresentacion int, @Cantidad int, @PrecioUnitario money ,
	@PrecioTotal money, @IdTipoPrecio int, @Descuento money, @IdAlmacen smallint
AS
BEGIN

	 PRINT 'IdVenta'
		   PRINT @IdVenta

	declare @cantidadPresentacion int set @cantidadPresentacion= (select top(1) Piezas from dbo.Presentacion where IdPresentacion = @IdPresentacion)
	 declare @costo money set @costo= (select top(1) PrecioVenta * @Cantidad * @cantidadPresentacion from dbo.Producto where IdProducto = @IdProducto)

	
	INSERT INTO [dbo].[VentaDetalle]
           ([IdVenta]
           ,[IdProducto]
           ,[IdPresentacion]
           ,[IdTipoPrecio]
           ,[Cantidad]
           ,[PrecioUnitario]
           ,[PrecioTotal]
           ,[Descuento]
		   ,CostoUnitario)
     VALUES
           (@IdVenta
           ,@IdProducto
           ,@IdPresentacion
		   ,@IdTipoPrecio
           ,@Cantidad
           ,@PrecioUnitario
           ,@PrecioTotal
		   ,@Descuento
		   ,@costo)

		   PRINT 'Cantidad'
		   PRINT @Cantidad

	SELECT @Cantidad = @Cantidad * Piezas FROM [dbo].[Presentacion] where [IdPresentacion] = @IdPresentacion
	   PRINT @Cantidad
	   	  
	exec ExistenciaPorAlmacenModificar @IdProducto, @Cantidad, 1, @IdAlmacen

	exec CantidadVendidaEnCompraModificar @IdProducto, @Cantidad, 1
	    
	exec dbo.VentaInsertarCosto @IdVenta

	SELECT SCOPE_IDENTITY() AS IdVentaDetalle

END
