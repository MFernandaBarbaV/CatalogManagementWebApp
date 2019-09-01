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
		--,@IdUnidad int = null
		,@IdGenero int
		,@Imagen image = null,
		@IdProducto int,
		@Precio money
AS
BEGIN

	IF EXISTS (SELECT IdProducto FROM [dbo].[Producto] WHERE Codigo = @Codigo and IdProducto != @IdProducto)
	BEGIN
		RAISERROR('El código insertado ya esta usado en otro producto.',16,1)
		RETURN;
	END
	IF @Precio != (SELECT PrecioVenta FROM [dbo].[Producto] WHERE IdProducto = @IdProducto)
	begin
		insert into [dbo].[PrecioHistorial] (IdProducto, Costo) values (@IdProducto, @Precio)
	end

	UPDATE [dbo].[Producto]
	   SET [Descripcion] = @Descripcion
		  ,[Codigo] = @Codigo
		  ,[IdTipoProducto] =  @IdTipoProducto
		  ,[IdSubTipoProducto] =@IdSubTipoProducto
		  ,[IdMarca] = @IdMarca
		  ,[IdProveedor] = @IdProveedor
		  ,[IdTalla] = @IdTalla
		 -- ,[IdUnidad] = @IdUnidad
		 -- ,[Imagen] = @Imagen
		  ,[IdGenero] = @IdGenero
		  ,[PrecioVenta] = @Precio
	 WHERE IdProducto = @IdProducto
END



