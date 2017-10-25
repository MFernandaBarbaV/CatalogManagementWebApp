-- =============================================
-- Author:		<Author,,Name>
-- ALTER date: <ALTER Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProductoModificar]
	-- Add the parameters for the stored procedure here
		@Descripcion nvarchar(max)
		,@Codigo nvarchar(50)	
		,@IdTipoProducto int
		,@IdSubTipoProducto int
		,@IdMarca int
		,@IdProveedor int
		,@IdTalla int
		,@IdUnidad int
		,@IdGenero int
		,@Imagen image = null,
		@IdProducto int
AS
BEGIN

	IF EXISTS (SELECT IdProducto FROM [dbo].[Producto] WHERE Codigo = @Codigo and IdProducto != @IdProducto)
	BEGIN
		RAISERROR('El codigo insertado ya esta usado en otro producto.',16,1)
		RETURN;
	END

	UPDATE [dbo].[Producto]
	   SET [Descripcion] = @Descripcion
		  ,[Codigo] = @Codigo
		  ,[IdTipoProducto] =  @IdTipoProducto
		  ,[IdSubTipoProducto] =@IdSubTipoProducto
		  ,[IdMarca] = @IdMarca
		  ,[IdProveedor] = @IdProveedor
		  ,[IdTalla] = @IdTalla
		  ,[IdUnidad] = @IdUnidad
		  ,[Imagen] = @Imagen
		  ,[IdGenero] = @IdGenero
	 WHERE IdProducto = @IdProducto
END



