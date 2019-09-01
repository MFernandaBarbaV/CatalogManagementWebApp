
CREATE PROCEDURE [dbo].[CompraDetalleAgregar]

	@IdCompra int, @IdProducto int, @IdPresentacion int,  @Cantidad int, 
	@CostoUnitario money, @CostoTotal money, @ModificarCosto bit, @FletePPieza money, @IdAlmacen int
AS
BEGIN

	declare @CantidadPorUnidad INT 
	SET @CantidadPorUnidad= (SELECT TOP 1 [Piezas]  FROM [dbo].[Presentacion] WHERE IdPresentacion = @IdPresentacion)

	declare @Exist INT

	SET @Exist = (SELECT TOP(1) Cantidad FROM dbo.Producto WHERE IdProducto = @IdProducto)



	INSERT INTO [dbo].[CompraDetalle]
           ([IdCompra]
           ,[IdProducto]
           ,[IdPresentacion]
           ,[Cantidad]
           ,[CostoUnitario]
           ,[CostoTotal]
           ,[Existencia]
           ,[CantidadVendida])
     VALUES
           (@IdCompra
           ,@IdProducto
           ,@IdPresentacion
           ,@Cantidad
           ,@CostoUnitario
           ,@CostoTotal
           ,isnull(@Exist,0)
           ,0)
		
		
		set @Cantidad = @Cantidad * @CantidadPorUnidad
		exec ExistenciaPorAlmacenModificar @IdProducto, @Cantidad, 0, @IdAlmacen, 0

		if @ModificarCosto = 1
		begin
			set @CostoUnitario = (@CostoUnitario/@CantidadPorUnidad )+ @FletePPieza
			exec ProductoCostoModificar @IdProducto, @CostoUnitario
		end

	SELECT cast(SCOPE_IDENTITY() as int) AS IdCompraDetalle

END
