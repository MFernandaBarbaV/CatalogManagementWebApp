using System;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.Models.Entities;
using System.Collections.Generic;
using CatalogManagement.DBModels;
using System.Linq;
using System.Data.Entity;

namespace CatalogManagement.Code.ConfigureEntitie
{
    internal class Purchases : Base
    {
        internal static void GetCatalog(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                #region Compras
                model.SetAttributes("Compras", (OperationsEnum)operationId);


                foreach (var item in db2.Compra.Where(c => DbFunctions.TruncateTime(c.FechaCompra) == DateTime.Now.Date))

                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.IdCompra.ToString(), ID = item.IdCompra.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "FechaCompra", Value = item.FechaCompra.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Total", Value = item.Total.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "", Value = item.IdCompra.ToString(), ID = item.IdCompra.ToString(), Type = ColumnType.Button, ButtonText = "Editar Compra", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonOperationId = (int)OperationsEnum.EditarCompra });
                    row.Columns.Add(new Column() { ColumnHeader = "", Value = item.IdCompra.ToString(), ID = item.IdCompra.ToString(), Type = ColumnType.Button, ButtonText = "Eliminar Compra", ButtonAction = "DeleteItem", ButtonController = "Catalog", ButtonOperationId = (int)OperationsEnum.EliminarCompra });

                    model.Rows.Add(row);
                }
                #endregion
            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                #region Compras
                {
                    Compra result = null;

                    Dictionary<int, string> proveedores = new Dictionary<int, string>();
                    proveedores.Add(0, "--Seleccionar--");
                    foreach (var item in db2.Proveedor)
                    {
                        proveedores.Add(item.IdProveedor, item.NombreProveedor);
                    }

                    Dictionary<int, string> productos = new Dictionary<int, string>();
                    productos.Add(0, "--Seleccionar--");
                    foreach (var item in db2.Producto)
                    {
                        productos.Add(item.IdProducto, item.Descripcion);
                    }

                    Dictionary<int, string> unidades = new Dictionary<int, string>();
                    unidades.Add(0, "--Seleccionar--");
                    foreach (var item in db2.Presentacion)
                    {
                        unidades.Add(item.IdPresentacion, item.Descripcion);
                    }

                    if (itemId == 0)//Nuevo
                    {
                        result = new Compra();
                        result.FechaCompra = DateTime.Now;
                        result.CompraDetalle = new List<CompraDetalle>();
                        result.CompraDetalle.Add(new CompraDetalle());
                        model.SetAttributes(itemId, "Nueva Compra", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerCompras);

                    }
                    else // Editar
                    {
                        result = db2.Compra.Where(us => us.IdCompra == itemId).FirstOrDefault();
                        model.SetAttributes(itemId, "Editar Compra", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerCompras);
                    }

                    if (result != null)
                    {
                        model.Properties = new List<Propertie>();

                        model.Properties.Add(new Propertie() { Id = "Fecha", Label = "Fecha", DateValue = result.FechaCompra, Type = PropertieType.Date, IsEnabled = false });

                        model.Properties.Add(new Propertie() { Id = "IdProveedor", Label = "Proveedor", MultipleValues = proveedores, Type = PropertieType.ComboBox, Value = result.IdProveedor.ToString() });

                        foreach (var detalle in result.CompraDetalle)
                        {
                            model.Properties.Add(new Propertie() { Id = "IdProducto", Type = PropertieType.ComboBox, MultipleValues = productos, Label = "Producto", Value = detalle.IdProducto.ToString(), });
                            model.Properties.Add(new Propertie() { Id = "IdPresentacion", Type = PropertieType.ComboBox, MultipleValues = unidades, Label = "Presentacion", Value = detalle.IdPresentacion.ToString() });
                            model.Properties.Add(new Propertie() { Id = "Cantidad", Type = PropertieType.TextBox, Label = "Cantidad", Value = detalle.Cantidad.ToString(), RegEx = Utils.RegexMoney });
                            model.Properties.Add(new Propertie() { Id = "CostoUnitario", Label = "Precio Unitario", Type = PropertieType.Money, ClassIcon = faIconss.money, DecimalValue = detalle.CostoUnitario, RegEx = Utils.RegexMoney });
                            //    model.Properties.Add(new Propertie() { Id = "CostoTotal", Label = "Precio Total", Type = PropertieType.Money, ClassIcon = faIconss.money, DecimalValue = detalle.CostoTotal });
                            //  model.Properties.Add(new Propertie() { Id = "PrecioVenta", Label = "Precio de Venta", Type = PropertieType.Money, ClassIcon = faIconss.money, DecimalValue = detalle.PrecioVenta });

                        }



                    }
                }
                #endregion
            }
        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage, out int id)
        {
            //using (var db2 = new CatalogManagementDBEntities())
            //{
            //    param = new System.Data.Entity.Core.Objects.ObjectParameter("idCompra", typeof(int));

            //    var compra = new Compra()
            //    {
            //        IdProveedor = model.GetValuePropertieInteger("IdProveedor"),
            //        FechaCompra = model.GetValuePropertieDateTime("Fecha"),
            //        Total = model.GetValuePropertieDecimal("CostoUnitario") * model.GetValuePropertieInteger("Cantidad"),
            //        IdOperador = 1
            //    };

            //    var resultCompraAgregar = db2.CompraAgregar(compra.IdProveedor, compra.IdOperador, compra.FechaCompra, compra.Total, param);

            //    var compraDetalle = new CompraDetalle()
            //    {
            //        IdCompra = (int)resultCompraAgregar.First(),
            //        IdUnidad = model.GetValuePropertieInteger("IdUnidad"),
            //        Cantidad = model.GetValuePropertieInteger("Cantidad"),
            //        CostoUnitario = model.GetValuePropertieDecimal("CostoUnitario"),
            //        CostoTotal = model.GetValuePropertieDecimal("CostoUnitario") * model.GetValuePropertieInteger("Cantidad"),
            //        PrecioVenta = 0,
            //        IdProducto = model.GetValuePropertieInteger("IdProducto")
            //    };

            //    db2.CompraDetalle.Add(compraDetalle);
            //    db2.SaveChanges();
            //    id = compraDetalle.IdCompra;
            //    return true;
            //}
            id = 0;
            
            return true;

        }

        internal static void GetReport(ref ReportViewModel model, int operationId, bool applyFilters, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                #region Ver Reporte de Compras
                model.SetAttributes("Compras", "Ver", "ViewReport", "Catalog", (OperationsEnum)operationId, (OperationsEnum)operationId);
                if (applyFilters)
                {
                    decimal total = 0;

                    model.Rows = new List<Row>();

                    DateTime minDate = model.Filters[0].DateValue.Date;
                    DateTime maxDate = model.Filters[1].DateValue.Date;
                    List<int> productoss = (model.Filters[2].selectedMultipleValues == null) ? new List<int>() : model.Filters[2].selectedMultipleValues.Where(t => t != 0).ToList();
                    List<int> proveedoress = (model.Filters[3].selectedMultipleValues == null) ? new List<int>() : model.Filters[3].selectedMultipleValues.Where(t => t != 0).ToList();

                    foreach (var item in db2.Compra.Where(g => g.FechaCompra >= minDate && g.FechaCompra <= maxDate && g.CompraDetalle.FirstOrDefault() != null
                    && (proveedoress.Contains(g.IdProveedor) || proveedoress.Count == 0) && (productoss.Contains(g.CompraDetalle.FirstOrDefault().IdProducto) || productoss.Count == 0)))
                    {
                        row = new Row();
                        row.Columns = new List<Column>();
                        row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.FechaCompra.ToString("dd MMMM yyyy hh:mm tt"), ID = item.IdCompra.ToString() });
                        //   row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.IdGasto.ToString(), ID = item.IdGasto.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Proveedor", Value = item.Proveedor.NombreProveedor.ToString(), ID = item.IdCompra.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Cantidad", Value = item.CompraDetalle.First().Cantidad.ToString(), ID = item.IdCompra.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Producto", Value = item.CompraDetalle.First().Producto.Descripcion, ID = item.IdCompra.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Precio", Value = item.Total.ToString("c2"), ID = item.IdCompra.ToString() });

                        model.Rows.Add(row);

                        total += item.Total;
                    }
                    model.Totales = new List<Row>();
                    model.Totales.Add(new Row());
                    model.Totales[0].Columns = new List<Column>();
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Fecha", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Proveedor", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Producto", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Cantidad", Value = "Total:" });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Precio", Value = total.ToString("c2"), });


                }


                Dictionary<int, string> productos = new Dictionary<int, string>();
                productos.Add(0, "-Todos-");
                foreach (var item in db2.Producto)
                {
                    productos.Add(item.IdProducto, item.Descripcion);
                }
                Dictionary<int, string> proveeores = new Dictionary<int, string>();
                proveeores.Add(0, "-Todos-");
                foreach (var item in db2.Proveedor)
                {
                    proveeores.Add(item.IdProveedor, item.NombreProveedor);
                }

                model.Filters = new List<Filter>();
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaI", Description = "Fecha inicio:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1) });
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaF", Description = "Fecha fin:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month)) });
                model.Filters.Add(new Filter() { Type = FilterType.Combo, Id = "Producto", Description = "Producto:", MultipleValues = productos });
                model.Filters.Add(new Filter() { Type = FilterType.Combo, Id = "Proveedor", Description = "Proveedor:", MultipleValues = proveeores });
                #endregion
            }
        }

    }
}