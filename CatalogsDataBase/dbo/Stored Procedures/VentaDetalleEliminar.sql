CREATE PROCEDURE [dbo].[VentaDetalleEliminar]
	@IdVenta int
AS

		DECLARE @IdProducto int, @Cantidad int, @IdAlmacen smallint
		
		DECLARE db_cursor CURSOR FOR 
				SELECT IdProducto, Cantidad * p.Piezas as Cantidad, v.IdAlmacen
				FROM [dbo].[VentaDetalle] vd
				LEFT JOIN [dbo].[Presentacion] p on p.IdPresentacion = vd.IdPresentacion
				LEFT JOIN [dbo].[Venta] v on v.IdVenta = vd.IdVenta
				WHERE vd.IdVenta = @IdVenta

		OPEN db_cursor  
		FETCH NEXT FROM db_cursor INTO @IdProducto, @Cantidad  , @IdAlmacen

		WHILE @@FETCH_STATUS = 0  
		BEGIN  
				exec ExistenciaPorAlmacenModificar @IdProducto, @Cantidad, 0, @IdAlmacen

				FETCH NEXT FROM db_cursor INTO  @IdProducto, @Cantidad, @IdAlmacen   
		END 

		CLOSE db_cursor  
		DEALLOCATE db_cursor 

		DELETE FROM VentaDetalle WHERE IdVenta = @IdVenta
RETURN 0
