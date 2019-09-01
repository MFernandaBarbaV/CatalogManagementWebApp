CREATE PROCEDURE [dbo].[InventarioHistorialAgregar]
	@IdAlmacenOrigen smallint = null
           ,@IdAlmacenDestino smallint = null
           ,@IdProducto int
           ,@Cantidad int
		   ,@Observaciones nvarchar(500)
		   ,@IdOperador int
AS

	exec MoverExistenciaAlmacen @IdAlmacenOrigen, @IdAlmacenDestino, @IdProducto, @Cantidad



	INSERT INTO [dbo].[InventarioHistorial]
           ([IdAlmacenOrigen]
           ,[IdAlmacenDestino]
           ,[IdProducto]
           ,[Cantidad]
		   ,[Observaciones]
		   ,[IdOperador])
     VALUES
           (@IdAlmacenOrigen
           ,@IdAlmacenDestino
           ,@IdProducto
           ,@Cantidad
		   ,@Observaciones
		   ,@IdOperador)
RETURN 0
