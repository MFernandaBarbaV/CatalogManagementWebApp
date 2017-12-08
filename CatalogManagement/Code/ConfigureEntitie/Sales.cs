using System;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.Models.Entities;
using System.Collections.Generic;
using CatalogManagement.DBModels;
using System.Linq;

namespace CatalogManagement.Code.ConfigureEntitie
{
    internal class Sales : Base
    {
        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                Venta result = null;

                Dictionary<int, string> clientes = new Dictionary<int, string>();
                clientes.Add(0, "--Seleccionar--");
                foreach (var item in db2.Clientes)
                {
                    clientes.Add(item.IdCliente, item.NombreCliente);
                }

                if (itemId == 0)//Nuevo
                {
                    result = new Venta();
                    result.FechaVenta = DateTime.Now;

                    model.SetAttributes(itemId, "Nueva Venta", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerReporteVentas);

                }
                else // Editar
                {
                    result = db2.Venta.Where(us => us.IdVenta == itemId).FirstOrDefault();
                    model.SetAttributes(itemId, "Editar Venta", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerReporteVentas);
                }

                if (result != null)
                {
                    model.Properties = new List<Propertie>();

                    model.Properties.Add(new Propertie() { Id = "Fecha", Label = "Fecha", DateValue = DateTime.Now, Type = PropertieType.Date });
                    model.Properties.Add(new Propertie() { Id = "Cliente", Label = "Cliente", MultipleValues = clientes, Type = PropertieType.ComboBox, ObjectValue = new KeyValuePair<int, string>(result.IdCliente, clientes[result.IdCliente]) });
                    model.Properties.Add(new Propertie() { Id = "Venta", Label = "Venta", DecimalValue = result.Total, Type = PropertieType.Money, ClassIcon = faIconss.money });
                }

            }
        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage, out int id)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                param = new System.Data.Entity.Core.Objects.ObjectParameter("idVenta", typeof(int));

                var venta = new Venta()
                {
                    FechaVenta = model.GetValuePropertieDateTime("Fecha"),
                    IdCliente = model.GetValuePropertieInteger("Cliente"),
                    Total = model.GetValuePropertieDecimal("Venta")
                };

                var resultVentaAgregar = db2.VentaAgregar(venta.IdCliente, userId, 0, false, venta.Total, false, venta.FechaVenta, param);
                id = resultVentaAgregar.First().Value;
                db2.SaveChanges();
                return true;
            }


        }

        internal static void GetReport(ref ReportViewModel model, int operationId, bool applyFilters, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                #region Ver Reporte de Ventas
                model.SetAttributes("Ventas", "Ver", "ViewReport", "Catalog", (OperationsEnum)operationId, (OperationsEnum)operationId);
                if (applyFilters)
                {
                    decimal total = 0;
                    model.Rows = new List<Row>();

                    DateTime minDate = model.Filters[0].DateValue.Date;
                    DateTime maxDate = model.Filters[1].DateValue.Date;
                    List<int> clientess = (model.Filters[2].selectedMultipleValues == null) ? new List<int>() : model.Filters[2].selectedMultipleValues.Where(t => t != 0).ToList();
                    List<int> vendedores = (model.Filters[3].selectedMultipleValues == null) ? new List<int>() : model.Filters[3].selectedMultipleValues.Where(t => t != 0).ToList();

                    foreach (var item in db2.Venta.Where(g => g.FechaVenta >= minDate && g.FechaVenta <= maxDate
                        && (clientess.Contains(g.IdCliente) || clientess.Count == 0) && (vendedores.Contains(g.IdOperador) || vendedores.Count == 0)))

                    {
                        row = new Row();
                        row.Columns = new List<Column>();
                        row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.FechaVenta.ToString("dd MMMM yyyy hh:mm tt"), ID = item.IdVenta.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Cliente", Value = item.Clientes.NombreCliente, ID = item.IdVenta.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Vendedor", Value = item.Operador.Nombre, ID = item.IdVenta.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Venta", Value = item.Total.ToString("c2"), ID = item.IdVenta.ToString() });

                        model.Rows.Add(row);

                        total += item.Total;
                    }
                    model.Totales = new List<Row>();
                    model.Totales.Add(new Row());
                    model.Totales[0].Columns = new List<Column>();
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Fecha", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Cliente", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Vendedor", Value = "Total:" });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Venta", Value = total.ToString("c2"), });
                }

                Dictionary<int, string> clientes = new Dictionary<int, string>();
                clientes.Add(0, "-Todos-");
                foreach (var item in db2.Clientes)
                {
                    clientes.Add(item.IdCliente, item.NombreCliente);
                }
                Dictionary<int, string> vendedoress = new Dictionary<int, string>();
                vendedoress.Add(0, "-Todos-");
                foreach (var item in db2.Operador)
                {
                    vendedoress.Add(item.IdOperador, item.Nombre);
                }

                model.Filters = new List<Filter>();
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaI", Description = "Fecha inicio:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1) });
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaF", Description = "Fecha fin:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month)) });
                model.Filters.Add(new Filter() { Type = FilterType.Combo, Id = "Cliente", Description = "Cliente:", MultipleValues = clientes });
                model.Filters.Add(new Filter() { Type = FilterType.Combo, Id = "Vendedor", Description = "Vendedor:", MultipleValues = vendedoress });

                #endregion
            }
        }
    }
}