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
    
    public partial class Clientes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Clientes()
        {
            this.Venta = new HashSet<Venta>();
        }
    
        public int IdCliente { get; set; }
        public string NombreCliente { get; set; }
        public string ApellidoPaternoCliente { get; set; }
        public string ApellidoMaternoCliente { get; set; }
        public string Email { get; set; }
        public string RFC { get; set; }
        public string CalleDomicilioFiscal { get; set; }
        public string NumeroInteriorDomicilioFiscal { get; set; }
        public string NumeroExteriorDomicilioFiscal { get; set; }
        public string ColoniaDomicilioFiscal { get; set; }
        public string CodigoPostalDomicilioFiscal { get; set; }
        public string CiudadDomicilioFiscal { get; set; }
        public string EstadoDomicilioFiscal { get; set; }
        public string Telefono { get; set; }
        public string NombreCompleto { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Venta> Venta { get; set; }
    }
}
