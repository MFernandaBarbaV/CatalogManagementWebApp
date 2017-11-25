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
                string pwEncripted = string.Empty;
                //UserName = "Administrador";
                //Password = "321321321";
                pwEncripted = Security.Encrypt(Password);
                using (CatalogManagementDBEntities db = new CatalogManagementDBEntities())
                {
                    var result = db.spUser_DoLogin(UserName, pwEncripted);

                    if (result == null)
                    {
                        errorMessage = "Usuario o contraseña incorrecto";
                        return null;
                    }
                    spUser_DoLogin_Result user = null;
                    foreach (var item in result)
                    {
                        user = item;
                    }

                    if (user == null)
                    {
                        errorMessage = "Usuario o contraseña incorrecto";
                        return null;
                    }

                    List<Operations> listOp = db.Users.Where(u => u.UserID == user.UserID).FirstOrDefault().Operations.ToList();
                

                    var sysUser = new SystemUser()
                    {
                        SystemUserId = user.UserID,
                        FirstName = user.Name,
                        LastName = user.LastName,
                        Operations = listOp,
                        Password = user.Password,
                        RoleName = user.Position,
                        UserName = user.Login
                    };

                    return sysUser;

                }

            }
            catch (System.Data.Entity.Core.EntityException ex)
            {
                errorMessage = "Error en la conexión [" + ex.Message + (ex.InnerException != null ? ex.InnerException.Message : string.Empty)+ "]";
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