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
    
    public partial class Informacion
    {
        public int Id { get; set; }
        public byte[] LogoTicket { get; set; }
        public short AnchoMaxLogo { get; set; }
        public string LeyendaSuperiorTicket { get; set; }
        public string LeyendaInferiorTicket { get; set; }
        public byte TamañoFuenteLeyenda { get; set; }
        public byte TamañoFuenteTicket { get; set; }
        public byte TamañoFuenteEncabezados { get; set; }
        public byte TamañoFuenteTotales { get; set; }
        public short AnchoTicket { get; set; }
    }
}
