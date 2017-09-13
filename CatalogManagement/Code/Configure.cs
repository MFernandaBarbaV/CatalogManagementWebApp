using CatalogManagement.Models.Entities;
using CatalogManagement.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WP.Security.Hash;

namespace CatalogManagement.Code
{
    public class Configure
    {

        //PASO #1: Crear el botón de menú
        /// <summary>
        /// Método para configurar los botones del menú según los permisos del usuario
        /// </summary>
        public static void LoadMainMenu(ref MenuViewModel model, SystemUser loggedUser, ref string errorMessage)
        {
            model.ItemsInMenu = new List<MenuItem>();

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Aplicaciones",
                Span = faIconss.application,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Ver Aplicaciones" , Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)Operations.VerAplicaciones, IsEnabled = loggedUser.ContainsOperation((int)Operations.VerAplicaciones) },
                    new MenuItem() { Name = "Nueva Aplicaciones", Controller = "Catalog", Action = "NewItem", OperationId = (int)Operations.NuevaAplicación, IsEnabled = loggedUser.ContainsOperation((int)Operations.NuevaAplicación) },
                }
            });

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Perfiles",
                Span = faIconss.profile,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Ver Perfiles", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)Operations.VerPerfiles, IsEnabled = loggedUser.ContainsOperation((int)Operations.VerPerfiles) },
                    new MenuItem() { Name = "Nuevo Perfil", Controller = "Catalog", Action = "NewItem", OperationId = (int)Operations.NuevoPerfil, IsEnabled = loggedUser.ContainsOperation((int)Operations.NuevoPerfil) },
                    new MenuItem() { Name = "Ver Plantilla de Acceso", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)Operations.VerPlantillasdeAcceso, IsEnabled = loggedUser.ContainsOperation((int)Operations.VerPlantillasdeAcceso) },
                    new MenuItem() { Name = "Nueva Plantilla de Acceso", Controller = "Catalog", Action = "NewItem", OperationId = (int)Operations.NuevaPlantilladeAcceso, IsEnabled = loggedUser.ContainsOperation((int)Operations.NuevaPlantilladeAcceso) },
                }
            });

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Operaciones",
                Span = faIconss.operation,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Ver Operaciones", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)Operations.VerOperaciones, IsEnabled = loggedUser.ContainsOperation((int)Operations.VerOperaciones) },
                    new MenuItem() { Name = "Nueva Operación", Controller = "Catalog", Action = "NewItem", OperationId = (int)Operations.NuevaOperación , IsEnabled = loggedUser.ContainsOperation((int)Operations.NuevaOperación) },
                }
            });

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Usuarios",
                Span = faIconss.user,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Ver Usuarios", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)Operations.VerUsuarios, IsEnabled = loggedUser.ContainsOperation((int)Operations.VerUsuarios) },
                    new MenuItem() { Name = "Nuevo Usuario", Controller = "Catalog", Action = "NewItem", OperationId = (int)Operations.NuevoUsuario , IsEnabled = loggedUser.ContainsOperation((int)Operations.NuevoUsuario) },
                }
            });

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Punto de Venta",
                Span = faIconss.money,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Ver Compras", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)Operations.VerCompras, IsEnabled = loggedUser.ContainsOperation((int)Operations.VerCompras) },
                    new MenuItem() { Name = "Ver Gastos", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)Operations.VerGastos, IsEnabled = loggedUser.ContainsOperation((int)Operations.VerGastos) },
                    new MenuItem() { Name = "Ver Tipo de Gasto", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)Operations.VerTipoGasto, IsEnabled = loggedUser.ContainsOperation((int)Operations.VerTipoGasto) },

                    new MenuItem() { Name = "Nueva Compra", Controller = "Catalog", Action = "NewItem", OperationId = (int)Operations.NuevaCompra, IsEnabled = loggedUser.ContainsOperation((int)Operations.NuevaCompra) },
                    new MenuItem() { Name = "Nuevo Gasto", Controller = "Catalog", Action = "NewItem", OperationId = (int)Operations.NuevoGasto, IsEnabled = loggedUser.ContainsOperation((int)Operations.NuevoGasto) },
                    new MenuItem() { Name = "Nuevo Tipo de Gasto", Controller = "Catalog", Action = "NewItem", OperationId = (int)Operations.NuevoTipoGasto, IsEnabled = loggedUser.ContainsOperation((int)Operations.NuevoTipoGasto) },

                }
            });
        }

        //PASO #2: Configurar las columnas que se mostrarán al VER el catálogo
        /// <summary>
        /// Método para cargar la información de un catálogo según la operación
        /// </summary>
        public static void LoadViewCatalog(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            try
            {
                using (var db = new CatalogManagementDBModel())
                {
                    using (var db2 = new PuntoDeVentaEntities())
                    {

                        switch ((Operations)operationId)
                        {
                            case Operations.VerUsuarios:
                                #region VerUsuarios

                                model.SetAttributes("Usuarios", (Operations)operationId);

                                Row row = new Row();
                                foreach (var item in db.mUsers)
                                {
                                    row = new Row();
                                    row.Columns = new List<Column>();
                                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.UserID.ToString(), ID = item.UserID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Login", Value = item.Login.ToString(), ID = item.UserID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Estatus", Value = item.mStatus.Name, ID = item.UserID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.UserID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Apellido Paterno", Value = item.LastName.ToString(), ID = item.UserID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Genero", Value = item.Sex.ToString(), ID = item.UserID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Organización", Value = item.Organization.ToString(), ID = item.UserID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Estatus", Value = item.mStatus.Name.ToString(), ID = item.UserID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Editar", Value = item.UserID.ToString(), ID = item.UserID.ToString(), Type = ColumnType.Button, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)Operations.EditarUsuarios });
                                    row.Columns.Add(new Column()
                                    {
                                        ColumnHeader = "Perfil",
                                        Value = item.UserID.ToString(),
                                        ID = item.UserID.ToString(),
                                        Type = ColumnType.Button,
                                        ButtonText = "Ver Perfiles",
                                        ButtonAction = "AddRelation",
                                        ButtonController = "Catalog",
                                        ButtonDissabled = false,
                                        ButtonOperationId = (int)Operations.AsignarPerfilaUsuario
                                    });
                                    row.Columns.Add(new Column()
                                    {
                                        ColumnHeader = "Cerrar Sesión",
                                        Value = item.UserID.ToString(),
                                        ID = item.UserID.ToString(),
                                        Type = ColumnType.Button,
                                        ButtonText = "Cerrar Sesión",
                                        ButtonAction = "CloseUserSesion",
                                        ButtonController = "Catalog",
                                        ButtonDissabled = !item.IsActiveSession,
                                        ButtonOperationId = (int)Operations.CerrarCesionUsuario
                                    });

                                    model.Rows.Add(row);
                                }


                                #endregion
                                break;
                            case Operations.VerAplicaciones:
                                #region VerAplicaciones

                                model.SetAttributes("Aplicaciones", (Operations)operationId);
                                foreach (var item in db.mApplications)
                                {
                                    row = new Row();
                                    row.Columns = new List<Column>();
                                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.ApplicationID.ToString(), ID = item.ApplicationID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.ApplicationID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Tipo", Value = item.Type.ToString(), ID = item.ApplicationID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Version", Value = item.Version.ToString(), ID = item.ApplicationID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.ReleaseDate.ToString(), ID = item.ApplicationID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Estatus", Value = item.mStatus.Name.ToString(), ID = item.ApplicationID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Editar", Value = item.ApplicationID.ToString(), ID = item.ApplicationID.ToString(), Type = ColumnType.Button, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)Operations.EditarAplicaciones });
                                    model.Rows.Add(row);
                                }

                                #endregion
                                break;
                            case Operations.VerPerfiles:
                                #region VerPerfiles

                                model.SetAttributes("Perfiles", (Operations)operationId);
                                foreach (var item in db.mProfiles)
                                {
                                    row = new Row();
                                    row.Columns = new List<Column>();
                                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.ProfileID.ToString(), ID = item.ProfileID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.ProfileID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Aplicación", Value = item.mApplications.Name, ID = item.ProfileID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "", Value = item.ProfileID.ToString(), ID = item.ProfileID.ToString(), Type = ColumnType.Button, ButtonText = "Editar Perfil", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)Operations.EditarPerfiles });
                                    row.Columns.Add(new Column() { ColumnHeader = "", Value = item.ProfileID.ToString(), ID = item.ProfileID.ToString(), Type = ColumnType.Button, ButtonText = "Editar Operaciones", ButtonAction = "AddRelation", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)Operations.AsignarOperaciónaPerfil });

                                    model.Rows.Add(row);
                                }
                                #endregion
                                break;
                            case Operations.VerOperaciones:
                                #region VerOperaciones

                                model.SetAttributes("Operaciones", (Operations)operationId);
                                foreach (var item in db.mOperations)
                                {
                                    row = new Row();
                                    row.Columns = new List<Column>();
                                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.OperationID.ToString(), ID = item.OperationID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.OperationID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Id De Sistema", Value = item.SysOperation.ToString(), ID = item.OperationID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Aplicación", Value = item.mApplications.Name, ID = item.OperationID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Editar", Value = item.OperationID.ToString(), ID = item.OperationID.ToString(), Type = ColumnType.Button, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)Operations.EditarOperaciones });
                                    model.Rows.Add(row);
                                }

                                #endregion
                                break;
                            case Operations.VerPlantillasdeAcceso:
                                #region VerPlantillasdeAcceso

                                model.SetAttributes("Plantillas de Acceso", (Operations)operationId);
                                foreach (var item in db.mAccessTemplates)
                                {
                                    row = new Row();
                                    row.Columns = new List<Column>();
                                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.AccessTemplateID.ToString(), ID = item.AccessTemplateID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.AccessTemplateID.ToString() });

                                    row.Columns.Add(new Column() { ColumnHeader = "Lunes", Value = LoadDayTemplate(item.Monday), ID = item.AccessTemplateID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Martes", Value = LoadDayTemplate(item.Tuesday), ID = item.AccessTemplateID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Miércoles", Value = LoadDayTemplate(item.Wednesday), ID = item.AccessTemplateID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Jueves", Value = LoadDayTemplate(item.Thursday), ID = item.AccessTemplateID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Viernes", Value = LoadDayTemplate(item.Friday), ID = item.AccessTemplateID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Sábado", Value = LoadDayTemplate(item.Saturday), ID = item.AccessTemplateID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Domingo", Value = LoadDayTemplate(item.Sunday), ID = item.AccessTemplateID.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Editar", Value = item.AccessTemplateID.ToString(), ID = item.AccessTemplateID.ToString(), Type = ColumnType.Button, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)Operations.EditarPlantillasdeAcceso });

                                    model.Rows.Add(row);
                                }

                                #endregion
                                break;
                            case Operations.VerGastos:
                                #region VerGastos

                                model.SetAttributes("Gastos", (Operations)operationId);
                                foreach (var item in db2.Gastos)
                                {
                                    row = new Row();
                                    row.Columns = new List<Column>();
                                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.IdGasto.ToString(), ID = item.IdGasto.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Descripción", Value = item.Descripcion.ToString(), ID = item.IdGasto.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Tipo de Gasto", Value = item.TipoGasto.Descripcion, ID = item.IdGasto.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Cantidad", Value = item.Cantidad.ToString("c2"), ID = item.IdGasto.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.Fecha.ToString("dd MMMM yyyy hh:mm tt"), ID = item.IdGasto.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "", Value = item.IdGasto.ToString(), ID = item.IdGasto.ToString(), Type = ColumnType.Button, ButtonText = "Editar Gasto", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonOperationId = (int)Operations.EditarGasto });
                                    row.Columns.Add(new Column() { ColumnHeader = "", Value = item.IdGasto.ToString(), ID = item.IdGasto.ToString(), Type = ColumnType.Button, ButtonText = "Eliminar Gasto", ButtonAction = "DeleteItem", ButtonController = "Catalog", ButtonOperationId = (int)Operations.EliminarGasto });

                                    model.Rows.Add(row);
                                }
                                #endregion
                                break;
                            case Operations.VerTipoGasto:
                                #region VerTipoGasto

                                model.SetAttributes("Tipo de Gasto", (Operations)operationId);
                                foreach (var item in db2.TipoGasto)
                                {
                                    row = new Row();
                                    row.Columns = new List<Column>();
                                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.IdTipoGasto.ToString(), ID = item.IdTipoGasto.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "Descripción", Value = item.Descripcion.ToString(), ID = item.IdTipoGasto.ToString() });
                                    row.Columns.Add(new Column() { ColumnHeader = "", Value = item.IdTipoGasto.ToString(), ID = item.IdTipoGasto.ToString(), Type = ColumnType.Button, ButtonText = "Editar Tipo de Gasto", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonOperationId = (int)Operations.EditarTipoGasto });

                                    model.Rows.Add(row);
                                }
                                #endregion
                                break;
                            default:
                                errorMessage = "Modulo no implementado en Configure.LoadViewCatalog: " + ((Operations)operationId).ToString("g");

                                break;
                        };
                    }
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
            }
        }


        //PASO #3: Configurar los campos que se mostrarán al crear uno nuevo o al editar
        /// <summary>
        /// Método para cargar la información de un elemento según la operación
        /// </summary>
        public static void LoadItemData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            try
            {
                using (var db2 = new PuntoDeVentaEntities())
                {
                    using (var db = new CatalogManagementDBModel())
                    {

                        Dictionary<int, string> statusList = new Dictionary<int, string>();
                        foreach (var item in db.mStatus.Where(s => s.mStatusTypes.TypeID == 1))
                        {
                            statusList.Add(item.StatusID, item.Name);
                        }

                        string messageValidation = string.Empty;

                        switch ((Operations)operationId)
                        {
                            case Operations.NuevaAplicación:
                            case Operations.EditarAplicaciones:
                                #region Aplicaciones
                                {
                                    mApplications resultApp = null;

                                    if (itemId == 0)//Nuevo
                                    {
                                        resultApp = new mApplications();
                                        model.SetAttributes(itemId, "Nueva Aplicación", "Guardar", "New", "Catalog", (Operations)operationId, Operations.VerAplicaciones);

                                    }
                                    else//Editar
                                    {
                                        resultApp = db.mApplications.First(app => app.ApplicationID == itemId);
                                        model.SetAttributes(itemId, "Editar Aplicación", "Guardar", "Edit", "Catalog", (Operations)operationId, Operations.VerAplicaciones);

                                    }

                                    if (resultApp != null)
                                    {
                                        model.Properties = new List<Propertie>();
                                        model.Properties.Add(new Propertie() { Id = "name", Label = "Nombre", Value = resultApp.Name, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "Type", Label = "Tipo", Value = resultApp.Type, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 10, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "version", Label = "Versión", Value = resultApp.Version, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 10, true, true, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "statusID", Label = "Estatus", Value = resultApp.StatusID.ToString(), Type = PropertieType.ComboBox, MultipleValues = statusList, ClassIcon = faIconss.status });

                                    }
                                }
                                #endregion
                                break;
                            case Operations.NuevoUsuario:
                            case Operations.EditarUsuarios:
                                #region Usuarios
                                {
                                    mUsers resultUser = null;

                                    if (itemId == 0)//Nuevo
                                    {
                                        resultUser = new mUsers();
                                        model.SetAttributes(itemId, "Nuevo Usuario", "Guardar", "New", "Catalog", (Operations)operationId, Operations.VerUsuarios);
                                    }
                                    else // Editar
                                    {
                                        resultUser = db.mUsers.Where(us => us.UserID == itemId).FirstOrDefault();
                                        model.SetAttributes(itemId, "Editar Usuario", "Guardar", "Edit", "Catalog", (Operations)operationId, Operations.VerUsuarios);
                                    }

                                    Dictionary<int, string> gendleList = new Dictionary<int, string>();
                                    gendleList.Add(1, "Masculino");
                                    gendleList.Add(2, "Femenino");

                                    if (resultUser != null)
                                    {

                                        model.Properties = new List<Propertie>();
                                        #region FillProperties

                                        model.Properties.Add(new Propertie() { Id = "Name", Label = "Nombre", Value = resultUser.Name, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "LastName", Label = "Apellido Paterno", Value = resultUser.LastName, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "Surname", Label = "Apellido Materno", Value = resultUser.Surname, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "ShortName", Label = "Nombre Corto", Value = resultUser.ShortName, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "Sex", Label = "Genero", Value = resultUser.Sex.ToString(), Type = PropertieType.ComboBox, MultipleValues = gendleList, ClassIcon = faIconss.gendle });

                                        model.Properties.Add(new Propertie() { Id = "Address", Label = "Dirección", Value = resultUser.Address, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "ZipCode", Label = "Código Postal", Value = resultUser.ZipCode.ToString(), RegEx = Utils.GenerateRegex(false, false, true, false, 0, 6, false, false, ref messageValidation), ErrorMessage = messageValidation });

                                        model.Properties.Add(new Propertie() { Id = "Email", Label = "Email", Value = resultUser.Email, RegEx = Utils.RegexEmail, ErrorMessage = "Formato invalido para un correo" });
                                        model.Properties.Add(new Propertie() { Id = "Organization", Label = "Organización", Value = resultUser.Organization, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "Position", Label = "Puesto", Value = resultUser.Position, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });

                                        model.Properties.Add(new Propertie() { Id = "Status", Label = "Estatus", Value = resultUser.StatusID.ToString(), Type = PropertieType.ComboBox, MultipleValues = statusList, ClassIcon = faIconss.status });

                                        model.Properties.Add(new Propertie() { Id = "Login", Label = "Usuario", Value = resultUser.Login, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, true, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "Password", Label = "Contraseña", Value = resultUser.Password, ClassIcon = faIconss.password, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 30, true, false, ref messageValidation), ErrorMessage = messageValidation, Type = PropertieType.Password });
                                        model.Properties.Add(new Propertie() { Label = "Confirmar Contraseña", Value = "", ClassIcon = faIconss.password, Type = PropertieType.ConfirmPassword });
                                        #endregion

                                    }
                                }
                                #endregion
                                break;
                            case Operations.NuevoPerfil:
                            case Operations.EditarPerfiles:
                                #region Perfiles
                                {
                                    mProfiles resultProfile = null;

                                    Dictionary<int, string> aplicaciones = new Dictionary<int, string>();

                                    foreach (var item in db.mApplications)
                                    {
                                        aplicaciones.Add(item.ApplicationID, item.Name);
                                    }

                                    if (itemId == 0)//Nuevo
                                    {
                                        resultProfile = new mProfiles();
                                        model.SetAttributes(itemId, "Nuevo Perfil", "Guardar", "New", "Catalog", (Operations)operationId, Operations.VerPerfiles);

                                    }
                                    else // Editar
                                    {
                                        resultProfile = db.mProfiles.Where(us => us.ProfileID == itemId).FirstOrDefault();
                                        model.SetAttributes(itemId, "Editar Perfil", "Guardar", "Edit", "Catalog", (Operations)operationId, Operations.VerPerfiles);
                                    }

                                    if (resultProfile != null)
                                    {
                                        model.Properties = new List<Propertie>();
                                        model.Properties.Add(new Propertie() { Id = "Name", Label = "Nombre", Value = resultProfile.Name, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "ApplicationID", Label = "Aplicación", Value = resultProfile.ApplicationID.ToString(), Type = PropertieType.ComboBox, MultipleValues = aplicaciones, IsEnabled = itemId == 0, ClassIcon = faIconss.application });

                                    }
                                }
                                #endregion
                                break;
                            case Operations.NuevaOperación:
                            case Operations.EditarOperaciones:
                                #region Operaciones
                                {
                                    mOperations resultOperation = null;

                                    Dictionary<int, string> aplicaciones = new Dictionary<int, string>();

                                    foreach (var item in db.mApplications)
                                    {
                                        aplicaciones.Add(item.ApplicationID, item.Name);
                                    }

                                    if (itemId == 0)//Nuevo
                                    {
                                        resultOperation = new mOperations();
                                        model.SetAttributes(itemId, "Nueva Operación", "Guardar", "New", "Catalog", (Operations)operationId, Operations.VerOperaciones);

                                    }
                                    else // Editar
                                    {
                                        resultOperation = db.mOperations.Where(us => us.OperationID == itemId).FirstOrDefault();
                                        model.SetAttributes(itemId, "Editar Operación", "Guardar", "Edit", "Catalog", (Operations)operationId, Operations.VerOperaciones);
                                    }

                                    if (resultOperation != null)
                                    {
                                        model.Properties = new List<Propertie>();
                                        model.Properties.Add(new Propertie() { Id = "Name", Label = "Nombre", Value = resultOperation.Name, RegEx = Utils.GenerateRegex(true, true, false, true, 1, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "SysOperation", Label = "Id de Sistema", Value = resultOperation.SysOperation.ToString(), Type = PropertieType.TextBox, IsEnabled = itemId == 0, RegEx = Utils.OnlyNumber, ErrorMessage = Utils.ErrorOnlyNumber });

                                        model.Properties.Add(new Propertie() { Id = "ApplicationID", Label = "Aplicación", Value = resultOperation.ApplicationID.ToString(), Type = PropertieType.ComboBox, MultipleValues = aplicaciones, IsEnabled = itemId == 0, ClassIcon = faIconss.application });

                                    }
                                }
                                #endregion
                                break;
                            case Operations.NuevaPlantilladeAcceso:
                            case Operations.EditarPlantillasdeAcceso:
                                #region EditarPlantillasdeAcceso
                                {
                                    mAccessTemplates resultAccessTemplate = null;

                                    Dictionary<int, string> horariosInicio = new Dictionary<int, string>();
                                    Dictionary<int, string> horariosFin = new Dictionary<int, string>();

                                    for (int i = 1; i < 24; i++)
                                    {
                                        horariosInicio.Add(i, i + ":00 hrs");
                                    }

                                    for (int i = 1; i < 24; i++)
                                    {
                                        horariosFin.Add(i, i + ":59 hrs");
                                    }

                                    if (itemId == 0)//Nuevo
                                    {
                                        resultAccessTemplate = new mAccessTemplates();
                                        model.SetAttributes(itemId, "Nueva Plantilla de Acceso", "Guardar", "New", "Catalog", (Operations)operationId, Operations.VerPlantillasdeAcceso);

                                    }
                                    else // Editar
                                    {
                                        resultAccessTemplate = db.mAccessTemplates.FirstOrDefault(at => at.AccessTemplateID == itemId);
                                        model.SetAttributes(itemId, "Editar Plantilla de Acceso", "Guardar", "Edit", "Catalog", (Operations)operationId, Operations.VerPlantillasdeAcceso);
                                    }

                                    if (resultAccessTemplate != null)
                                    {
                                        model.Properties = new List<Propertie>();
                                        model.Properties.Add(new Propertie() { Id = "Name", Label = "Nombre", Value = resultAccessTemplate.Name, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 30, true, true, ref messageValidation), ErrorMessage = messageValidation });

                                        int init = 0, end = 0;
                                        LoadDayTemplate(resultAccessTemplate.Monday, ref init, ref end);
                                        model.Properties.Add(new Propertie() { Id = "Monday", Label = "Lunes", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                                        model.Properties.Add(new Propertie() { Id = "MondayInit", Label = "Hora inicial de Lunes", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                                        model.Properties.Add(new Propertie() { Id = "MondayEnd", Label = "Hora final de Lunes", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                                        LoadDayTemplate(resultAccessTemplate.Tuesday, ref init, ref end);
                                        model.Properties.Add(new Propertie() { Id = "Tuesday", Label = "Martes", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                                        model.Properties.Add(new Propertie() { Id = "TuesdayInit", Label = "Hora inicial de Martes", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                                        model.Properties.Add(new Propertie() { Id = "TuesdayEnd", Label = "Hora final de Martes", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                                        LoadDayTemplate(resultAccessTemplate.Wednesday, ref init, ref end);
                                        model.Properties.Add(new Propertie() { Id = "Wednesday", Label = "Miércoles", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                                        model.Properties.Add(new Propertie() { Id = "WednesdayInit", Label = "Hora inicial de Miércoles", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                                        model.Properties.Add(new Propertie() { Id = "WednesdayEnd", Label = "Hora final de Miércoles", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                                        LoadDayTemplate(resultAccessTemplate.Thursday, ref init, ref end);
                                        model.Properties.Add(new Propertie() { Id = "Thursday", Label = "Jueves", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                                        model.Properties.Add(new Propertie() { Id = "ThursdayInit", Label = "Hora inicial de Jueves", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                                        model.Properties.Add(new Propertie() { Id = "ThursdayEnd", Label = "Hora final de Jueves", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                                        LoadDayTemplate(resultAccessTemplate.Friday, ref init, ref end);
                                        model.Properties.Add(new Propertie() { Id = "Friday", Label = "Viernes", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                                        model.Properties.Add(new Propertie() { Id = "FridayInit", Label = "Hora inicial de viernes", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                                        model.Properties.Add(new Propertie() { Id = "FridayEnd", Label = "Hora final de viernes", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                                        LoadDayTemplate(resultAccessTemplate.Saturday, ref init, ref end);
                                        model.Properties.Add(new Propertie() { Id = "Saturday", Label = "Sábado", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                                        model.Properties.Add(new Propertie() { Id = "SaturdayInit", Label = "Hora inicial de Sábado", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                                        model.Properties.Add(new Propertie() { Id = "SaturdayEnd", Label = "Hora final de Sábado", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                                        LoadDayTemplate(resultAccessTemplate.Sunday, ref init, ref end);
                                        model.Properties.Add(new Propertie() { Id = "Sunday", Label = "Domingo", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                                        model.Properties.Add(new Propertie() { Id = "SundayInit", Label = "Hora inicial de Domingo", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                                        model.Properties.Add(new Propertie() { Id = "SundayEnd", Label = "Hora final de Domingo", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });


                                    }
                                }
                                #endregion
                                break;
                            case Operations.NuevoGasto:
                            case Operations.EditarGasto:
                                #region Gastos
                                {
                                    Gastos resultGasto = null;

                                    Dictionary<int, string> tipoGasto = new Dictionary<int, string>();

                                    foreach (var item in db2.TipoGasto)
                                    {
                                        tipoGasto.Add(item.IdTipoGasto, item.Descripcion);
                                    }

                                    if (itemId == 0)//Nuevo
                                    {
                                        resultGasto = new Gastos();
                                        model.SetAttributes(itemId, "Nuevo Gasto", "Guardar", "New", "Catalog", (Operations)operationId, Operations.VerGastos);

                                    }
                                    else // Editar
                                    {
                                        resultGasto = db2.Gastos.Where(us => us.IdGasto == itemId).FirstOrDefault();
                                        model.SetAttributes(itemId, "Editar Gastos", "Guardar", "Edit", "Catalog", (Operations)operationId, Operations.VerGastos);
                                    }

                                    if (resultGasto != null)
                                    {
                                        model.Properties = new List<Propertie>();
                                        model.Properties.Add(new Propertie() { Id = "Descripcion", Label = "Descripción", Value = resultGasto.Descripcion, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 50, true, true,ref messageValidation), ErrorMessage = messageValidation });
                                        model.Properties.Add(new Propertie() { Id = "IdTipoGasto", Label = "Tipo Gasto", MultipleValues = tipoGasto, Type = PropertieType.ComboBox, Value = resultGasto.IdTipoGasto.ToString() });
                                        model.Properties.Add(new Propertie() { Id = "Cantidad", Label = "Cantidad", ObjectValue = resultGasto.Cantidad, RegEx = Utils.OnlyNumber, ErrorMessage = Utils.ErrorOnlyNumber, Type = PropertieType.TextBox, ClassIcon = faIconss.money });


                                    }
                                }
                                #endregion
                                break;
                            case Operations.EditarTipoGasto:
                            case Operations.NuevoTipoGasto:
                                #region TipoGasto
                                {
                                    TipoGasto resultGasto = null;

                                    if (itemId == 0)//Nuevo
                                    {
                                        resultGasto = new TipoGasto();
                                        model.SetAttributes(itemId, "Nuevo Gasto", "Guardar", "New", "Catalog", (Operations)operationId, Operations.VerTipoGasto);

                                    }
                                    else // Editar
                                    {
                                        resultGasto = db2.TipoGasto.Where(us => us.IdTipoGasto == itemId).FirstOrDefault();
                                        model.SetAttributes(itemId, "Editar Tipo Gasto", "Guardar", "Edit", "Catalog", (Operations)operationId, Operations.VerTipoGasto);
                                    }

                                    if (resultGasto != null)
                                    {
                                        model.Properties = new List<Propertie>();
                                        model.Properties.Add(new Propertie() { Id = "Descripcion", Label = "Tipo Gasto", Value = resultGasto.Descripcion, RegEx = Utils.GenerateRegex(true, true, false, true, 1, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                                    }
                                }
                                #endregion
                                break;
                            default:
                                errorMessage = "Modulo no implementado en Configure.LoadItemData: " + ((Operations)operationId).ToString("g");
                                break;
                        }
                    }
                }
            }
            catch (Exception e)
            {
                errorMessage = e.Message + (e.InnerException == null ? "" : e.InnerException.Message);
            }
        }

        //PASO #3b: Configurar los campos que se mostrarán al crear o editar una nueva relación entre catalogos
        /// <summary>
        /// Método para cargar la información de una relación según la operación
        /// </summary>
        public static void LoadRelationData(ref RelationViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            try
            {

                using (var db = new CatalogManagementDBModel())
                {

                    switch ((Operations)operationId)
                    {
                        case Operations.AsignarPerfilaUsuario:
                            #region AsignarPerfilaUsuario

                            Dictionary<int, string> templates = new Dictionary<int, string>();

                            foreach (var item in db.mAccessTemplates)
                            {
                                templates.Add(item.AccessTemplateID, item.Name);
                            }

                            var user = db.mUsers.FirstOrDefault(u => u.UserID == itemId);
                            var profilesAssigned = user.dUserProfiles;
                            var allProfiles = db.mProfiles;


                            model.SetAttributes(Title: "Perfiles de usuario", ItemId: user.UserID, NameItem: user.Login, TitlePrincipalElement: "Usuario", TitleRelationElement: "Perfiles",
                               ButtonAction: "SaveRelation", ButtonController: "Catalog", ButtonText: "Guardar", OperationIdAction: operationId, OperationIdToReturn: (int)Operations.VerUsuarios);

                            model.Items = new List<Row>();
                            foreach (var profile in allProfiles)
                            {
                                Row row = new Row();
                                row.Columns = new List<Column>();
                                row.Columns.Add(new Column()
                                {
                                    Type = ColumnType.CheckBox,
                                    BooleanValue = profilesAssigned.FirstOrDefault(p => p.ProfileID == profile.ProfileID) != null,
                                    ColumnHeader = "Selección",
                                    ID = profile.ProfileID.ToString()
                                });

                                row.Columns.Add(new Column() { ID = profile.ProfileID.ToString(), ColumnHeader = "Id de Perfil", Value = profile.ProfileID.ToString() });
                                row.Columns.Add(new Column() { ID = profile.ProfileID.ToString(), ColumnHeader = "Perfil", Value = profile.Name.ToString() });
                                row.Columns.Add(new Column() { ID = profile.ProfileID.ToString(), ColumnHeader = "Aplicación", Value = profile.mApplications.Name.ToString() });
                                row.Columns.Add(new Column() { ID = profile.ProfileID.ToString(), ColumnHeader = "Horario", Value = "", Type = ColumnType.ComboBox, MultipleValues = templates });
                                model.Items.Add(row);
                            }

                            #endregion
                            break;
                        case Operations.AsignarOperaciónaPerfil:
                            #region AsignarOperaciónaPerfil

                            var profileToAssign = db.mProfiles.FirstOrDefault(p => p.ProfileID == itemId);
                            var operationsAssigned = profileToAssign.mOperations;
                            var allOperations = db.mOperations.Where(o => o.ApplicationID == profileToAssign.ApplicationID);


                            model.SetAttributes("Operaciones del perfil", profileToAssign.ProfileID, profileToAssign.Name, "Perfil", "Operaciones", "SaveRelation", "Catalog", "Guardar", OperationIdAction: operationId, OperationIdToReturn: (int)Operations.VerPerfiles);

                            model.Items = new List<Row>();
                            foreach (var operation in allOperations)
                            {
                                Row row = new Row();
                                row.Columns = new List<Column>();
                                row.Columns.Add(new Column()
                                {
                                    Type = ColumnType.CheckBox,
                                    BooleanValue = operationsAssigned.FirstOrDefault(p => p.OperationID == operation.OperationID) != null,
                                    ColumnHeader = "Selección",
                                    ID = operation.OperationID.ToString()
                                });

                                row.Columns.Add(new Column() { ID = operation.OperationID.ToString(), ColumnHeader = "Id de Operación", Value = operation.OperationID.ToString() });
                                row.Columns.Add(new Column() { ID = operation.Name.ToString(), ColumnHeader = "Operación", Value = operation.Name.ToString() });
                                row.Columns.Add(new Column() { ID = operation.SysOperation.ToString(), ColumnHeader = "Id de Sistema", Value = operation.SysOperation.ToString() });
                                row.Columns.Add(new Column() { ID = operation.mApplications.Name.ToString(), ColumnHeader = "Aplicación", Value = operation.mApplications.Name.ToString() });

                                model.Items.Add(row);
                            }

                            #endregion
                            break;
                        default:
                            errorMessage = "Modulo no implementado en Configure.LoadRelationData: " + ((Operations)operationId).ToString("g");
                            break;
                    }

                }

            }
            catch (Exception e)
            {
                errorMessage = e.Message;
            }
        }

        //PASO #4: Configurar los campos que se guardarán al crear o modificar
        /// <summary>
        /// Método para guardar la información de un elemento
        /// </summary>
        public static bool SaveItem(ItemViewModel model, ref string errorMessage)
        {
            try
            {
                bool result = false;
                System.Data.Entity.Core.Objects.ObjectParameter param = null;

                using (var db2 = new PuntoDeVentaEntities())
                using (var db = new CatalogManagementDBModel())
                {

                    switch ((Operations)model.OperationIdAction)
                    {
                        case Operations.EditarUsuarios:
                            #region Usuarios

                            var resUserUpd = db.spmUser_Update(
                                userID: model.ItemId,
                                name: model.GetValuePropertieString("Name"),
                                lastName: model.GetValuePropertieString("LastName"),
                                surname: model.GetValuePropertieString("Surname"),
                                sexID: model.GetValuePropertieInteger("Sex"),
                                address: model.GetValuePropertieString("Address"),
                                zipCode: model.GetValuePropertieInteger("ZipCode"),
                                email: model.GetValuePropertieString("Email"),
                                organization: model.GetValuePropertieString("Organization"),
                                position: model.GetValuePropertieString("Position"),
                                shortName: model.GetValuePropertieString("ShortName"),
                                login: model.GetValuePropertieString("Login"),
                                password: HashSecurity.GeneratePasswordHash(model.GetValuePropertieString("Password"), CryptographyFormat.SHA1),
                                status: model.GetValuePropertieInteger("Status"));

                            result = resUserUpd != null && resUserUpd.First() > 0;

                            #endregion
                            break;
                        case Operations.NuevoUsuario:
                            #region NuevoUsuario

                            param = new System.Data.Entity.Core.Objects.ObjectParameter("userID", typeof(int));

                            var resUserIns = db.spmUser_Insert(
                                userID: param,
                                name: model.GetValuePropertieString("Name"),
                                lastName: model.GetValuePropertieString("LastName"),
                                surname: model.GetValuePropertieString("Surname"),
                                sexID: model.GetValuePropertieInteger("Sex"),
                                address: model.GetValuePropertieString("Address"),
                                zipCode: model.GetValuePropertieInteger("ZipCode"),
                                email: model.GetValuePropertieString("Email"),
                                organization: model.GetValuePropertieString("Organization"),
                                position: model.GetValuePropertieString("Position"),
                                shortName: model.GetValuePropertieString("ShortName"),
                                login: model.GetValuePropertieString("Login"),
                                password: HashSecurity.GeneratePasswordHash(model.GetValuePropertieString("Password"), CryptographyFormat.SHA1),
                                status: model.GetValuePropertieInteger("Status"));

                            result = resUserIns > 0;

                            #endregion
                            break;
                        case Operations.EditarAplicaciones:
                            #region EditarAplicaciones

                            var resAppUdt = db.spmApplications_Update(
                                applicationID: model.ItemId
                                  , name: model.GetValuePropertieString("name")
                                  , type: model.GetValuePropertieString("type")
                                  , origin: string.Empty
                                  , releaseDate: DateTime.Now
                                  , version: model.GetValuePropertieString("version")
                                  , statusID: model.GetValuePropertieInteger("statusID")
                                  );
                            result = resAppUdt > 0;

                            #endregion
                            break;
                        case Operations.NuevaAplicación:
                            #region NuevaAplicación

                            param = new System.Data.Entity.Core.Objects.ObjectParameter("applicationID", typeof(int));

                            var resAppIns = db.spmApplications_Insert(
                                applicationID: param,
                                name: model.GetValuePropertieString("name"),
                                type: model.GetValuePropertieString("type"),
                                origin: string.Empty,
                                statusID: model.GetValuePropertieInteger("statusID"),
                                version: model.GetValuePropertieString("version"),
                                releaseDate: null
                                );
                            result = resAppIns > 0;
                            #endregion
                            break;
                        case Operations.NuevoPerfil:
                            #region NuevoPerfil

                            param = new System.Data.Entity.Core.Objects.ObjectParameter("profileID", typeof(int));

                            var resProfileIns = db.spmProfiles_Insert(
                                profileID: param,
                                name: model.GetValuePropertieString("name"),
                                applicationID: model.GetValuePropertieInteger("ApplicationID"));

                            result = resProfileIns > 0;

                            #endregion
                            break;
                        case Operations.EditarPerfiles:
                            #region EditarPerfiles

                            var resProfileUpd = db.spmProfiles_Update(
                               profileID: model.ItemId,
                               name: model.GetValuePropertieString("name"),
                               applicationID: model.GetValuePropertieInteger("ApplicationID"));

                            result = resProfileUpd != null && resProfileUpd.First() > 0;
                            #endregion
                            break;
                        case Operations.NuevaOperación:
                            #region NuevaOperacion

                            param = new System.Data.Entity.Core.Objects.ObjectParameter("OperationId", typeof(int));
                            var resOperatInsert = db.spmOperations_Insert(
                                operationID: param,
        name: model.GetValuePropertieString("name"),
        applicationID: model.GetValuePropertieInteger("ApplicationID"));

                            result = resOperatInsert > 0;

                            #endregion
                            break;
                        case Operations.NuevoGasto:
                            #region NuevoGasto

                            db2.Gastos.Add(new Gastos()
                            {
                                Descripcion = model.GetValuePropertieString("Descripcion"),
                                IdTipoGasto = model.GetValuePropertieByte("IdTipoGasto"),
                                Cantidad = model.GetValuePropertieInteger("Cantidad")
                            });
                            db2.SaveChanges();

                            result = true;
                            #endregion
                            break;
                        case Operations.NuevoTipoGasto:
                            #region NuevoGasto

                            db2.TipoGasto.Add(new TipoGasto()
                            {
                                Descripcion = model.GetValuePropertieString("Descripcion"),
                            });
                            db2.SaveChanges();

                            result = true;
                            #endregion
                            break;
                        case Operations.EditarTipoGasto:
                            #region EditarTipoGasto

                            var tipoGasto = db2.TipoGasto.FirstOrDefault(m => m.IdTipoGasto == model.ItemId);

                            // Assign the new values
                            tipoGasto.Descripcion = model.GetValuePropertieString("Descripcion");

                            // Update and save

                            db2.Entry(tipoGasto);
                            db2.SaveChanges();



                            result = true;
                            #endregion
                            break;

                        case Operations.EditarGasto:
                            #region EditarGasto

                            var gasto = db2.Gastos.FirstOrDefault(m => m.IdGasto == model.ItemId);

                            // Assign the new values
                            gasto.Descripcion = model.GetValuePropertieString("Descripcion");
                            gasto.IdTipoGasto = model.GetValuePropertieByte("IdTipoGasto");
                            // Update and save

                            db2.Entry(gasto);
                            db2.SaveChanges();



                            result = true;
                            #endregion
                            break;
                        default:
                            errorMessage = "Modulo no implementado en Configure.SaveItem: " + ((Operations)model.OperationIdAction).ToString("g");
                            break;
                    }
                }

                return result;
            }
            catch (Exception e)
            {
                errorMessage = e.Message + (e.InnerException == null ? "" : e.InnerException.Message);
                return false;
            }
        }


        //PASO #4b: Configurar los campos que se guardarán al crear o modificar una relación entre catalogos
        /// <summary>
        /// Método para guardar la información de una relación entre catálogos
        /// </summary>
        public static bool SaveRelation(RelationViewModel model, ref string errorMessage)
        {
            try
            {
                bool result = false;
                using (var db = new CatalogManagementDBModel())
                {

                    switch ((Operations)model.OperationIdAction)
                    {
                        case Operations.AsignarPerfilaUsuario:
                            #region AsignarPerfilaUsuario

                            using (var dbContextTransaction = db.Database.BeginTransaction())
                            {
                                try
                                {
                                    int r1 = db.spdUserProfiles_Delete(model.ItemId);

                                    if (r1 < 0)
                                    {
                                        result = false;
                                        break;
                                    }
                                    else
                                    {
                                        result = true;
                                    }


                                    foreach (var item in model.Items)
                                    {
                                        if (result && item.Columns[0].BooleanValue)
                                        {

                                            var r2 = db.spdUserProfiles_Insert(model.ItemId, int.Parse(item.Columns[0].ID), int.Parse(item.Columns[3].Value));
                                            if (r2 == null || r2.First() < 1)
                                            {
                                                result = false;
                                                continue;
                                            }
                                        }
                                    }

                                    dbContextTransaction.Commit();
                                    result = true;
                                }
                                catch (Exception ex)
                                {
                                    errorMessage = ex.Message + (ex.InnerException == null ? string.Empty : " " + ex.InnerException.Message);
                                    dbContextTransaction.Rollback();
                                    result = false;
                                }
                            }

                            #endregion
                            break;
                        case Operations.AsignarOperaciónaPerfil:

                            #region AsignarOperaciónaPerfil

                            using (var dbContextTransaction = db.Database.BeginTransaction())
                            {
                                try
                                {
                                    int r1 = db.spdProfileOperations_Delete(model.ItemId);

                                    if (r1 < 0)
                                    {
                                        result = false;
                                        break;
                                    }
                                    else
                                    {
                                        result = true;
                                    }

                                    int r2 = 0;
                                    foreach (var item in model.Items)
                                    {
                                        if (result && item.Columns[0].BooleanValue)
                                        {
                                            r2 = db.spdProfileOperations_Insert(model.ItemId, int.Parse(item.Columns[0].ID));
                                            if (r2 < 1)
                                            {
                                                result = false;
                                                continue;
                                            }
                                        }
                                    }

                                    dbContextTransaction.Commit();
                                    result = true;
                                }
                                catch (Exception)
                                {
                                    dbContextTransaction.Rollback();
                                    result = false;
                                }
                            }

                            #endregion

                            break;
                        default:
                            errorMessage = "Modulo no implementado en Configure.SaveRelation: " + ((Operations)model.OperationIdAction).ToString("g");
                            break;
                    }
                }

                return result;

            }
            catch (Exception e)
            {
                errorMessage = e.Message;
                return false;
            }
        }



        #region Helpers

        public static string LoadDayTemplate(string hexstring)
        {
            string first = string.Empty, last = string.Empty;

            int cont, value = Convert.ToInt32(hexstring, 16);

            for (cont = 0; cont < 24; cont++)
            {
                if ((value & (1 << cont)) == (1 << cont))
                {
                    if (string.IsNullOrEmpty(first))
                        first = cont.ToString() + ":00 - ";
                    last = (cont).ToString() + ":59 hrs";
                }
            }

            return first + last;
        }

        public static string LoadDayTemplate(string hexstring, ref int firstHour, ref int lastHour)
        {
            if (string.IsNullOrEmpty(hexstring))
                hexstring = "03FE00";

            string first = string.Empty, last = string.Empty;

            int cont, value = Convert.ToInt32(hexstring, 16);

            for (cont = 0; cont < 24; cont++)
            {
                if ((value & (1 << cont)) == (1 << cont))
                {
                    if (string.IsNullOrEmpty(first))
                    {
                        firstHour = cont;
                        first = cont.ToString() + ":00 - ";
                    }

                    last = (cont).ToString() + ":59 hrs";
                    lastHour = cont;
                }
            }

            return first + last;
        }
        #endregion

    }
}