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
    using System.Collections.Generic;
    
    public partial class DevolucionDetalle
    {
        public long IdDevolucionDetalle { get; set; }
        public long IdDevolucion { get; set; }
        public int IdProducto { get; set; }
        public int Cantidad { get; set; }
        public short IdPresentacion { get; set; }
        public decimal ImporteDevolucion { get; set; }
        public int IdVentaDetalle { get; set; }
    
        public virtual Devolucion Devolucion { get; set; }
        public virtual Presentacion Presentacion { get; set; }
        public virtual Producto Producto { get; set; }
    }
}
