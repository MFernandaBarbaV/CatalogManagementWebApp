using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.Entities
{
    public class SystemUser
    {
        public int SystemUserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int RoleId { get; set; }
        public string RoleName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public List<mOperations> Operations { get; set; }

        public bool ContainsOperation(int operationId)
        {
            try
            {
                if (Operations.FirstOrDefault(o => o.SysOperation == operationId) == null)
                    return false;
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}