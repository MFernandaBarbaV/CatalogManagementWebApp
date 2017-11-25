-- =============================================
-- EXEC [dbo].[ProductosObtenerPorCodigo] '1001'
-- =============================================
CREATE PROCEDURE [dbo].[ProductosObtenerPorCodigo]
	-- Add the parameters for the stored procedure here
	@codigo nvarchar(50)
AS
BEGIN
	select p.IdProducto, 
		p.Descripcion as Producto, 
		P.Codigo, 
		p.Cantidad, 
		p.Imagen,
		m.Descripcion as Marca , 
		m.IdMarca,
		T.Descripcion as Talla, 
		p.IdTalla,
		tp.Descripcion as TipoProducto, 
		p.IdTipoProducto,
		stp.Descripcion as SubTipoProducto, 
		p.IdSubTipoProducto,
		u.Descripcion as Unidad, 
		p.IdUnidad,
		prov.NombreProveedor, 
		p.IdProveedor
	from [dbo].[Producto] p
	left join [dbo].Marca m on m.IdMarca = p.IdMarca
	left join [dbo].Talla t on t.IdTalla = p.IdTalla
	left join [dbo].TipoProducto tp on tp.IdTipoProducto = p.IdTipoProducto
	left join [dbo].SubTipoProducto stp on stp.IdSubTipoProducto = p.IdSubTipoProducto
	left join [dbo].Unidad u on u.idUnidad = p.IdUnidad
	left join [dbo].[Proveedor] prov on prov.IdProveedor = p.IdProveedor	
	where p.Codigo = @codigo
	order by p.Codigo
END



