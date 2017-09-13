//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CatalogManagement
{
    using System;
    using System.Collections.Generic;
    
    public partial class VentaDetalle
    {
        public int IdVentaDetalle { get; set; }
        public int IdVenta { get; set; }
        public int IdProducto { get; set; }
        public int IdUnidad { get; set; }
        public int IdTipoPrecio { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
        public decimal PrecioTotal { get; set; }
    
        public virtual Producto Producto { get; set; }
        public virtual TipoPrecio TipoPrecio { get; set; }
        public virtual Unidad Unidad { get; set; }
        public virtual Venta Venta { get; set; }
    }
}