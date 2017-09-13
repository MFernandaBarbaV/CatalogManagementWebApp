﻿using CatalogManagement.Models.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using WP.Security.Hash;

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
                pwEncripted = HashSecurity.GeneratePasswordHash(Password, CryptographyFormat.SHA1);
                using (CatalogManagementDBModel db = new CatalogManagementDBModel())
                {
                    var result = db.spmUser_DoLogin(UserName, pwEncripted);
             
                    if (result == null)
                    {
                        errorMessage = "Usuario o contraseña incorrecto";
                        return null;
                    }
                    spmUser_DoLogin_Result user = null;
                    foreach (var item in result)
                    {
                        user = item;
                    }


                    var profile = db.spdUserProfiles_GetByUserID(user.UserID).First();
                  
                    var operations = db.mProfiles.First(p => p.ProfileID == profile.ProfileID).mOperations.ToList();

                    var sysUser = new SystemUser()
                    {
                        FirstName = user.Name,
                        LastName = user.LastName,
                        Operations = operations,
                        Password = user.Password,
                        RoleId = profile.ProfileID,
                        RoleName = profile.Name,
                        UserName = user.Login
                    };

                    return sysUser;

                }

            }
            catch (Exception ex)
            {
                errorMessage = "Usuario o contraseña incorrecto";
                return null;
            }


        }

        public static bool Logout(int userId, string userName, string password)
        {
            return true;
        }
    }
}