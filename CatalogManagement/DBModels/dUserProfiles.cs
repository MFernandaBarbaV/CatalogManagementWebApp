//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CatalogManagement.DBModels
{
    using System;
    using System.Collections.Generic;
    
    public partial class dUserProfiles
    {
        public int UserID { get; set; }
        public int ProfileID { get; set; }
        public int AccessTemplateID { get; set; }
    
        public virtual mAccessTemplates mAccessTemplates { get; set; }
        public virtual mProfiles mProfiles { get; set; }
        public virtual mUsers mUsers { get; set; }
    }
}