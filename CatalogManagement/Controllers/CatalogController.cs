using CatalogManagement.Code;
using CatalogManagement.Models.Entities;
using CatalogManagement.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CatalogManagement.Controllers
{
    [RoutePrefix("")]
    public class CatalogController : Controller
    {
        // GET: Catalog
        public ActionResult Index()
        {
            #region Validar cesión de usuario

            var loggedUser = Session[SessionVariables.SystemUser] as CatalogManagement.Models.Entities.SystemUser;

            if (loggedUser == null)
            {
                return PartialView("_RedirectToLogin");
            }

            #endregion

            ViewBag.ErrorMessage = ViewBag.ErrorMessage.ToString();
            return View();
        }

        [Route("View/{OperationId}")]
        public ActionResult ViewCatalog(string OperationId)
        {
            try
            {
                #region Validar sesión de usuario

                if (Validation.IsValidSession(Session[SessionVariables.SystemUser]))
                {
                    if (!Validation.ValidatePermissions(Session[SessionVariables.SystemUser], OperationId))
                    {
                        ViewBag.ErrorMessage = "El usuario no tiene permisos para realizar esta operación";
                        return PartialView("_ListItemsView", null);
                    }
                }
                else
                {
                    return PartialView("_RedirectToLogin");
                }

                #endregion

                ListItemsViewModel model = new ListItemsViewModel();

                model.Rows = new List<Row>();

                int operation = 0;

                if (!int.TryParse(OperationId, out operation))
                {
                    return View("Index");
                }

                string errorMessage = string.Empty;

                Configure.LoadViewCatalog(ref model, operation, ref errorMessage);

                ViewBag.ErrorMessage = errorMessage +  (Session[SessionVariables.ErrorMessage] == null ? "" : " " + Session[SessionVariables.ErrorMessage].ToString());

                ViewBag.SuccessMessage = (Session[SessionVariables.SuccessMessage] == null ? "" : Session[SessionVariables.SuccessMessage].ToString());

                Session[SessionVariables.SuccessMessage] = null;
                Session[SessionVariables.ErrorMessage] = null;
                return PartialView("_ListItemsView", model);
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = e.Message;
                return PartialView("_ListItemsView", null);
            }
        }

        [Route("View/{OperationId}/{ItemId}")]
        public ActionResult CloseUserSesion(string OperationId, string ItemId)
        {
            #region Validar sesión de usuario

            if (Validation.IsValidSession(Session[SessionVariables.SystemUser]))
            {
                if (!Validation.ValidatePermissions(Session[SessionVariables.SystemUser], OperationId))
                {
                    ViewBag.ErrorMessage = "El usuario no tiene permisos para realizar esta operación";
                    return PartialView("_ListItemsView", null);
                }
            }
            else
            {
                return PartialView("_RedirectToLogin");
            }

            #endregion

            int opId = 0, itmId = 0;
            if (!int.TryParse(OperationId, out opId) || !int.TryParse(ItemId, out itmId))
            {
                ViewBag.ErrorMessage = "No fue posible cerrar la cesión del usuario.";
                return ViewCatalog(((int)Operations.VerUsuarios).ToString());
            }

            using (CatalogManagementDBModel db = new CatalogManagementDBModel())
            {
                try
                {

                    mUsers user = db.mUsers.First(usr => usr.UserID == itmId);
                    user.IsActiveSession = false;
                    db.mUsers.Attach(user);
                    db.Entry(user).Property(x => x.IsActiveSession).IsModified = true;
                    db.SaveChanges();

                }
                catch (Exception e)
                {
                    ViewBag.ErrorMessage = db.GetValidationErrors().First().ValidationErrors + " " + e.Message;
                }
            }
            return ViewCatalog(((int)Operations.VerUsuarios).ToString());
        }

        [Route("Edit/{OperationId}/{ItemId}")]
        public ActionResult LoadItemData(string OperationId, string ItemId)
        {
            #region Validar sesión de usuario

            if (Validation.IsValidSession(Session[SessionVariables.SystemUser]))
            {
                if (!Validation.ValidatePermissions(Session[SessionVariables.SystemUser], OperationId))
                {
                    ViewBag.ErrorMessage = "El usuario no tiene permisos para realizar esta operación";
                    return PartialView("_ListItemsView", null);
                }
            }
            else
            {
                return PartialView("_RedirectToLogin");
            }

            #endregion

            int opId = 0, itmId = 0;

            if (!int.TryParse(OperationId, out opId) || !int.TryParse(ItemId, out itmId))
            {
                ViewBag.ErrorMessage = "Hubo un error al cargar la página.";
                return RedirectToAction("Index");

            }

            ItemViewModel model = new ItemViewModel();

            string errorMessage = string.Empty;

            Configure.LoadItemData(ref model, opId, itmId, ref errorMessage);

            ViewBag.ErrorMessage = errorMessage;


            return PartialView("_ItemView", model);

        }

        [Route("CreateNew/{OperationId}")]
        public ActionResult NewItem(string OperationId)
        {
            #region Validar sesión de usuario

            if (Validation.IsValidSession(Session[SessionVariables.SystemUser]))
            {
                if (!Validation.ValidatePermissions(Session[SessionVariables.SystemUser], OperationId))
                {
                    ViewBag.ErrorMessage = "El usuario no tiene permisos para realizar esta operación";
                    return PartialView("_ListItemsView", null);
                }
            }
            else
            {
                return PartialView("_RedirectToLogin");
            }

            #endregion

            int opId = 0;

            if (!int.TryParse(OperationId, out opId))
            {
                return View("Index");
            }

            ItemViewModel model = new ItemViewModel();

            string errorMessage = string.Empty;

            Configure.LoadItemData(ref model, opId, 0, ref errorMessage);

            ViewBag.ErrorMessage = errorMessage;

            return PartialView("_ItemView", model);

        }

        [Route("Relation/{OperationId}/{ItemId}")]
        public ActionResult AddRelation(string OperationId, string ItemId)
        {
            #region Validar sesión de usuario

            if (Validation.IsValidSession(Session[SessionVariables.SystemUser]))
            {
                if (!Validation.ValidatePermissions(Session[SessionVariables.SystemUser], OperationId))
                {
                    ViewBag.ErrorMessage = "El usuario no tiene permisos para realizar esta operación";
                    return PartialView("_ListItemsView", null);
                }
            }
            else
            {
                return PartialView("_RedirectToLogin");
            }

            #endregion

            int opId = 0, itmId = 0;

            if (!int.TryParse(OperationId, out opId) || !int.TryParse(ItemId, out itmId))
            {
                return View("Index");
            }

            string errorMessage = string.Empty;

            RelationViewModel model = new RelationViewModel();

            Configure.LoadRelationData(ref model, opId, itmId, ref errorMessage);

            return PartialView("_RelationView", model);

        }

        [Route("Delete/{OperationId}/{ItemId}")]
        public ActionResult DeleteItem(string OperationId, string ItemId)
        {
            #region Validar sesión de usuario

            if (Validation.IsValidSession(Session[SessionVariables.SystemUser]))
            {
                if (!Validation.ValidatePermissions(Session[SessionVariables.SystemUser], OperationId))
                {
                    ViewBag.ErrorMessage = "El usuario no tiene permisos para realizar esta operación";
                    return PartialView("_ListItemsView", null);
                }
            }
            else
            {
                return PartialView("_RedirectToLogin");
            }

            #endregion

            int opId = 0, itmId = 0;
            if (!int.TryParse(OperationId, out opId) || !int.TryParse(ItemId, out itmId))
            {
                ViewBag.ErrorMessage = "No fue posible cerrar la cesión del usuario.";
                return ViewCatalog(((int)Operations.VerUsuarios).ToString());
            }

            using (CatalogManagementDBModel db = new CatalogManagementDBModel())
            {
                try
                {

                    mUsers user = db.mUsers.First(usr => usr.UserID == itmId);
                    user.IsActiveSession = false;
                    db.mUsers.Attach(user);
                    db.Entry(user).Property(x => x.IsActiveSession).IsModified = true;
                    db.SaveChanges();

                }
                catch (Exception e)
                {
                    ViewBag.ErrorMessage = db.GetValidationErrors().First().ValidationErrors + " " + e.Message;
                }
            }
            return ViewCatalog(((int)Operations.VerUsuarios).ToString());

        }


        //  [HttpPost]
        [Route("SaveNew")]
        public ActionResult New(ItemViewModel model)
        {
            #region Validar sesión de usuario

            if (Validation.IsValidSession(Session[SessionVariables.SystemUser]))
            {
                if (!Validation.ValidatePermissions(Session[SessionVariables.SystemUser], model.OperationIdAction))
                {
                    ViewBag.ErrorMessage = "El usuario no tiene permisos para realizar esta operación";
                    return PartialView("_ListItemsView", null);
                }
            }
            else
            {
                return PartialView("_RedirectToLogin");
            }

            #endregion

            string errorMessage = ViewBag.ErrorMessage;


            if (Configure.SaveItem(model, ref errorMessage))
            {
                ViewBag.SuccessMessage = "Se guardó correctamente";
            }
            else
            {
                ViewBag.ErrorMessage = errorMessage;
            }

            return RedirectToAction("ViewCatalog", new { OperationId = model.OperationIdToReturn.ToString() });

        }

        [Route("Save")]
        public ActionResult Edit(ItemViewModel model)
        {
            #region Validar sesión de usuario

            if (Validation.IsValidSession(Session[SessionVariables.SystemUser]))
            {
                if (!Validation.ValidatePermissions(Session[SessionVariables.SystemUser], model.OperationIdToReturn))
                {
                    ViewBag.ErrorMessage = "El usuario no tiene permisos para realizar esta operación";
                    return PartialView("_ListItemsView", null);
                }
            }
            else
            {
                return PartialView("_RedirectToLogin");
            }

            #endregion

            string errorMessage = string.Empty;


            if (Configure.SaveItem(model, ref errorMessage))
            {
                ViewBag.SuccessMessage = "Se editó correctamente";
            }
            else
            {
                ViewBag.ErrorMessage = errorMessage;
            }

            return RedirectToAction("ViewCatalog", new { OperationId = model.OperationIdToReturn.ToString() });
        }

        [Route("SaveRelation")]
        public ActionResult SaveRelation(RelationViewModel model)
        {
            #region Validar sesión de usuario

            if (Validation.IsValidSession(Session[SessionVariables.SystemUser]))
            {
                if (!Validation.ValidatePermissions(Session[SessionVariables.SystemUser], model.OperationIdAction))
                {
                    ViewBag.ErrorMessage = "El usuario no tiene permisos para realizar esta operación";
                    return RedirectToAction("ViewCatalog", new { OperationId = model.OperationIdToReturn.ToString() });
                }
            }
            else
            {
                return PartialView("_RedirectToLogin");
            }

            #endregion

            string errorMessage = string.Empty;

            if (Configure.SaveRelation(model, ref errorMessage))
            {
                Session[SessionVariables.SuccessMessage] = "Se guardó correctamente";
            }
            else
            {
                Session[SessionVariables.ErrorMessage] = errorMessage;
            }

            return RedirectToAction("ViewCatalog", new { OperationId = model.OperationIdToReturn.ToString() });
        }
    }
}