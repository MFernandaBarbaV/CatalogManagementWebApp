using CatalogManagement.Code;
using CatalogManagement.DBModels;
using CatalogManagement.Models.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace CatalogManagement.Models.ViewModels
{
    public class LoginViewModel
    {
        [Display(Name = "Usuario:")]
        [Required(ErrorMessage = "Debe ingresar un nombre de usuario")]
        [DataType(DataType.Text)]
        public string UserName { get; set; }

        [Display(Name = "Contraseña:")]
        [Required(ErrorMessage = "Debe ingresar una contraseña")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public SystemUser Login(out string errorMessage)
        {
            errorMessage = null;

            try
            {

                using (CatalogManagementDBEntities db = new CatalogManagementDBEntities())
                {
                    var user = db.Usuario.Include("Operations").Where(u => u.Login == UserName && u.Contraseña == Password).FirstOrDefault();

                    //   List<Operations> listOp = db.Usuario.Where(u => u.IdUsuario == 1).FirstOrDefault().Operations.ToList();

                    if (user == null)
                        return null;

                    var sysUser = new SystemUser()
                    {
                        usuario = user
                    };

                    return sysUser;

                }

            }
            catch (System.Data.Entity.Core.EntityException ex)
            {
                errorMessage = "Error en la conexión [" + ex.Message + (ex.InnerException != null ? ex.InnerException.Message : string.Empty) + "]";
                return null;
            }
            catch (NullReferenceException e)
            {
                errorMessage = e.Message + e.StackTrace;// "Usuario o contraseña incorrecto";
                return null;
            }
            catch (Exception e)
            {
                errorMessage = e.Message;// "Usuario o contraseña incorrecto";
                return null;
            }


        }

        public static bool Logout(int userId)
        {
            try
            {
                using (CatalogManagementDBEntities db = new CatalogManagementDBEntities())
                {
                    db.spUser_DoLogout(userId);
                }
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}