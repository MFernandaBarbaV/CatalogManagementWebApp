-- =============================================
-- EXEC [dbo].[VentaDetalleAgregar] 4, 1, 1, 14, 10, 100
-- =============================================
CREATE PROCEDURE [dbo].[VentaDetalleAgregar]
	@IdVenta int, @IdProducto int, @IdUnidad int, @Cantidad int, @PrecioUnitario money , @PrecioTotal money
AS
BEGIN

	DECLARE @CantidadPorUnidad int = (select Cantidad from dbo.Unidad where IdUnidad = @IdUnidad)
	PRINT 'Cantidad por unidad'
	PRINT @CantidadPorUnidad

	DECLARE @IdCompra int, 
			@ExistenciaEnElLote int = 0, 
			@CantidadPendiente int = @Cantidad * @CantidadPorUnidad
		
	PRINT 'Cantidad pendiente 1'
	PRINT @CantidadPendiente

	DECLARE db_cursor CURSOR FOR  
		SELECT IdCompraDetalle 
		FROM [dbo].[CompraDetalle] 
		WHERE IdProducto = @IdProducto AND Existencia > 0 
	OPEN db_cursor   
	FETCH NEXT FROM db_cursor INTO @IdCompra   

	WHILE @@FETCH_STATUS = 0   
	BEGIN   
		   PRINT 'IdCompraDetalle'
		   PRINT @IdCompra

		   SET @ExistenciaEnElLote = (select Existencia from [dbo].[CompraDetalle] where IdCompraDetalle = @IdCompra)
		   
		   PRINT 'EXISTENCIA EN EL LOTE'
		   PRINT @ExistenciaEnElLote

		   PRINT 'Cantidad pendiente'
		   PRINT @CantidadPendiente
		   
		   IF(@CantidadPendiente > 0)
		   BEGIN

			   IF(@ExistenciaEnElLote >= @CantidadPendiente)
			   BEGIN
					PRINT 'SI ALCANZA'

					UPDATE [dbo].[CompraDetalle]
					SET Existencia = (Existencia  )- @CantidadPendiente
					WHERE IdCompraDetalle = @IdCompra

					SET @CantidadPendiente = 0
			   END
			   ELSE
			   BEGIN
					PRINT 'NO ALCANZA'
					SET @CantidadPendiente = @CantidadPendiente - @ExistenciaEnElLote

					UPDATE [dbo].[CompraDetalle]
					SET Existencia = 0
					WHERE IdCompraDetalle = @IdCompra
			   END

		   END

		   FETCH NEXT FROM db_cursor INTO @IdCompra   
	END   

	CLOSE db_cursor   
	DEALLOCATE db_cursor



	INSERT INTO [dbo].[VentaDetalle]
           ([IdVenta]
           ,[IdProducto]
           ,[IdUnidad]
           ,[Cantidad]
           ,[PrecioUnitario]
           ,[PrecioTotal])
     VALUES
           (@IdVenta
           ,@IdProducto
           ,@IdUnidad
           ,@Cantidad
           ,@PrecioUnitario
           ,@PrecioTotal)

		   PRINT 'Cantidad'
		   PRINT @Cantidad
	SELECT @Cantidad = @Cantidad * Cantidad FROM [dbo].[Unidad] where [IdUnidad] = @IdUnidad
	   PRINT @Cantidad
    UPDATE [dbo].[Producto]
	SET Cantidad = Cantidad - @Cantidad
	where IdProducto = @IdProducto

	SELECT SCOPE_IDENTITY() AS IdVentaDetalle

END
