//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CatalogManagement.DBModels
{
    using System;
    
    public partial class ProductosObtenerPorCodigo_Result
    {
        public int IdProducto { get; set; }
        public string Producto { get; set; }
        public string Codigo { get; set; }
        public long Cantidad { get; set; }
        public byte[] Imagen { get; set; }
        public string Marca { get; set; }
        public Nullable<int> IdMarca { get; set; }
        public string Talla { get; set; }
        public int IdTalla { get; set; }
        public string TipoProducto { get; set; }
        public int IdTipoProducto { get; set; }
        public string SubTipoProducto { get; set; }
        public int IdSubTipoProducto { get; set; }
        public string Unidad { get; set; }
        public int IdUnidad { get; set; }
        public string NombreProveedor { get; set; }
        public int IdProveedor { get; set; }
    }
}
