-- =============================================
-- EXEC [dbo].[ProveedorAgregar] 'DON PEDRO', '(33)13288968'
-- =============================================
CREATE PROCEDURE [dbo].[ProveedorEditar]
	-- Add the parameters for the stored procedure here
	@NombreProveedor nvarchar(350), 
	@Telefono nvarchar(50),
	@Email nvarchar(50), 
	@Dirección nvarchar(350), 
	@DiasCredito tinyint,
	@InformacionBancaria nvarchar(350),
	@IdProveedor int
AS
BEGIN

IF EXISTS( SELECT * FROM [dbo].[Proveedor] WHERE [NombreProveedor] = @NombreProveedor and [IdProveedor] != @IdProveedor)
	BEGIN
		RAISERROR('Ya existe un registro similar',16,1)
		RETURN
	END

	UPDATE [dbo].[Proveedor]
	SET NombreProveedor = @NombreProveedor,
		Telefono = @Telefono,
		 Email = @Email,
		 Dirección = @Dirección,
		  DiasCredito = @DiasCredito,
		   InformacionBancaria = @InformacionBancaria
	WHERE IdProveedor = @IdProveedor

END