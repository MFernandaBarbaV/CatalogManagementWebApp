﻿-- =============================================
-- EXEC [dbo].[SubTipoProductoObtener]
-- =============================================
CREATE PROCEDURE [dbo].[SubTipoProductoObtener]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select IdSubTipoProducto, Descripcion as SubTipoProducto, IdTipoProducto from dbo.SubTipoProducto
END



