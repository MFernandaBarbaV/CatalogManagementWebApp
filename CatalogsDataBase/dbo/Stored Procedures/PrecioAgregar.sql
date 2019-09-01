
CREATE PROCEDURE [dbo].[PrecioAgregar]
	@IdProducto int, @IdTipoPrecio smallint, @IdPresentacion int, @Precio money
AS
BEGIN



	DECLARE @COSTO MONEY
	  SET @COSTO = (SELECT TOP(1) PrecioVenta FROM dbo.Producto where IdProducto = @IdProducto)

	 

	-- BORRAR EL PRECIO SI ES DE $0
	IF exists (select top(1) * from [dbo].[Precio] 
	where IdTipoPrecio = @idTipoPrecio and IdProducto = @idProducto  and IdPresentacion = @IdPresentacion and @Precio = 0)
	BEGIN
		INSERT INTO[dbo].[PrecioHistorial]([IdProducto],[Costo],[Precio],[IdTipoPrecio],[IdPresentacion])
			VALUES(@IdProducto,@COSTO,@Precio,@IdTipoPrecio,@IdPresentacion)

		delete from [dbo].[Precio]
		where IdTipoPrecio = @IdTipoPrecio and IdProducto = @idProducto and IdPresentacion = @IdPresentacion
	END
	ELSE  

	-- ACTUALIZAR EL PRECIO SI ES QUE CAMBIÓ
	IF exists (select top(1) * from [dbo].[Precio] 
	where IdTipoPrecio = @idTipoPrecio and IdProducto = @idProducto  and IdPresentacion = @IdPresentacion AND ( Precio != @Precio ))
	BEGIN
	
		

		INSERT INTO[dbo].[PrecioHistorial]([IdProducto],[Costo],[Precio],[IdTipoPrecio],[IdPresentacion])
			VALUES(@IdProducto,@COSTO,@Precio,@IdTipoPrecio,@IdPresentacion)

		Update [dbo].[Precio]
		set Precio = @Precio
		where IdTipoPrecio = @IdTipoPrecio and IdProducto = @idProducto and IdPresentacion = @IdPresentacion

		SELECT 'SE ACTUALIZO EL PRODUCTO'
	END 

	IF exists (select top(1) * from [dbo].[Precio] 
	where IdTipoPrecio = @idTipoPrecio and IdProducto = @idProducto  and IdPresentacion = @IdPresentacion AND Precio = @Precio)
	BEGIN
		
		--no se hace nada
		SELECT @IdProducto AS IdTipoPrecioPorProducto
		return;
	END 
	-- SI NO EXISTE SE INSERTA UNO NUEVO
	IF not exists (select top(1) * from [dbo].[Precio]
	where IdTipoPrecio = @idTipoPrecio and IdProducto = @idProducto  and IdPresentacion = @IdPresentacion AND Precio = @Precio)	
	BEGIN 
		IF @Precio != 0 	
		BEGIN
			INSERT INTO[dbo].[PrecioHistorial]([IdProducto],[Costo],[Precio],[IdTipoPrecio],[IdPresentacion])
				VALUES(@IdProducto,@COSTO,@Precio,@IdTipoPrecio,@IdPresentacion)

		INSERT INTO [dbo].[Precio]
			   ([IdProducto]
			   ,[IdTipoPrecio]
			   ,[IdPresentacion]
			   ,[Precio]
			   )
		 VALUES
			   (@IdProducto
			   ,@IdTipoPrecio
			   ,@IdPresentacion
			   ,@Precio)
		END
	END
	SELECT @IdProducto AS IdTipoPrecioPorProducto
END
