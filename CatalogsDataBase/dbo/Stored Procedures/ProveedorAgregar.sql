-- =============================================
-- EXEC [dbo].[ProveedorAgregar] 'DON PEDRO', '(33)13288968'
-- =============================================
CREATE PROCEDURE [dbo].[ProveedorAgregar]
	-- Add the parameters for the stored procedure here
	@NombreProveedor nvarchar(350), 
	@Telefono nvarchar(50),
	@Email nvarchar(50), 
	@Dirección nvarchar(350), 
	@DiasCredito tinyint,
	@InformacionBancaria nvarchar(350)
AS
BEGIN

IF EXISTS( SELECT * FROM [dbo].[Proveedor] WHERE [NombreProveedor] = @NombreProveedor)
	BEGIN
		RAISERROR('Ya existe un registro similar',16,1)
		RETURN
	END

	INSERT INTO [dbo].[Proveedor]
           ([NombreProveedor]
           ,[Telefono], [Email], [Dirección], [DiasCredito], [InformacionBancaria] )
     VALUES
           (@NombreProveedor
           ,@Telefono, @Email, @Dirección, @DiasCredito, @InformacionBancaria)

	SELECT cast(SCOPE_IDENTITY() as int) AS IdProveedor
END
