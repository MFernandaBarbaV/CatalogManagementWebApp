CREATE PROCEDURE [dbo].[CodigoBarrasAgregar]
	@CodigoBarras nvarchar(50)
           ,@IdProducto int
           ,@IdTipoPrecio smallint
           ,@IdPresentacion smallint
AS
	INSERT INTO [dbo].[CodigoBarras]
           ([CodigoBarras]
           ,[IdProducto]
           ,[IdTipoPrecio]
           ,[IdPresentacion])
     VALUES
           (@CodigoBarras
           ,@IdProducto
           ,@IdTipoPrecio
           ,@IdPresentacion)
RETURN 0
