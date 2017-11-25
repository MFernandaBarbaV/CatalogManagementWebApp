using CatalogManagement.DBModels;
using CatalogManagement.Models.Entities;
using CatalogManagement.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Linq;
using System.Web;

namespace CatalogManagement.Code.ConfigureEntitie
{
    public class SUPERTICKETData : Base
    {
        /// <summary>
        /// Tickets por fecha, tipo de pago y vendedor para mostrar ventas
        /// </summary>
        internal static void GetTicketsReport(ref ReportViewModel model, int operationId, bool applyFilters, ref string errorMessage)
        {
            using (var db2 = new SUPERTICKETEntities())
            {
               
                Dictionary<string, string> clientes = new Dictionary<string, string>();
                clientes.Add("", "-Todos-");
                foreach (var item in db2.clientesSUPERTICKET)
                {
                    clientes.Add(item.idinterno, item.nombre);
                }

                Dictionary<string, string> personal = new Dictionary<string, string>();
                personal.Add("", "-Todos-");
                foreach (var item in db2.personal)
                {
                    personal.Add(item.idinterno, item.nombre);
                }

                Dictionary<string, string> pago = new Dictionary<string, string>();
                pago.Add("", "-Todos-");
                foreach (var item in db2.formas_pago.Where(p => p.tipo == 1))
                {
                    pago.Add(item.idinterno, item.descripcion);
                }

                model.SetAttributes("Tickets", "Ver", "ViewReport", "Catalog", (OperationsEnum)operationId, (OperationsEnum)operationId);
                if (applyFilters)
                {
                    decimal total = 0;
                    int count = 0;
                    model.Rows = new List<Row>();

                    DateTime minDate = new DateTime(model.Filters[0].DateValue.Date.Year, model.Filters[0].DateValue.Date.Month, model.Filters[0].DateValue.Date.Day);
                    DateTime maxDate = new DateTime(model.Filters[1].DateValue.Date.Year, model.Filters[1].DateValue.Date.Month, model.Filters[1].DateValue.Date.Day, 23, 59, 59);
                    List<string> formaPago = (model.Filters[2].selectedMultipleValues2 == null) ? new List<string>() : model.Filters[2].selectedMultipleValues2.Where(t => t != string.Empty).ToList();
                    List<string> vendedores = (model.Filters[3].selectedMultipleValues2 == null) ? new List<string>() : model.Filters[3].selectedMultipleValues2.Where(t => t != string.Empty).ToList();


                    foreach (var item in db2.doc_general.Where(g => g.fecha >= minDate && g.fecha <= maxDate && g.TOTAL > 0 && g.tipodocto == "TICKET"
                         && (vendedores.Contains(g.idvendedor) || vendedores.Count == 0)))
                    {

                        var tipoPago = db2.doc_pagos.Where(p => p.iddocto == item.idinterno && p.valor > 0).FirstOrDefault();

                        if (formaPago != null && tipoPago != null && formaPago.Count != 0 && !formaPago.Contains(tipoPago.idformapago))
                        {
                            continue;
                        }


                        string cliente = string.IsNullOrEmpty(item.idcliente.Trim()) ? string.Empty : clientes.ContainsKey(item.idcliente) ? clientes[item.idcliente] : string.Empty;
                        string vendedor = string.IsNullOrEmpty(item.idvendedor.Trim()) ? string.Empty : personal.ContainsKey(item.idvendedor) ? personal[item.idvendedor] : string.Empty;
                        row = new Row();
                        row.Columns = new List<Column>();
                        row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.idreg.ToString(), ID = item.idinterno.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.fecha.Value.ToString("dd MMMM yyyy hh:mm tt"), ID = item.idinterno.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Folio", Value = item.FOLIO.ToString(), ID = item.idinterno.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Vendedor", Value = vendedor, ID = item.idinterno.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Cliente", Value = cliente, ID = item.idinterno.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Tipo de Pago", Value = tipoPago == null ? "-" : tipoPago.descripcion, ID = item.idinterno.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Venta", Value = string.Format("{0:C}", item.TOTAL), ID = item.idinterno.ToString() });

                        model.Rows.Add(row);

                        total += item.TOTAL.Value;
                        count++;
                    }
                    model.Totales = new List<Row>();
                    model.Totales.Add(new Row());
                    model.Totales[0].Columns = new List<Column>();
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Id", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Fecha", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Folio", Value = "Tickets:" });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Vendedor", Value = String.Format("{0:n0}", count) });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Cliente", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Pago", Value = "Total:" });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Venta", Value = total.ToString("c2"), });


                }


                model.Filters = new List<Filter>();
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaI", Description = "Fecha inicio:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0) });
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaF", Description = "Fecha fin:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 23, 59, 59) });
                model.Filters.Add(new Filter() { Type = FilterType.Combo2, Id = "Pago", Description = "Forma de Pago:", MultipleValues2 = pago });
                model.Filters.Add(new Filter() { Type = FilterType.Combo2, Id = "Vendedor", Description = "Vendedor:", MultipleValues2 = personal });


            }
        }

        /// <summary>
        /// Tickets por fecha para mostrar ganancia
        /// </summary>
        internal static void GetGainReport(ref ReportViewModel model, int operationId, bool applyFilters, ref string errorMessage)
        {
            using (var db2 = new SUPERTICKETEntities())
            {

                model.SetAttributes("Ganancias por ticket", "Ver", "ViewReport", "Catalog", (OperationsEnum)operationId, (OperationsEnum)operationId);
                if (applyFilters)
                {
                    decimal total = 0;
                    int count = 0;
                    decimal totalUtilidad = 0;
                    model.Rows = new List<Row>();

                    DateTime minDate = new DateTime(model.Filters[0].DateValue.Date.Year, model.Filters[0].DateValue.Date.Month, model.Filters[0].DateValue.Date.Day);
                    DateTime maxDate = new DateTime(model.Filters[1].DateValue.Date.Year, model.Filters[1].DateValue.Date.Month, model.Filters[1].DateValue.Date.Day, 23, 59, 59);

                    foreach (var item in db2.doc_general.Where(g => g.fecha >= minDate && g.fecha <= maxDate && g.TOTAL > 0 && g.tipodocto == "TICKET"))
                    {

                        decimal utilidad = 0;

                        foreach (var detail in db2.doc_detalle.Where(d => d.folio == item.FOLIO))
                        {
                            decimal utilidadTemp = (detail.precio.Value - detail.costo.Value) * detail.cantidad.Value;
                            utilidad += utilidadTemp;
                        }

                        row = new Row();
                        row.Columns = new List<Column>();
                        row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.idreg.ToString(), ID = item.idinterno.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.fecha.Value.ToString("dd MMMM yyyy hh:mm tt"), ID = item.idinterno.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Folio", Value = item.FOLIO.ToString(), ID = item.idinterno.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Utilidad", Value = string.Format("{0:C}", utilidad), ID = item.idinterno.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Venta", Value = string.Format("{0:C}", item.TOTAL), ID = item.idinterno.ToString() });

                        model.Rows.Add(row);
                        total += item.TOTAL.Value;
                        count++;
                        totalUtilidad += utilidad;
                    }
                    model.Totales = new List<Row>();
                    model.Totales.Add(new Row());
                    model.Totales[0].Columns = new List<Column>();
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Id", Value = "Tickets:" });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Fecha", Value = String.Format("{0:n0}", count) });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Folio", Value = "Total:" });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Utilidad", Value = totalUtilidad.ToString("c2") });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Venta", Value = total.ToString("c2"), });
                }
                model.Filters = new List<Filter>();
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaI", Description = "Fecha inicio:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0) });
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaF", Description = "Fecha fin:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 23, 59, 59) });

            }
        }

        /// <summary>
        /// Listado de cantidad de productos vendidos por fecha y producto para mostrar ganancia
        /// </summary>
        internal static void GetProductsReport(ref ReportViewModel model, int operationId, bool applyFilters, ref string errorMessage)
        {
            using (var db2 = new SUPERTICKETEntities())
            {

                model.SetAttributes("Ganancias por producto", "Ver", "ViewReport", "Catalog", (OperationsEnum)operationId, (OperationsEnum)operationId);
                if (applyFilters)
                {
                    decimal totalInversion = 0;
                    decimal count = 0;
                    decimal totalUtilidad = 0;
                    decimal totalVenta = 0;
                    model.Rows = new List<Row>();

                    DateTime minDate = new DateTime(model.Filters[0].DateValue.Date.Year, model.Filters[0].DateValue.Date.Month, model.Filters[0].DateValue.Date.Day);
                    DateTime maxDate = new DateTime(model.Filters[1].DateValue.Date.Year, model.Filters[1].DateValue.Date.Month, model.Filters[1].DateValue.Date.Day, 23, 59, 59);

                    foreach (var item in db2.doc_detalle.Where(p => p.fecha >= minDate && p.fecha <= maxDate && !string.IsNullOrEmpty(p.descripcion)).GroupBy(p => p.descripcion).Select(p =>
                         new
                         {
                             descripcion = p.Key,
                             cantidad = p.Sum(i => i.cantidad * i.factorconversion),
                             costoTotal = p.Sum(i => i.costo * i.cantidad * i.factorconversion),
                             ventaTotal = p.Sum(i => i.precio * i.cantidad)
                         }))
                    {

                        var ganancia = item.ventaTotal - item.costoTotal;

                        row = new Row();
                        row.Columns = new List<Column>();
                        row.Columns.Add(new Column() { ColumnHeader = "Producto", Value = item.descripcion });
                        row.Columns.Add(new Column() { ColumnHeader = "Cantidad", Value = String.Format("{0:n0}", item.cantidad) });
                        row.Columns.Add(new Column() { ColumnHeader = "Inversión", Value = string.Format("{0:C}", item.costoTotal) });
                        row.Columns.Add(new Column() { ColumnHeader = "Venta", Value = string.Format("{0:C}", item.ventaTotal) });
                        row.Columns.Add(new Column() { ColumnHeader = "Ganancia unitaria promedio", Value = string.Format("{0:C}", ganancia.Value / item.cantidad) });
                        row.Columns.Add(new Column() { ColumnHeader = "Ganancia total", Value = string.Format("{0:C}", ganancia.Value) });

                        model.Rows.Add(row);
                        totalInversion += item.costoTotal.Value;
                        totalVenta += item.ventaTotal.Value;
                        count += item.cantidad.Value;
                        totalUtilidad += ganancia.Value;
                    }
                    model.Totales = new List<Row>();
                    model.Totales.Add(new Row());
                    model.Totales[0].Columns = new List<Column>();
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Producto", Value = "TOTAL:" });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Cantidad", Value = String.Format("{0:n0}", count) });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Inversión", Value = totalInversion.ToString("c2") });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Venta", Value = totalVenta.ToString("c2") });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Ganancia unitaria promedio", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Ganancia total", Value = totalUtilidad.ToString("c2") });
                }
                model.Filters = new List<Filter>();
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaI", Description = "Fecha inicio:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 0, 0, 0) });
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaF", Description = "Fecha fin:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 23, 59, 59) });

            }
        }

        /// <summary>
        /// Listado de cantidad de ventas diarias de un mes seleccionado
        /// </summary>
        internal static void GetTicketsInMonthReport(ref ReportViewModel model, int operationId, bool applyFilters, ref string errorMessage)
        {
            Dictionary<int, string> months = new Dictionary<int, string>();
            months.Add(1, "Enero");
            months.Add(2, "Febrero");
            months.Add(3, "Marzo");
            months.Add(4, "Abril");
            months.Add(5, "Mayo");
            months.Add(6, "Junio");
            months.Add(7, "Julio");
            months.Add(8, "Agosto");
            months.Add(9, "Septiembre");
            months.Add(10, "Octubre");
            months.Add(11, "Noviembre");
            months.Add(12, "Diciembre");

            using (var db2 = new SUPERTICKETEntities())
            {

                model.SetAttributes("Ventas del mes", "Ver", "ViewReport", "Catalog", (OperationsEnum)operationId, (OperationsEnum)operationId);
                if (applyFilters)
                {
                    decimal totalMensual = 0;
                    decimal count = 0;
                    model.Rows = new List<Row>();
                    int month = model.Filters[0].selectedMultipleValues.FirstOrDefault();
                    if ( month == 0) month = DateTime.Now.Month;
                    DateTime minDate = new DateTime(DateTime.Now.Year, month, 1);
                    DateTime maxDate = new DateTime(DateTime.Now.Year, month, DateTime.DaysInMonth(DateTime.Now.Year, month), 23, 59, 59);

                    //SELECT CONVERT(date, fecha) as Fecha, sum(TOTAL) as Venta, count(*) as tickets
                    //  FROM[dbo].[doc_general]
                    // where tipodocto = 'TICKET'
                    // group by CONVERT(date, fecha)

                    foreach (var item in db2.doc_general.Where(g => g.fecha >= minDate && g.fecha <= maxDate && g.TOTAL > 0 && g.tipodocto == "TICKET")
                        .GroupBy(p => DbFunctions.TruncateTime(p.fecha.Value)).Select(p =>
                         new
                         {
                             fecha = p.Key,
                             Venta = p.Sum(i => i.TOTAL),
                             tickets = p.Count()
                         }))
                    {

                        row = new Row();
                        row.Columns = new List<Column>();
                        row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.fecha.Value.ToString("dd MMMM yyyy") });
                        row.Columns.Add(new Column() { ColumnHeader = "Tickets", Value = string.Format("{0:n0}", item.tickets) });
                        row.Columns.Add(new Column() { ColumnHeader = "Venta", Value = string.Format("{0:C}", item.Venta) });

                        model.Rows.Add(row);

                        totalMensual += item.Venta.Value;
                        count += item.tickets;
                    }
                    model.Totales = new List<Row>();
                    model.Totales.Add(new Row());
                    model.Totales[0].Columns = new List<Column>();
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Fecha", Value = "TOTAL:" });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Tickets", Value = String.Format("{0:n0}", count) });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Venta", Value = totalMensual.ToString("c2") });
                }
                model.Filters = new List<Filter>();
                model.Filters.Add(new Filter() { Type = FilterType.Combo, Id = "Mes", Description = "Mes:", MultipleValues = months, Value = DateTime.Now.Month.ToString() });

            }
        }
    }
}