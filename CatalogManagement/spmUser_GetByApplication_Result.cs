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
    
    public partial class spmUser_GetByApplication_Result
    {
        public int UserID { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Surname { get; set; }
        public string Address { get; set; }
        public Nullable<int> ZipCode { get; set; }
        public string Email { get; set; }
        public string Organization { get; set; }
        public string Position { get; set; }
        public string ShortName { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public int Sex { get; set; }
        public int StatusID { get; set; }
        public System.DateTime CreateDate { get; set; }
        public bool IsReadOnly { get; set; }
        public bool IsFirstSession { get; set; }
        public bool IsActiveSession { get; set; }
        public string StatusName { get; set; }
        public Nullable<int> StatusType { get; set; }
    }
}
