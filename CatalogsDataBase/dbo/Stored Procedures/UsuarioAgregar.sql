
CREATE PROCEDURE [dbo].[UsuarioAgregar]
(
	@IdUsuario int = NULL OUTPUT,
	@Nombre nvarchar(300),
	@Direccion nvarchar(100) = NULL,
	@Email varchar(120) = NULL,
	@Contraseña varchar(300),
	@IdEstatus int = null, @EsVendedor bit
)
AS
BEGIN

	SET NOCOUNT OFF
	
	

	INSERT
	INTO [Usuario]
	(
		[Nombre],[Direccion],[Email],[Contraseña],[IdEstatus], [EsVendedor]
	)
	VALUES
	(
		@Nombre, @Direccion, @Email, @Contraseña, @IdEstatus, @EsVendedor
	)
	
	set @IdUsuario =SCOPE_IDENTITY()
	
END