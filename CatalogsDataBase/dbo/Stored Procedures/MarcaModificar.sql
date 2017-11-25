-- =============================================
-- EXEC [dbo].[MarcaAgregar] 'GASER'
-- =============================================
CREATE PROCEDURE [dbo].[MarcaModificar]
	-- Add the parameters for the stored procedure here
	@Descripcion nvarchar(30), @IdMarca int
AS
BEGIN

	IF EXISTS( SELECT * FROM [dbo].[Marca] WHERE [Descripcion] = @Descripcion and [IdMarca] != @IdMarca)
	BEGIN
		RAISERROR('Ya existe una marca similar',16,1)
		RETURN
	END
	
	UPDATE [dbo].[Marca]
	SET Descripcion = @Descripcion
	WHERE IdMarca = @IdMarca

END
