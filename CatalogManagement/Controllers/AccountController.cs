using CatalogManagement.Code;
using CatalogManagement.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CatalogManagement.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel model)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View("Index", model);
                }

                string errorMessage = null;

                var userLogged = model.Login(out errorMessage);

                if(Session == null)
                {
                    ModelState.AddModelError("error_msg", "session is null");
                    return View("Index", model);

                }

                if (userLogged != null)
                {
                    Session[SessionVariables.SystemUser] = userLogged;
                    FormsAuthentication.SetAuthCookie(model.UserName, false);
                    return RedirectToAction("Index", "Home");
                }

                ModelState.AddModelError("error_msg", errorMessage);

                return View("Index", model);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("error_msg", ex.Message + " " + ex.StackTrace);
                return View("Index", model);
            }
        }

        public ActionResult Logout()
        {
            try
            {
                Models.Entities.SystemUser user = Session[SessionVariables.SystemUser] as Models.Entities.SystemUser;

                if (user != null)
                {
                    LoginViewModel.Logout(user.SystemUserId);
                    Session[SessionVariables.SystemUser] = null;
                }


                return View("Index");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("error_msg", ex.Message + " " + ex.StackTrace);
                return View("Index");
            }
        }
    }
}