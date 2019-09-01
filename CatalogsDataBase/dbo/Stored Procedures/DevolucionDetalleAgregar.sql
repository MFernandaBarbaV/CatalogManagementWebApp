CREATE PROCEDURE [dbo].[DevolucionDetalleAgregar]
	@IdDevolucion int ,
	@IdProducto int, @Cantidad int, @IdPresentacion int, @ImporteDevolucion money, @IdAlmacen int, @IdVentaDetalle int
AS

	-- revisar que no se haya devuelto antes este artículo
	declare @CantidadDevuelta int, @CantidadVendida int, @Texto nvarchar(300), @PuedeDevolver int

	
	set @CantidadDevuelta =ISNULL( (
		select sum(Cantidad) from DevolucionDetalle where IdVentaDetalle = @IdVentaDetalle group by IdVentaDetalle),0)	

	set @CantidadVendida =ISNULL( (
		select sum(Cantidad) from VentaDetalle where IdVentaDetalle = @IdVentaDetalle group by IdVentaDetalle),0)

	--print cast(@CantidadDevuelta as nvarchar(max)) + 'd ' + cast(@CantidadVendida as nvarchar(max)) + 'v'

	IF @CantidadDevuelta = 0
		BEGIN
		--PRINT 'SE PUEDE DEVOLVER TODO'
		SET @PuedeDevolver = @CantidadVendida
		END
	ELSE IF  @CantidadDevuelta < @CantidadVendida
		BEGIN
		--PRINT 'SE PUEDE DEVOLVER SOLO UNA PARTE'
		SET @PuedeDevolver = @CantidadVendida - @CantidadDevuelta
		print @puedeDevolver
			IF @PuedeDevolver < @Cantidad
				BEGIN
				set @Texto = 'El concepto ' + CAST(@CantidadVendida AS NVARCHAR(20)) + ' ' +			
					(select Descripcion from dbo.Presentacion where IdPresentacion = @IdPresentacion) + ' '+				
				(select rtrim(Descripcion) from dbo.Producto where IdProducto = @IdProducto) + 
				' ya contiene una devolución. Solo es posible devolver '+
				cast(@PuedeDevolver as nvarchar(29))+ ' ' + (select Descripcion from dbo.Presentacion where IdPresentacion = @IdPresentacion) +'(s).'
				raiserror(@Texto,16,1)
				return
				END
		END
	ELSE IF @CantidadDevuelta = @CantidadVendida
		BEGIN
			BEGIN
				set @Texto = 'El concepto ' + CAST(@CantidadVendida AS NVARCHAR(20)) + ' ' +			
					(select Descripcion from dbo.Presentacion where IdPresentacion = @IdPresentacion) + ' '+				
				(select rtrim(Descripcion) from dbo.Producto where IdProducto = @IdProducto) + ' ya ha sido devuelto.' 
				raiserror(@Texto,16,1)
				return
				END
		END

	INSERT INTO [dbo].[DevolucionDetalle]
           ([IdDevolucion]
           ,[IdProducto]
           ,[Cantidad]
           ,[IdPresentacion]
           ,[ImporteDevolucion], [IdVentaDetalle])
     VALUES
           (@IdDevolucion
           ,@IdProducto
           ,@Cantidad
           ,@IdPresentacion
           ,@ImporteDevolucion
		   ,@IdVentaDetalle)

		   update dbo.Devolucion
		   set ImporteDevolucion = (
				select sum(ImporteDevolucion) from dbo.DevolucionDetalle where IdDevolucion = @IdDevolucion GROUP BY IdDevolucion)
		   where iddevolucion = @iddevolucion


		   SELECT @Cantidad =( @Cantidad * Piezas) FROM [dbo].[Presentacion] where [IdPresentacion] = @IdPresentacion
	   PRINT @Cantidad

	exec ExistenciaPorAlmacenModificar @IdProducto, @Cantidad, 1, @IdAlmacen

RETURN 0
  