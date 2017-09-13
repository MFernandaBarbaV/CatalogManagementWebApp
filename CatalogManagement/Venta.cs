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
    
    public partial class Venta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Venta()
        {
            this.VentaDetalle = new HashSet<VentaDetalle>();
        }
    
        public int IdVenta { get; set; }
        public int IdCliente { get; set; }
        public int IdOperador { get; set; }
        public System.DateTime FechaVenta { get; set; }
        public double Descuento { get; set; }
        public bool EsFactura { get; set; }
        public decimal Total { get; set; }
        public bool GuardadoTemporal { get; set; }
    
        public virtual Clientes Clientes { get; set; }
        public virtual Operador Operador { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VentaDetalle> VentaDetalle { get; set; }
    }
}