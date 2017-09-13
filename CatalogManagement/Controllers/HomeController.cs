using CatalogManagement.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CatalogManagement.Code;

namespace CatalogManagement.Controllers
{
    public class HomeController : Controller
    {


        // GET: Home
        [Route("Home")]
        public ActionResult Index()
        {
            MenuViewModel model = new MenuViewModel();
                 
            string errorMessage = string.Empty;
           
            var loggedUser = Session[SessionVariables.SystemUser] as CatalogManagement.Models.Entities.SystemUser;

            Configure.LoadMainMenu(ref model, loggedUser, ref errorMessage);

            Session[SessionVariables.MenuViewModel] = model;

            if (loggedUser == null)
            {
                return PartialView("_RedirectToLogin");
            }


            return View();
        }


      
    }
}