using CatalogManagement.Models.Entities;
using CatalogManagement.Models.ViewModels;
using System;
using System.Collections.Generic;

namespace CatalogManagement.Code
{
    public class Configure
    {
        public enum ControllerMethods
        {
            ViewCatalog, ViewFilterReport, ViewReport, CloseUserSesion, LoadItemData, NewItem, AddRelation, DeleteItem
        }

        //PASO #1: Crear el botón de menú
        /// <summary>
        /// Método para configurar los botones del menú según los permisos del usuario
        /// </summary>
        public static void LoadMainMenu(ref MenuViewModel model, SystemUser loggedUser, ref string errorMessage)
        {
            model.ItemsInMenu = new List<MenuItem>();

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Sesión",
                Span = faIconss.user,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Cerrar sesión" , Controller = "Account", Action = "Logout" },
               }
            });

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Aplicaciones",
                Span = faIconss.application,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Aplicaciones" , Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerAplicaciones, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerAplicaciones) },
                 new MenuItem() { Name = "Perfiles", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerPerfiles, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerPerfiles) },
                     new MenuItem() { Name = "Plantilla de Acceso", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerPlantillasdeAcceso, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerPlantillasdeAcceso) },

                            new MenuItem() { Name = "Operaciones", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerOperaciones, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerOperaciones) },

                }
            });



            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Operaciones",
                Span = faIconss.operation,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Operaciones", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerOperaciones, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerOperaciones) },
                }
            });

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Usuarios",
                Span = faIconss.user,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Usuarios", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerUsuarios, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerUsuarios) },
                }
            });

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Catalogos",
                Span = faIconss.bookmark,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                   new MenuItem() { Name = "Productos", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerProductos, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerProductos) },

                }
            });

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Gastos",
                Span = faIconss.shopping,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                  new MenuItem() { Name = "Nuevo Gasto", Controller = "Catalog", Action = "NewItem", OperationId = (int)OperationsEnum.NuevoGasto, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.NuevoGasto) },
                  new MenuItem() { Name = "Nuevo Tipo de Gasto", Controller = "Catalog", Action = "NewItem", OperationId = (int)OperationsEnum.NuevoTipoGasto, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.NuevoTipoGasto) },
                  new MenuItem() { Name = "Nueva Compra", Controller = "Catalog", Action = "NewItem", OperationId = (int)OperationsEnum.NuevaCompra, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.NuevaCompra) },

                }
            });

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Ventas",
                Span = faIconss.money,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                   new MenuItem() { Name = "Nueva Venta", Controller = "Catalog", Action = "NewItem", OperationId = (int)OperationsEnum.NuevaVenta, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.NuevaVenta) },

                }
            });

            model.ItemsInMenu.Add(new MenuItem()
            {
                Name = "Reportes",
                Span = faIconss.filter,
                IsDropBox = true,
                InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Reporte de Gastos", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerReporteGastos, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerReporteGastos) },
                    new MenuItem() { Name = "Reporte de Compras", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerReporteCompras, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerReporteCompras) },
                    new MenuItem() { Name = "Reporte de Ventas", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerReporteVentas, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerReporteVentas) },
                    new MenuItem() { Name = "Balance", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerBalance, IsEnabled = loggedUser.ContainsOperation((int)OperationsEnum.VerBalance) },
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
                switch ((OperationsEnum)operationId)
                {
                    case OperationsEnum.VerUsuarios:
                        ConfigureEntitie.Users.GetAll(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerAplicaciones:
                        ConfigureEntitie.Application.GetCatalog(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerPerfiles:
                        ConfigureEntitie.Profiles.GetProfilesCatalog(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerOperaciones:
                        ConfigureEntitie.Operations.GetOperationsCatalog(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerPlantillasdeAcceso:
                        ConfigureEntitie.AccessTemplates.GetAccessTemplatesCatalog(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerGastos:
                        ConfigureEntitie.Expenses.GetExpensesCatalog(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerTipoGasto:
                        ConfigureEntitie.ExpensesTypes.GetExpensesTypesCatalog(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerCompras:
                        ConfigureEntitie.Purchases.GetCatalog(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerProductos:
                        ConfigureEntitie.Products.GetProductsCatalog(ref model, operationId, ref errorMessage);
                        break;
                    default:
                        errorMessage = "Modulo no implementado en Configure.LoadViewCatalog: " + ((OperationsEnum)operationId).ToString("g");
                        break;
                };
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
                switch ((OperationsEnum)operationId)
                {
                    case OperationsEnum.NuevaAplicación:
                    case OperationsEnum.EditarAplicaciones:
                        ConfigureEntitie.Application.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoUsuario:
                    case OperationsEnum.EditarUsuarios:
                        ConfigureEntitie.Users.Get(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoPerfil:
                    case OperationsEnum.EditarPerfiles:
                        ConfigureEntitie.Profiles.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaOperación:
                    case OperationsEnum.EditarOperaciones:
                        ConfigureEntitie.Operations.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaPlantilladeAcceso:
                    case OperationsEnum.EditarPlantillasdeAcceso:
                        ConfigureEntitie.AccessTemplates.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoGasto:
                    case OperationsEnum.EditarGasto:
                        ConfigureEntitie.Expenses.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarTipoGasto:
                    case OperationsEnum.NuevoTipoGasto:
                        ConfigureEntitie.ExpensesTypes.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaCompra:
                    case OperationsEnum.EditarCompra:
                        ConfigureEntitie.Purchases.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaVenta:
                    case OperationsEnum.EditarVenta:
                        ConfigureEntitie.Sales.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoProducto:
                    case OperationsEnum.EditarProducto:
                        ConfigureEntitie.Products.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    default:
                        errorMessage = "Modulo no implementado en Configure.LoadItemData: " + ((OperationsEnum)operationId).ToString("g");
                        break;
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
                switch ((OperationsEnum)operationId)
                {
                    case OperationsEnum.AsignarPerfilaUsuario:
                        ConfigureEntitie.Users.GetProfiles(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.AsignarOperaciónaPerfil:
                        ConfigureEntitie.Profiles.GetOperations(ref model, operationId, itemId, ref errorMessage);
                        break;
                    default:
                        errorMessage = "Modulo no implementado en Configure.LoadRelationData: " + ((OperationsEnum)operationId).ToString("g");
                        break;
                }

            }
            catch (Exception e)
            {
                errorMessage = e.Message + (e.InnerException == null ? "" : e.InnerException.Message);
            }
        }

        //PASO #4: Configurar los campos que se guardarán al crear o modificar
        /// <summary>
        /// Método para guardar la información de un elemento
        /// </summary>
        public static bool SaveItem(ItemViewModel model, ref string errorMessage, int userId)
        {
            try
            {
                bool result = false;

                switch ((OperationsEnum)model.OperationIdAction)
                {
                    case OperationsEnum.EditarUsuarios:
                        result = ConfigureEntitie.Users.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoUsuario:
                        result = ConfigureEntitie.Users.New(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarAplicaciones:
                        result = ConfigureEntitie.Application.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaAplicación:
                        result = ConfigureEntitie.Application.New(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoPerfil:
                        result = ConfigureEntitie.Profiles.New(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarPerfiles:
                        result = ConfigureEntitie.Profiles.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaOperación:
                        result = ConfigureEntitie.Operations.New(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoGasto:
                        result = ConfigureEntitie.Expenses.New(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoTipoGasto:
                        result = ConfigureEntitie.ExpensesTypes.New(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarTipoGasto:
                        result = ConfigureEntitie.ExpensesTypes.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarGasto:
                        result = ConfigureEntitie.Expenses.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaCompra:
                        result = ConfigureEntitie.Purchases.New(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaVenta:
                        result = ConfigureEntitie.Sales.New(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoProducto:
                        result = ConfigureEntitie.Products.New(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarProducto:
                        result = ConfigureEntitie.Products.Edit(model, userId, ref errorMessage);
                        break;
                    default:
                        errorMessage = "Modulo no implementado en Configure.SaveItem: " + ((OperationsEnum)model.OperationIdAction).ToString("g");
                        break;
                }
                return result;
            }
            catch (Exception e)
            {
                if (e.Message.Contains("See the inner exception for details."))
                    errorMessage = e.InnerException.Message;
                else
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

                switch ((OperationsEnum)model.OperationIdAction)
                {
                    case OperationsEnum.AsignarPerfilaUsuario:
                        result = ConfigureEntitie.Users.SetProfiles(model, ref errorMessage);
                        break;
                    case OperationsEnum.AsignarOperaciónaPerfil:
                        result = ConfigureEntitie.Profiles.SetOperations(model, ref errorMessage);
                        break;
                    default:
                        errorMessage = "Modulo no implementado en Configure.SaveRelation: " + ((OperationsEnum)model.OperationIdAction).ToString("g");
                        break;
                }
                return result;
            }
            catch (Exception e)
            {
                errorMessage = e.Message;
                return false;
            }
        }

        //PASO #2c: Configurar las columnas y filtros que se mostrarán en el reporte
        /// <summary>
        /// Método para cargar la información de un catálogo según la operación
        /// </summary>
        public static void LoadDataReport(ref ReportViewModel model, int operationId, ref string errorMessage, bool applyFilters)
        {
            try
            {
                switch ((OperationsEnum)operationId)
                {
                    case OperationsEnum.VerReporteGastos:
                        ConfigureEntitie.Expenses.GetReport(ref model, operationId, applyFilters, ref errorMessage);
                        break;
                    case OperationsEnum.VerReporteCompras:
                        ConfigureEntitie.Purchases.GetReport(ref model, operationId, applyFilters, ref errorMessage);
                        break;
                    case OperationsEnum.VerReporteVentas:
                        ConfigureEntitie.Sales.GetReport(ref model, operationId, applyFilters, ref errorMessage);
                        break;
                    case OperationsEnum.VerBalance:
                        ConfigureEntitie.Balance.GetReport(ref model, operationId, applyFilters, ref errorMessage);
                        break;
                    default:
                        errorMessage = "Modulo no implementado en Configure.LoadViewCatalog: " + ((OperationsEnum)operationId).ToString("g");
                        break;
                };
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
            }
        }




    }
}