

CREATE PROCEDURE [dbo].[CompraDetalleEliminar]
	@IdCompra int
AS

		DECLARE @IdProducto int, @Cantidad int, @IdAlmacen int
		DECLARE db_cursor CURSOR FOR 
		
		SELECT IdProducto, (Cantidad * p.Piezas) as Cantidad, c.IdAlmacen
		FROM [dbo].CompraDetalle vd
		LEFT JOIN [dbo].[Presentacion] p on p.IdPresentacion = vd.IdPresentacion
		LEFT JOIN [dbo].[Compra] c on c.IdCompra = vd.IdCompra
		WHERE vd.IdCompra = @IdCompra

		OPEN db_cursor  
		FETCH NEXT FROM db_cursor INTO @IdProducto, @Cantidad, @IdAlmacen

		WHILE @@FETCH_STATUS = 0  
		BEGIN  
				exec ExistenciaPorAlmacenModificar @IdProducto, @Cantidad, 1, @IdAlmacen,0 -- restar la cantidad

				FETCH NEXT FROM db_cursor INTO  @IdProducto, @Cantidad , @IdAlmacen 
		END 

		CLOSE db_cursor  
		DEALLOCATE db_cursor 

		DELETE FROM CompraDetalle WHERE IdCompra = @IdCompra
RETURN 0