CREATE PROCEDURE [dbo].[OperacionesPorUsuarioInsertar]
	@Operation int ,
	@User int
AS

IF NOT EXISTS (SELECT * FROM dbo.OperacionesPorUsuario WHERE IdUsuario = @User AND IdOperacion = @Operation)
BEGIN
	INSERT INTO dbo.OperacionesPorUsuario(IdUsuario, IdOperacion) VALUES (@User, @Operation)
END

RETURN 0
