-- =============================================
-- EXEC [dbo].[ProductoAgregar] 'Calcetín de rallitas', '1001', 1,1,1,1,1,1,NULL
-- ===========================
CREATE PROCEDURE [dbo].[ProductoAgregar]
	-- Add the parameters for the stored procedure here
	@Descripcion nvarchar(max)
           ,@Codigo nvarchar(50)      
           ,@IdTipoProducto int
           ,@IdSubTipoProducto int
           ,@IdMarca int
           ,@IdProveedor int
           ,@IdTalla int   
		    ,@IdGenero int        
           ,@Imagen image = null
		   ,@Precio money = null --Precio por unidad de mayoreo
AS
BEGIN
	
	IF EXISTS (SELECT IdProducto FROM [dbo].[Producto] WHERE Codigo = @Codigo)
	BEGIN
		RAISERROR('El codigo insertado ya esta usado en otro producto.',16,1)
		RETURN;
	END

	INSERT INTO [dbo].[Producto]
           ([Descripcion]
           ,[Codigo]
           ,[Cantidad]         
           ,[IdTipoProducto]
           ,[IdSubTipoProducto]
           ,[IdMarca]
           ,[IdProveedor]
           ,[IdTalla]
           ,[IdUnidad]
           ,[Imagen]
		   ,[PrecioVenta]
		   ,[IdGenero])
     VALUES
           (@Descripcion
           ,@Codigo
           ,0         
           ,@IdTipoProducto
           ,@IdSubTipoProducto
           ,@IdMarca
           ,@IdProveedor
           ,@IdTalla
           ,1
           ,@Imagen
		   ,@Precio
		   ,@IdGenero)

	SELECT cast(SCOPE_IDENTITY() as int) AS IdProducto
END



