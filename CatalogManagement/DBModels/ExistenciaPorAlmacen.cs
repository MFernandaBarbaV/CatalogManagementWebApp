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
    
    public partial class ExistenciaPorAlmacen
    {
        public int IdProducto { get; set; }
        public short IdAlmacen { get; set; }
        public int Existencia { get; set; }
    
        public virtual Almacen Almacen { get; set; }
        public virtual Producto Producto { get; set; }
    }
}
