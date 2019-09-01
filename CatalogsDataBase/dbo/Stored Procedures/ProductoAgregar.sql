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
		declare @DESC nvarchar(20) set @DESC= (SELECT Descripcion FROM [dbo].[Producto] WHERE Codigo = @Codigo)
		RAISERROR('El código insertado ya esta usado en el producto ''%s''.',16,1,@DESC)
		RETURN;
	END
	else IF EXISTS (SELECT IdProducto FROM [dbo].CodigoBarras WHERE CodigoBarras = @Codigo)
	BEGIN
		declare @var6 nvarchar(50) set @var6 = (select top(1) Descripcion from dbo.Producto where IdProducto = (select top(1) IdProducto from dbo.Precio where Codigo=@Codigo))

	raiserror('El código ''%s'' seleccionado ya existe para el producto  %s',  16,1,@Codigo,@var6)
	
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
           ,@Imagen
		   ,@Precio
		   ,@IdGenero)
		   	
			Declare @IdProducto int set @IdProducto = cast(SCOPE_IDENTITY() as int)
			insert into [dbo].[PrecioHistorial] (IdProducto, Costo) values (@IdProducto, @Precio)
	SELECT @IdProducto AS IdProducto

	
END



