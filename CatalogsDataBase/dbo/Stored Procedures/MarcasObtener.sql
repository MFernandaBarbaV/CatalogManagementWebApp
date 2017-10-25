-- =============================================
-- EXEC [dbo].[MarcasObtener]
-- =============================================
CREATE PROCEDURE [dbo].[MarcasObtener]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select IdMarca, Descripcion as Marca from dbo.Marca
END



