
-- =============================================
-- [dbo].[[VentaEliminar]] 1
-- =============================================
CREATE PROCEDURE [dbo].[VentaEliminar] 
	@IdVenta int ,@IdUsuario int 
AS
BEGIN
	
	if(0 = ( select GuardadoTemporal from dbo.Venta where IdVenta = @IdVenta))
	begin
		UPDATE [dbo].[Venta]
		SET IdEstatus = 2
		WHERE IdVenta = @IdVenta

		update dbo.Pagos
		set IdEstatus = 2
		where IdVenta = @IdVenta

		EXEC LogInsert 22, @idventa, @IdUsuario

		
		DECLARE @IdProducto int, @Cantidad int, @IdAlmacen int
		DECLARE db_cursor CURSOR FOR 
		SELECT IdProducto, Cantidad * p.Piezas as Cantidad, v.IdAlmacen
		FROM [dbo].[VentaDetalle] vd
		LEFT JOIN [dbo].[Presentacion] p on p.IdPresentacion = vd.IdPresentacion
		LEFT JOIN [dbo].Venta v on v.IdVenta = vd.IdVenta
		WHERE vd.IdVenta = @IdVenta

		OPEN db_cursor  
		FETCH NEXT FROM db_cursor INTO @IdProducto, @Cantidad  , @IdAlmacen

		WHILE @@FETCH_STATUS = 0  
		BEGIN  
				exec ExistenciaPorAlmacenModificar @IdProducto, @Cantidad, 0, @IdAlmacen

				FETCH NEXT FROM db_cursor INTO  @IdProducto, @Cantidad   , @IdAlmacen
		END 

		CLOSE db_cursor  
		DEALLOCATE db_cursor 

		

	end
	else
	begin
		delete dbo.VentaDetalle
		where IdVenta = @IdVenta

		delete [dbo].[Venta]	
		WHERE IdVenta = @IdVenta

	
	end

END