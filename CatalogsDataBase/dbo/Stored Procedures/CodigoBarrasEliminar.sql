CREATE PROCEDURE [dbo].[CodigoBarrasEliminar]
	@IdProducto int
AS
	DELETE FROM dbo.CodigoBarras
	WHERE IdProducto  = @IdProducto

RETURN 0
