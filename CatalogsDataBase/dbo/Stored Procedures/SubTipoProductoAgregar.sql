-- =============================================
-- EXEC [dbo].[SubTipoProductoAgregar] 'TIN', 1
-- =============================================
CREATE PROCEDURE [dbo].[SubTipoProductoAgregar] 
	@Descripcion nvarchar(50), @IdTipoProducto int
AS
BEGIN
	INSERT INTO [dbo].[SubTipoProducto]
           ([Descripcion]
           ,[IdTipoProducto])
     VALUES
           (@Descripcion
           ,@IdTipoProducto)

	SELECT cast(SCOPE_IDENTITY() as int) AS IdSubTipoProducto
END
