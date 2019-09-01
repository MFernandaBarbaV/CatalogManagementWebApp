
CREATE PROCEDURE [dbo].[UsuarioEditar]
(
	@IdUsuario int,
	@Nombre nvarchar(300),
	@Direccion nvarchar(100) = NULL,
	@Email varchar(120) = NULL,
	@Contraseña varchar(300),
	@IdEstatus int = null, @EsVendedor bit
)
AS
BEGIN
	
	SET NOCOUNT OFF
	
    
	UPDATE [Usuario]
	SET
		[Nombre] = @Nombre,
		[Direccion] = @Direccion,
		[Email] = @Email,
		[Contraseña] = @Contraseña,
		[IdEstatus] = @IdEstatus,
		[EsVendedor] = @EsVendedor
	WHERE
		[IdUsuario] = @IdUsuario
		
	

END