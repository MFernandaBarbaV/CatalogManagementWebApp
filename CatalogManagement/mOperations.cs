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
    
    public partial class mOperations
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public mOperations()
        {
            this.mAccessLog = new HashSet<mAccessLog>();
            this.mProfiles = new HashSet<mProfiles>();
        }
    
        public int OperationID { get; set; }
        public string Name { get; set; }
        public int ApplicationID { get; set; }
        public int SysOperation { get; set; }
        public bool IsReadOnly { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<mAccessLog> mAccessLog { get; set; }
        public virtual mApplications mApplications { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<mProfiles> mProfiles { get; set; }
    }
}
