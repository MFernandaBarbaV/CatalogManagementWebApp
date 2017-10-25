-- =============================================
-- EXEC  [dbo].[ProveedorObtener] 2
-- =============================================
CREATE PROCEDURE [dbo].[ProveedorObtener]
	@IdProveedor int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select IdProveedor, NombreProveedor, Telefono 
	from Proveedor
	where IdProveedor = @IdProveedor or @IdProveedor = 0
END



