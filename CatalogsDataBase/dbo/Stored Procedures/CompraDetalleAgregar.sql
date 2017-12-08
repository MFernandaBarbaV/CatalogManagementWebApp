-- =============================================
-- EXEC  [dbo].[CompraDetalleAgregar] 4, 1, 2, 2, 5, 15
-- =============================================
CREATE PROCEDURE [dbo].[CompraDetalleAgregar]
	-- Add the parameters for the stored procedure here
	@IdCompra int, @IdProducto int, @IdUnidad int, @Cantidad int, 
	@CostoUnitario money, @CostoTotal money
AS
BEGIN
	DECLARE @IdLote int 
	set @IdLote= 1

	SELECT @IdLote = max([Lote]) + 1 FROM [dbo].[CompraDetalle] WHERE IdProducto = @IdProducto
		
		--si la cantidad actual es negativa, se lo tengo que restar al nuevo lote
	DECLARE @CantidadFaltante int
	set @CantidadFaltante = 0
	if exists (select cantidad from dbo.Producto where IdProducto = @IdProducto and Cantidad < 0)
	begin
		set	@CantidadFaltante = (select Cantidad from dbo.Producto where IdProducto = @IdProducto)
	end

	declare @CantidadPorUnidad int 
	set @CantidadPorUnidad= (select Cantidad from dbo.Unidad where IdUnidad = @IdUnidad)

	INSERT INTO [dbo].[CompraDetalle]
           ([IdCompra]
           ,[IdProducto]
           ,[IdUnidad]
           ,[Cantidad]
           ,[CostoUnitario]
           ,[CostoTotal]
           ,[Existencia]
           ,[Lote]
           ,[GananciaDeLote])
     VALUES
           (@IdCompra
           ,@IdProducto
           ,1
           ,@Cantidad * @CantidadPorUnidad
           ,@CostoUnitario / @CantidadPorUnidad
           ,@CostoTotal
		   ,(Select Case When ( @Cantidad * @CantidadPorUnidad )+ @CantidadFaltante < 0 
                   Then 0 else ( @Cantidad * @CantidadPorUnidad )+ @CantidadFaltante  End)
           ,ISNULL(@IdLote,1)
           ,0)
	
	
	
	UPDATE [dbo].[Producto]
	SET Cantidad = Cantidad + @Cantidad * @CantidadPorUnidad
	where IdProducto = @IdProducto

	SELECT cast(SCOPE_IDENTITY() as int) AS IdCompraDetalle

END
