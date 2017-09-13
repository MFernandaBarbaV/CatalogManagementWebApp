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
            if (!ModelState.IsValid)
            {
                return View("Index", model);
            }

            string errorMessage = null;

            var userLogged = model.Login(out errorMessage);

            if (userLogged != null)
            {
                Session[SessionVariables.SystemUser] = userLogged;
                FormsAuthentication.SetAuthCookie(model.UserName, false);
                return RedirectToAction("Index", "Home");
            }

            ModelState.AddModelError("error_msg", errorMessage);

            return View("Index", model);
        }

        public ActionResult Logout()
        {
            return View("Index");
        }
    }
}