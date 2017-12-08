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

            model.ItemsInMenu.Add(
                new MenuItem()
                {
                    Name = "Sesión",
                    Span = faIconss.user,
                    IsDropBox = true,
                    InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Cerrar sesión" , Controller = "Account", Action = "Logout" },
               }
                });

            model.ItemsInMenu.Add(
                new MenuItem()
                {
                    Name = "Operaciones",
                    Span = faIconss.application,
                    IsDropBox = true,
                    InnerItems = new List<MenuItem>()
                      {
                    new MenuItem() { Name = "Operaciones", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerOperaciones, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerOperaciones) },

                      }
                });
            model.ItemsInMenu.Add(
                new MenuItem()
                {
                    Name = "Usuarios",
                    Span = faIconss.user,
                    IsDropBox = true,
                    InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Usuarios", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerUsuarios, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerUsuarios) },
                }
                });
            model.ItemsInMenu.Add(
                new MenuItem()
                {
                    Name = "Catalogos",
                    Span = faIconss.bookmark,
                    IsDropBox = true,
                    InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Productos", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerProductos, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerProductos) },
                    new MenuItem() { Name = "Proveedores", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerProveedores, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerProductos) },
                    new MenuItem() { Name = "Clientes", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerClientes, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerProductos) },
                    new MenuItem() { Name = "Marcas", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerMarcas, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerProductos) },
                    new MenuItem() { Name = "Tipo de producto", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerTipoProducto, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerProductos) },
                    new MenuItem() { Name = "Tallas", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerTallas, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerProductos) },

                }
                });
            model.ItemsInMenu.Add(
                new MenuItem()
                {
                    Name = "Gastos",
                    Span = faIconss.shopping,
                    IsDropBox = true,
                    InnerItems = new List<MenuItem>()
                {
                  new MenuItem() { Name = "Nuevo Gasto", Controller = "Catalog", Action = "NewItem", OperationId = (int)OperationsEnum.NuevoGasto, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.NuevoGasto) },
                  new MenuItem() { Name = "Tipo de Gasto", Controller = "Catalog", Action = "ViewCatalog", OperationId = (int)OperationsEnum.VerTipoGasto, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerTipoGasto) },
                  new MenuItem() { Name = "Nueva Compra", Controller = "Catalog", Action = "NewItem", OperationId = (int)OperationsEnum.NuevaCompra, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.NuevaCompra) },

                }
                });
            model.ItemsInMenu.Add(
                new MenuItem()
                {
                    Name = "Ventas",
                    Span = faIconss.money,
                    IsDropBox = true,
                    InnerItems = new List<MenuItem>()
                {
                   new MenuItem() { Name = "Nueva Venta", Controller = "Catalog", Action = "NewItem", OperationId = (int)OperationsEnum.NuevaVenta, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.NuevaVenta) },

                }
                });
            model.ItemsInMenu.Add(
                new MenuItem()
                {
                    Name = "Reportes",
                    Span = faIconss.filter,
                    IsDropBox = true,
                    InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Reporte de Gastos", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerReporteGastos, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerReporteGastos) },
                    new MenuItem() { Name = "Reporte de Compras", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerReporteCompras, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerReporteCompras) },
                    new MenuItem() { Name = "Reporte de Ventas", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerReporteVentas, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerReporteVentas) },
                    new MenuItem() { Name = "Balance", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerBalance, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerBalance) },
                }

                });
            model.ItemsInMenu.Add(
                new MenuItem()
                {
                    Name = "SUPERTICKET",
                    Span = faIconss.filter,
                    IsDropBox = true,
                    InnerItems = new List<MenuItem>()
                {
                    new MenuItem() { Name = "Tickets", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerReporteVentasSUPERTICKET, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerReporteVentasSUPERTICKET) },
                    new MenuItem() { Name = "Ganancia por ticket", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerReporteGananciaTicketSUPERTICKET, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerReporteGananciaTicketSUPERTICKET) },
                    new MenuItem() { Name = "Ganancia por producto", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerReporteGananciaProductoSUPERTICKET, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerReporteGananciaProductoSUPERTICKET) },
                   new MenuItem() { Name = "Reporte mensual", Controller = "Catalog", Action = "ViewFilterReport", OperationId = (int)OperationsEnum.VerReporteVentasMesSUPERTICKET, IsVisible = loggedUser.ContainsOperation((int)OperationsEnum.VerReporteVentasMesSUPERTICKET) },

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

                    case OperationsEnum.VerOperaciones:
                        ConfigureEntitie.Operations.GetOperationsCatalog(ref model, operationId, ref errorMessage);
                        break;
                    //case OperationsEnum.VerGastos:
                    //    ConfigureEntitie.Expenses.GetExpensesCatalog(ref model, operationId, ref errorMessage);
                    //    break;
                    case OperationsEnum.VerTipoGasto:
                        ConfigureEntitie.ExpensesTypes.GetExpensesTypesCatalog(ref model, operationId, ref errorMessage);
                        break;
                    //case OperationsEnum.VerCompras:
                    //    ConfigureEntitie.Purchases.GetCatalog(ref model, operationId, ref errorMessage);
                    //    break;
                    case OperationsEnum.VerProductos:
                        ConfigureEntitie.Products.GetProductsCatalog(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerProveedores:
                        ConfigureEntitie.Providers.GetAll(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerClientes:
                        ConfigureEntitie.Clients.GetAll(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerMarcas:
                        ConfigureEntitie.Brands.GetAll(ref model, operationId, ref errorMessage);
                        break;
                    case OperationsEnum.VerTipoProducto:
                        ConfigureEntitie.ProductTypes.GetAll(ref model, operationId, ref errorMessage);
                        break;

                    default:
                     //   errorMessage = "Modulo no implementado en Configure.LoadViewCatalog: " + ((OperationsEnum)operationId).ToString("g");
                        break;
                };
            }
            catch (Exception e)
            {
                if (e.Message.Contains("See the inner exception for details."))
                    errorMessage = e.InnerException.Message;
                else
                    errorMessage = e.Message + e.StackTrace;

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

                    case OperationsEnum.NuevoUsuario:
                    case OperationsEnum.EditarUsuarios:
                        ConfigureEntitie.Users.Get(ref model, operationId, itemId, ref errorMessage);
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
                        ConfigureEntitie.Purchases.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaVenta:
                        ConfigureEntitie.Sales.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoProducto:
                    case OperationsEnum.EditarProducto:
                        ConfigureEntitie.Products.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarProveedor:
                    case OperationsEnum.NuevoProveedor:
                        ConfigureEntitie.Providers.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarCliente:
                    case OperationsEnum.NuevoCliente:
                        ConfigureEntitie.Clients.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarMarca:
                    case OperationsEnum.NuevaMarca:
                        ConfigureEntitie.Brands.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarTipoProducto:
                    case OperationsEnum.NuevoTipoProducto:
                        ConfigureEntitie.ProductTypes.GetData(ref model, operationId, itemId, ref errorMessage);
                        break;
                    default:
                        errorMessage = "Modulo no implementado en Configure.LoadItemData: " + ((OperationsEnum)operationId).ToString("g");
                        break;
                }
            }
            catch (Exception e)
            {
                if (e.Message.Contains("See the inner exception for details."))
                    errorMessage = e.InnerException.Message;
                else
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
                    case OperationsEnum.AsignarOperaciónaUsuario:
                        ConfigureEntitie.Users.GetOperations(ref model, operationId, itemId, ref errorMessage);
                        break;

                    default:
                        errorMessage = "Modulo no implementado en Configure.LoadRelationData: " + ((OperationsEnum)operationId).ToString("g");
                        break;
                }

            }
            catch (Exception e)
            {
                if (e.Message.Contains("See the inner exception for details."))
                    errorMessage = e.InnerException.Message;
                else
                    errorMessage = e.Message + (e.InnerException == null ? "" : e.InnerException.Message);

            }
        }

        //PASO #4: Configurar los campos que se guardarán al crear o modificar
        /// <summary>
        /// Método para guardar la información de un elemento
        /// </summary>
        public static bool SaveItem(ref ItemViewModel model, ref string errorMessage, int userId)
        {
            try
            {
                int id = model.ItemId;
                bool result = false;

                switch ((OperationsEnum)model.OperationIdAction)
                {
                    case OperationsEnum.EditarUsuarios:
                        result = ConfigureEntitie.Users.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoUsuario:
                        result = ConfigureEntitie.Users.New(model, userId, ref errorMessage, out id);
                        break;
                    case OperationsEnum.NuevoGasto:
                        result = ConfigureEntitie.Expenses.New(model, userId, ref errorMessage, out id);
                        break;
                    case OperationsEnum.NuevoTipoGasto:
                        result = ConfigureEntitie.ExpensesTypes.New(model, userId, ref errorMessage, out id);
                        break;
                    case OperationsEnum.EditarTipoGasto:
                        result = ConfigureEntitie.ExpensesTypes.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarGasto:
                        result = ConfigureEntitie.Expenses.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaCompra:
                        result = ConfigureEntitie.Purchases.New(model, userId, ref errorMessage, out id);
                        break;

                    case OperationsEnum.NuevaVenta:
                        result = ConfigureEntitie.Sales.New(model, userId, ref errorMessage, out id);
                        break;
                    case OperationsEnum.NuevoProducto:
                        result = ConfigureEntitie.Products.New(model, userId, ref errorMessage, out id);
                        break;
                    case OperationsEnum.EditarProducto:
                        result = ConfigureEntitie.Products.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoProveedor:
                        result = ConfigureEntitie.Providers.New(model, userId, ref errorMessage, out id);
                        break;
                    case OperationsEnum.EditarProveedor:
                        result = ConfigureEntitie.Providers.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.EditarCliente:
                        result = ConfigureEntitie.Clients.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoCliente:
                        result = ConfigureEntitie.Clients.New(model, userId, ref errorMessage, out id);
                        break;
                    case OperationsEnum.EditarMarca:
                        result = ConfigureEntitie.Brands.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevaMarca:
                        result = ConfigureEntitie.Brands.New(model, userId, ref errorMessage, out id);
                        break;
                    case OperationsEnum.EditarTipoProducto:
                        result = ConfigureEntitie.ProductTypes.Edit(model, userId, ref errorMessage);
                        break;
                    case OperationsEnum.NuevoTipoProducto:
                        result = ConfigureEntitie.ProductTypes.New(model, userId, ref errorMessage, out id);
                        break;
                    default:
                        errorMessage = "Modulo no implementado en Configure.SaveItem: " + ((OperationsEnum)model.OperationIdAction).ToString("g");
                        break;
                }
                model.ItemId = id;
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
                    case OperationsEnum.AsignarOperaciónaUsuario:
                        result = ConfigureEntitie.Users.SetOperations(model, ref errorMessage);
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
        public static bool LoadDataReport(ref ReportViewModel model, int operationId, ref string errorMessage, bool applyFilters)
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
                    case OperationsEnum.VerReporteVentasSUPERTICKET:
                        ConfigureEntitie.SUPERTICKETData.GetTicketsReport(ref model, operationId, applyFilters, ref errorMessage);
                        break;
                    case OperationsEnum.VerReporteGananciaTicketSUPERTICKET:
                        ConfigureEntitie.SUPERTICKETData.GetGainReport(ref model, operationId, applyFilters, ref errorMessage);
                        break;
                    case OperationsEnum.VerReporteGananciaProductoSUPERTICKET:
                        ConfigureEntitie.SUPERTICKETData.GetProductsReport(ref model, operationId, applyFilters, ref errorMessage);
                        break;
                    case OperationsEnum.VerReporteVentasMesSUPERTICKET:
                        ConfigureEntitie.SUPERTICKETData.GetTicketsInMonthReport(ref model, operationId, applyFilters, ref errorMessage);
                        break;
                    default:
                        errorMessage = "Modulo no implementado en Configure.LoadDataReport: " + ((OperationsEnum)operationId).ToString("g");
                        break;
                };
                return true;
            }
            catch (Exception e)
            {
                errorMessage = e.Message + " " + (e.InnerException == null ? string.Empty : e.InnerException.Message) + " " + e.StackTrace;
                return false;
            }
        }




    }
}