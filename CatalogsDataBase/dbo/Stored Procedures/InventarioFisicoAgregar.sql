CREATE PROCEDURE [dbo].[InventarioFisicoAgregar]
	@IdAlmacen int,
	@IdProducto int,
	@Observaciones nvarchar(250),
	@IdOperador int,
	@CantidadPzs INT
AS
	INSERT INTO [dbo].[InventarioFisico]
           ([IdOperador]
           ,[IdAlmacen]
           ,[Observaciones]
		    ,[IdProducto]
           ,[CantidadPzs]
		   ,CantidadPzsAnterior)
     VALUES
           (@IdOperador
           ,@IdAlmacen
           ,@Observaciones
		    ,@IdProducto
           ,@CantidadPzs
		    , ISNULL((select Existencia from dbo.ExistenciaPorAlmacen where IdProducto = @IdProducto and IdAlmacen = @IdAlmacen),0))


			exec ExistenciaPorAlmacenModificar @IdProducto, @CantidadPzs, 1, @IdAlmacen, 1

RETURN 0
