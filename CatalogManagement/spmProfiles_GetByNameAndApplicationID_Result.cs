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
    
    public partial class spmProfiles_GetByNameAndApplicationID_Result
    {
        public int ProfileID { get; set; }
        public string Name { get; set; }
        public bool IsReadOnly { get; set; }
        public int ApplicationID { get; set; }
        public string AppName { get; set; }
        public string AppType { get; set; }
        public string AppOrigin { get; set; }
        public string AppVersion { get; set; }
        public Nullable<System.DateTime> AppReleaseDate { get; set; }
        public bool AppIsReadOnly { get; set; }
        public int AppStatusID { get; set; }
        public string StatusName { get; set; }
        public Nullable<int> StatusType { get; set; }
    }
}
