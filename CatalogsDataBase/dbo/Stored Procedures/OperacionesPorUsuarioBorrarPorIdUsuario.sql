CREATE PROCEDURE [dbo].[OperacionesPorUsuarioBorrarPorIdUsuario]
	@UserId int
AS
	DELETE FROM dbo.OperacionesPorUsuario WHERE IdUsuario = @UserId
RETURN 0
