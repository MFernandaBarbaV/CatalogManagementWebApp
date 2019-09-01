using System;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.Models.Entities;
using System.Collections.Generic;
using CatalogManagement.DBModels;
using System.Linq;

namespace CatalogManagement.Code.ConfigureEntitie
{
    internal class Expenses : Base
    {
        internal static void GetExpensesCatalog(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                model.SetAttributes("Gastos", (OperationsEnum)operationId);
                foreach (var item in db2.Gastos.Where(c => c.Fecha > new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day)))
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.IdGasto.ToString(), ID = item.IdGasto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Descripción", Value = item.Descripcion.ToString(), ID = item.IdGasto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Tipo de Gasto", Value = item.TipoGasto.Descripcion, ID = item.IdGasto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Cantidad", Value = item.Cantidad.ToString("c2"), ID = item.IdGasto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.Fecha.ToString("dd MMMM yyyy hh:mm tt"), ID = item.IdGasto.ToString() });
                  //  row.Columns.Add(new Column() { ColumnHeader = "", Value = item.IdGasto.ToString(), ID = item.IdGasto.ToString(), Type = ColumnType.Button, ButtonText = "Editar Gasto", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonOperationId = (int)OperationsEnum.EditarGasto });
                  //  row.Columns.Add(new Column() { ColumnHeader = "", Value = item.IdGasto.ToString(), ID = item.IdGasto.ToString(), Type = ColumnType.Button, ButtonText = "Eliminar Gasto", ButtonAction = "DeleteItem", ButtonController = "Catalog", ButtonOperationId = (int)OperationsEnum.EliminarGasto });

                    model.Rows.Add(row);
                }
            }

        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
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
                    resultGasto.Fecha = DateTime.Now;
                   // model.SetAttributes(itemId, "Nuevo Gasto", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerReporteGastos);

                }
                else // Editar
                {
                    resultGasto = db2.Gastos.Where(us => us.IdGasto == itemId).FirstOrDefault();
                 //   model.SetAttributes(itemId, "Editar Gastos", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerReporteGastos);
                }

                if (resultGasto != null)
                {
                    model.Properties = new List<Propertie>();
                    model.Properties.Add(new Propertie(150) { Id = "Descripcion", Label = "Descripción", Value = resultGasto.Descripcion, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 50, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "IdTipoGasto", Label = "Tipo Gasto", MultipleValues = tipoGasto, Type = PropertieType.ComboBox, Value = resultGasto.IdTipoGasto.ToString() });
                    model.Properties.Add(new Propertie() { Id = "Cantidad", Label = "Cantidad", ObjectValue = resultGasto.Cantidad, RegEx = Utils.OnlyNumber, ErrorMessage = Utils.ErrorOnlyNumber, Type = PropertieType.TextBox, ClassIcon = faIconss.money });
                    model.Properties.Add(new Propertie() { Id = "Fecha", Label = "Fecha", DateValue = resultGasto.Fecha, Type = PropertieType.Date, ClassIcon = faIconss.date });

                }

            }
        }

        internal static bool Edit(ItemViewModel model, int userId, ref string errorMessage)
        {
            try
            {
                using (var db2 = new CatalogManagementDBEntities())
                {
                    var gasto = db2.Gastos.FirstOrDefault(m => m.IdGasto == model.ItemId);

                    // Assign the new values
                    gasto.Descripcion = model.GetValuePropertieString("Descripcion");
                    gasto.IdTipoGasto = model.GetValuePropertieByte("IdTipoGasto");
                    // Update and save

                    db2.Entry(gasto);
                    db2.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return false;
            }

        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage, out int id)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                var gasto = new Gastos()
                {
                    Descripcion = model.GetValuePropertieString("Descripcion"),
                    IdTipoGasto = model.GetValuePropertieByte("IdTipoGasto"),
                    Cantidad = model.GetValuePropertieInteger("Cantidad"),
                    Fecha = model.GetValuePropertieDateTime("Fecha"),
                };
                db2.Gastos.Add(gasto);
                db2.SaveChanges();
                id = gasto.IdGasto;
                return true;
            }

        }

        internal static void GetReport(ref ReportViewModel model, int operationId, bool applyFilters, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                model.SetAttributes("Gastos", "Ver", "ViewReport", "Catalog", (OperationsEnum)operationId, (OperationsEnum)operationId);
                if (applyFilters)
                {
                    decimal total = 0;

                    model.Rows = new List<Row>();

                    DateTime minDate = model.Filters[0].DateValue.Date;
                    DateTime maxDate = model.Filters[1].DateValue.Date;
                    List<int> types = (model.Filters[2].selectedMultipleValues == null) ? new List<int>() : model.Filters[2].selectedMultipleValues.Where(t => t != 0).ToList();

                    foreach (var item in db2.Gastos.Where(g => g.Fecha >= minDate && g.Fecha <= maxDate && (types.Contains(g.IdTipoGasto) || types.Count == 0)))
                    {
                        row = new Row();
                        row.Columns = new List<Column>();
                        row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.Fecha.ToString("dd MMMM yyyy hh:mm tt"), ID = item.IdGasto.ToString() });
                        //   row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.IdGasto.ToString(), ID = item.IdGasto.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Descripción", Value = item.Descripcion.ToString(), ID = item.IdGasto.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Tipo de Gasto", Value = item.TipoGasto.Descripcion, ID = item.IdGasto.ToString() });
                        row.Columns.Add(new Column() { ColumnHeader = "Cantidad", Value = item.Cantidad.ToString("c2"), ID = item.IdGasto.ToString() });

                        model.Rows.Add(row);

                        total += item.Cantidad;
                    }
                    model.Totales = new List<Row>();
                    model.Totales.Add(new Row());
                    model.Totales[0].Columns = new List<Column>();
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Fecha", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Descripción", Value = string.Empty });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Tipo de Gasto", Value = "Total:" });
                    model.Totales[0].Columns.Add(new Column() { ColumnHeader = "Cantidad", Value = total.ToString("c2"), });


                }


                Dictionary<int, string> tipoGasto = new Dictionary<int, string>();
                tipoGasto.Add(0, "-Todos-");
                foreach (var item in db2.TipoGasto)
                {
                    tipoGasto.Add(item.IdTipoGasto, item.Descripcion);
                }

                model.Filters = new List<Filter>();
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaI", Description = "Fecha inicio:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1) });
                model.Filters.Add(new Filter() { Type = FilterType.Date, Id = "FechaF", Description = "Fecha fin:", DateValue = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.DaysInMonth(DateTime.Now.Year, DateTime.Now.Month)) });
                model.Filters.Add(new Filter() { Type = FilterType.Combo, Id = "Tipo", Description = "Tipo de gasto:", MultipleValues = tipoGasto });

            }
        }
    }

}