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
    
    public partial class spUser_DoLogin_Result
    {
        public int UserID { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Surname { get; set; }
        public string Address { get; set; }
        public Nullable<int> ZipCode { get; set; }
        public string Email { get; set; }
        public string Position { get; set; }
        public string ShortName { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public int StatusID { get; set; }
        public System.DateTime CreateDate { get; set; }
        public bool IsReadOnly { get; set; }
        public bool IsFirstSession { get; set; }
        public bool IsActiveSession { get; set; }
        public string StatusName { get; set; }
        public Nullable<System.Guid> Ticket { get; set; }
        public System.DateTime LastLogin { get; set; }
    }
}
