-- =============================================
-- EXEC  [dbo].[TipoPrecioProductoAgregar] 1, 2, 30.0
-- =============================================
CREATE PROCEDURE [dbo].[TipoPrecioProductoAgregar]

	@IdProducto int, @IdTipoPrecio int, @Precio money
AS
BEGIN

if exists (select top(1) * from [dbo].[TipoPrecioPorProducto] where IdTipoPrecio = @idTipoPrecio and IdProducto = @idProducto)
	BEGIN
		Update [dbo].[TipoPrecioPorProducto]
		set Precio = @precio
		where IdTipoPrecio = @idTipoPrecio and IdProducto = @idProducto
	END
	ELSE
	BEGIN
	INSERT INTO [dbo].[TipoPrecioPorProducto]
           ([IdProducto]
           ,[IdTipoPrecio]
           ,[Precio]
           ,[SeUsa]
		   )
     VALUES
           (@IdProducto
           ,@IdTipoPrecio
           ,@Precio
           ,1)
	END

	SELECT @IdProducto AS IdTipoPrecioPorProducto
END
