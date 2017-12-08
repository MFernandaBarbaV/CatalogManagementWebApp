-- =============================================
-- EXEC [dbo].[TipoPrecioObtenerPorIdProducto] 1
-- =============================================
CREATE PROCEDURE [dbo].[TipoPrecioObtenerPorIdProducto]
	-- Add the parameters for the stored procedure here
	@IdProducto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT distinct
	catalogo.IdTipoPrecio,
	catalogo.Descripcion as TipoPrecio,
	tp.Precio,
--	ISNULL(tp.Precio,( select round( p.Costo * catalogo.Multiplicador,1) from dbo.Producto p where p.IdProducto = @IdProducto)) Precio, 
	ISNULL(tp.SeUsa, 0) Seleccion ,
	catalogo.Multiplicador, catalogo.CantidadPiezas 
	FROM [dbo].TipoPrecio catalogo
	inner JOIN [dbo].[TipoPrecioPorProducto] tp on tp.IdTipoPrecio = catalogo.IdTipoPrecio 
	and TP.IdProducto = @IdProducto
	
END