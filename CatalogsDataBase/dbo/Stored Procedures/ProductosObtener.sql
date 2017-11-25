-- =============================================
-- exec [dbo].[ProductosObtener]
-- =============================================
CREATE PROCEDURE [dbo].[ProductosObtener]
	-- Add the parameters for the stored procedure here

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
		prov.Telefono, 
		p.IdProveedor,
		g.IdGenero,
		g.Descripcion as Genero
	from [dbo].[Producto] p
	LEFT join [dbo].Marca m on m.IdMarca = p.IdMarca
	LEFT join [dbo].Talla t on t.IdTalla = p.IdTalla
	LEFT join [dbo].TipoProducto tp on tp.IdTipoProducto = p.IdTipoProducto
	LEFT join [dbo].SubTipoProducto stp on stp.IdSubTipoProducto = p.IdSubTipoProducto
	LEFT join [dbo].Unidad u on u.idUnidad = p.IdUnidad
	LEFT join [dbo].[Proveedor] prov on prov.IdProveedor = p.IdProveedor
	LEFT join [dbo].[Genero] g on g.IdGenero = p.IdGenero
	order by p.Codigo
END



