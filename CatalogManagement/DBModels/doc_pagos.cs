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
    
    public partial class doc_pagos
    {
        public string idinterno { get; set; }
        public int idreg { get; set; }
        public string tipodocto { get; set; }
        public string iddocto { get; set; }
        public string idformapago { get; set; }
        public string descripcion { get; set; }
        public Nullable<decimal> tipo { get; set; }
        public Nullable<decimal> abrircajon { get; set; }
        public string ayuda { get; set; }
        public string foto { get; set; }
        public string descripcion_moneda { get; set; }
        public Nullable<decimal> cotizacion { get; set; }
        public Nullable<decimal> valor { get; set; }
        public string obs { get; set; }
        public Nullable<System.DateTime> fecha { get; set; }
        public string metodo_pago { get; set; }
    }
}