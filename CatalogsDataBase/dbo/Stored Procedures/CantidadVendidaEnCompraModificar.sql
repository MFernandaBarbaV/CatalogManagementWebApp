CREATE PROCEDURE [dbo].[CantidadVendidaEnCompraModificar]
	@idProducto int ,
	@cantidadAVender int, @sumar bit
AS
	
	DECLARE @IdCompraDetalle as INT;
	DECLARE @CantidadDeCompra as INT;
	DECLARE @CantidadVendidaBD as INT;
	DECLARE @RestanteDeCompra as INT;
	DECLARE @Message as nvarchar(max)
	DECLARE @ShoppingCursor as CURSOR;  

	set @Message = ''
 
	SET @ShoppingCursor = CURSOR FOR

		SELECT IdCompraDetalle , Cantidad * p.Piezas as Cantidad, CantidadVendida
		FROM dbo.CompraDetalle cd
		LEFT JOIN dbo.Presentacion p on p.IdPresentacion = cd.IdPresentacion
		WHERE IdProducto = @idProducto and Cantidad * p.Piezas > CantidadVendida 
		ORDER BY IdCompra asc
 
	OPEN @ShoppingCursor;

	FETCH NEXT FROM @ShoppingCursor INTO @IdCompraDetalle, @CantidadDeCompra, @CantidadVendidaBD;
 
	WHILE @@FETCH_STATUS = 0
	BEGIN
		set @Message = @Message + 'Cantidad a vender: ' + cast( @cantidadAVender as nvarchar(max)) 
								+ ' en IdCompraDetalle: '+ cast( @IdCompraDetalle as nvarchar(max))
		IF @cantidadAVender = 0
			BREAK
		-- 1
		set @RestanteDeCompra = @CantidadDeCompra - @CantidadVendidaBD

		set @Message = @Message + '@CantidadDeCompra: ' + cast( @CantidadDeCompra as nvarchar(max)) 
								+ ' @CantidadVendidaBD: '+ cast( @CantidadVendidaBD as nvarchar(max))
								+ ' @RestanteDeCompra: '+ cast( @RestanteDeCompra as nvarchar(max))

		if @RestanteDeCompra > 0 
		BEGIN
				
			-- 10					11
			IF @RestanteDeCompra >= @cantidadAVender -- ALCANZA EN ESE LOTE
			BEGIN

			set @Message = @Message + 'si alcanza en el lote'
					UPDATE dbo.CompraDetalle
					set CantidadVendida = CantidadVendida + @cantidadAVender, FechaUltimoVendido = GETDATE()
					where IdCompraDetalle = @IdCompraDetalle

					BREAK -- SALIMOS DEL CURSOR (cREO)
			END
			ELSE
			BEGIN -- NO ALCANZA CON EL LOTE, ENTONCES RESTAMOS LOS QUE SE PUEDAN Y DEJAMOS PENDIENTE PARA EL SIGUIENTE LOTE
				set @Message = @Message + 'no alcanza en el lote \n'				
				SET @cantidadAVender = @cantidadAVender - @RestanteDeCompra

				UPDATE dbo.CompraDetalle
				set CantidadVendida = Cantidad, FechaUltimoVendido = GETDATE()
				where IdCompraDetalle = @IdCompraDetalle

			END
		END	 

	 FETCH NEXT FROM @ShoppingCursor INTO @IdCompraDetalle, @CantidadDeCompra, @CantidadVendidaBD;
	END
 
	CLOSE @ShoppingCursor;
	DEALLOCATE @ShoppingCursor;

	INSERT INTO [dbo].[LogMessage] VALUES (@Message)
RETURN 0
