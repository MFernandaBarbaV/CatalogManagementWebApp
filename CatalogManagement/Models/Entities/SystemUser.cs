using CatalogManagement.DBModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.Entities
{
    public class SystemUser
    {
        public int SystemUserId { get { return usuario.IdUsuario; } }
        public string Name { get { return usuario.Nombre; } }
       
      
        public string UserName { get; set; }
        public string Password { get; set; }
        public List<Operations> Operations { get; set; }

        public Usuario usuario { get; set; }

        public SystemUser()
        {
            usuario = new Usuario();
        }

        public bool ContainsOperation(int operationId)
        {
            try
            {
                if (usuario == null || usuario.Operations == null)
                    return false;

                if (usuario.Operations.FirstOrDefault(o => o.OperationID == operationId) == null)
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