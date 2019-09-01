using System;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.Models.Entities;
using System.Collections.Generic;
using CatalogManagement.DBModels;
using System.Linq;
using System.Data.Entity;

namespace CatalogManagement.Code.ConfigureEntitie
{
    internal class Balance : Base
    {
        internal static void GetReport(ref ReportViewModel model, int operationId, bool applyFilters, ref string errorMessage)
        {
            using (var db = new SUPERTICKETEntities())
            using (var db2 = new CatalogManagementDBEntities())
            {
                model.SetAttributes("Balance", "Ver", "ViewReport", "Catalog", (OperationsEnum)operationId, (OperationsEnum)operationId);
                if (applyFilters)
                {
                    decimal totalEntrada = 0, totalSalida = 0;

                    model.Rows = new List<Row>();

                    DateTime minDate = model.Filters[0].DateValue.Date;
                    DateTime maxDate = model.Filters[1].DateValue.Date;

                    foreach (var item2 in db.doc_general.Where(g => g.fecha >= minDate && g.fecha <= maxDate && g.TOTAL > 0 && g.tipodocto == "TICKET")
                          .GroupBy(p => DbFunctions.TruncateTime(p.fecha.Value)).Select(p =>
                           new
                           {
                               fecha = p.Key,
                               Venta = p.Sum(i => i.TOTAL),
                               tickets = p.Count(),
                               id = p.FirstOrDefault().idinterno,
                               folio = p.FirstOrDefault().FOLIO
                           }))
                    {
                       
                        row = new Row();
                        row.Columns = new List<Column>();
                        row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item2.fecha.Value.ToString("dd MMMM yyyy hh:mm tt"), ID = item2.id.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Concepto", Value = "Venta", ID = item2.id });
                        row.Columns.Add(new Column() { ColumnHeader = "Detalles", Value = $"{item2.tickets} tickets" , ID = item2.id.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Entrada", Value = item2.Venta.Value.ToString("c2"), ID = item2.id.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Salida", Value = 0.ToString("c2"), ID = item2.id.ToString() });

                        model.Rows.Add(row);
                        totalEntrada += item2.Venta.Value;

                    }

                    foreach (var item in db2.Gastos.Where(g => g.Fecha >= minDate && g.Fecha <= maxDate))
                    {
                        row = new Row();
                        row.Columns = new List<Column>();
                        row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.Fecha.ToString("dd MMMM yyyy hh:mm tt"), ID = item.IdGasto.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Concepto", Value = "Gasto", ID = item.IdGasto.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Detalles", Value = item.Descripcion, ID = item.IdGasto.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Entrada", Value = 0.ToString("c2"), ID = item.IdGasto.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Salida", Value = item.Cantidad.ToString("c2"), ID = item.IdGasto.ToString() });

                        model.Rows.Add(row);
                        totalSalida += item.Cantidad;
                    }

                    foreach (var item in db2.Compra.Where(g => g.FechaCompra >= minDate && g.FechaCompra <= maxDate))
                    {
                        row = new Row();
                        row.Columns = new List<Column>();
                        row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.FechaCompra.ToString("dd MMMM yyyy hh:mm tt"), ID = item.IdCompra.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Concepto", Value = "Compra", ID = item.IdCompra.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Detalles", Value = item.CompraDetalle.FirstOrDefault().Producto.Descripcion, ID = item.IdCompra.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Entrada", Value = 0.ToString("c2"), ID = item.IdCompra.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Salida", Value = item.Total.ToString("c2"), ID = item.IdCompra.ToString() });

                        model.Rows.Add(row);
                        totalSalida += item.Total;
                    }

                    model.Rows = model.Rows.OrderBy(i => i.Columns.FirstOrDefault().Value).ToList();

                    model.Totales = new List<Row>();
                    model.Totales.Add(new Row());
                    model.Totales[0].Columns = new List<Column>();
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Fecha", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Concepto", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Detalles", Value = "Totales" });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Entrada", Value = totalEntrada.ToString("c2") });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Salida", Value = totalSalida.ToString("c2"), });

                    model.Totales.Add(new Row());
                    model.Totales[1].Columns = new List<Column>();
                    model.Totales[1].Columns.Add(new Column() { ColumnHeader = "Fecha", Value = string.Empty });
                    model.Totales[1].Columns.Add(new Column() { ColumnHeader = "Concepto", Value = string.Empty });
                    model.Totales[1].Columns.Add(new Column() { ColumnHeader = "Detalles", Value = "DIFERENCIA:" });
                    model.Totales[1].Columns.Add(new Column() { ColumnHeader = "Ingresos", Value = (((totalEntrada - totalSalida) > 0) ? (totalEntrada - totalSalida).ToString("c2") : String.Empty) });
                    model.Totales[1].Columns.Add(new Column() { ColumnHeader = "Egresos", Value = (((totalEntrada - totalSalida) < 0) ? (totalEntrada - totalSalida).ToString("c2") : String.Empty) });
                }

                model.Filters = new List<Filter>();
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaI", Description = "Fecha inicio:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1) });
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaF", Description = "Fecha fin:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month)) });
            }
        }
    }
}