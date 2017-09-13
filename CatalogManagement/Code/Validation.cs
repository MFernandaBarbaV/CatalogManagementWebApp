using CatalogManagement.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Code
{
    public class Validation
    {
        public static bool IsValidSession(object loggedUser)
        {
            return loggedUser != null;
        }

        public static bool ValidatePermissions(object loggedUser, string OperationId)
        {
            return ValidatePermissions(loggedUser, int.Parse(OperationId));
        }


        public static bool ValidatePermissions(object loggedUser, int OperationId)
        {
            var user = loggedUser as SystemUser;

            if (user == null)
            {
                return false;
            }
            else
            {
                //las operaciones mayores a Mil, son creadas para el sistema
                if ( user.ContainsOperation(OperationId) || OperationId > 1000)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}