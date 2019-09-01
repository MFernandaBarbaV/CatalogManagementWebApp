using System;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.Models.Entities;
using System.Collections.Generic;
using CatalogManagement.DBModels;
using System.Linq;

namespace CatalogManagement.Code.ConfigureEntitie
{
    internal class ExpensesTypes : Base
    {
        internal static void GetExpensesTypesCatalog(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            return;
            using (var db2 = new CatalogManagementDBEntities())
            {
                #region VerTipoGasto

               // model.SetAttributes("Tipo de Gasto", (OperationsEnum)operationId, OperationsEnum.NuevoTipoGasto);
                foreach (var item in db2.TipoGasto)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.IdTipoGasto.ToString(), ID = item.IdTipoGasto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Descripción", Value = item.Descripcion.ToString(), ID = item.IdTipoGasto.ToString() });
                  //  row.Columns.Add(new Column() { ColumnHeader = "", Value = item.IdTipoGasto.ToString(), ID = item.IdTipoGasto.ToString(), Type = ColumnType.Button, ButtonText = "Editar Tipo de Gasto", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonOperationId = (int)OperationsEnum.EditarTipoGasto });

                    model.Rows.Add(row);
                }
                #endregion
            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                #region TipoGasto
                {
                    TipoGasto resultGasto = null;

                    if (itemId == 0)//Nuevo
                    {
                        resultGasto = new TipoGasto();
                     //   model.SetAttributes(itemId, "Nuevo Gasto", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerTipoGasto);

                    }
                    else // Editar
                    {
                        resultGasto = db2.TipoGasto.Where(us => us.IdTipoGasto == itemId).FirstOrDefault();
                      //  model.SetAttributes(itemId, "Editar Tipo Gasto", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerTipoGasto);
                    }

                    if (resultGasto != null)
                    {
                        model.Properties = new List<Propertie>();
                        model.Properties.Add(new Propertie(50) { Id = "Descripcion", Label = "Tipo Gasto", Value = resultGasto.Descripcion, RegEx = Utils.GenerateRegex(true, true, false, true, 1, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    }
                }
                #endregion
            }
        }

        internal static bool Edit(ItemViewModel model, int userId, ref string errorMessage)
        {
            try
            {
                using (var db2 = new CatalogManagementDBEntities())
                {
                    var tipoGasto = db2.TipoGasto.FirstOrDefault(m => m.IdTipoGasto == model.ItemId);

                    // Assign the new values
                    tipoGasto.Descripcion = model.GetValuePropertieString("Descripcion");

                    // Update and save

                    db2.Entry(tipoGasto);
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
                var obj = new TipoGasto()
                {
                    Descripcion = model.GetValuePropertieString("Descripcion"),
                };
                db2.TipoGasto.Add(obj);
                db2.SaveChanges();
                id = obj.IdTipoGasto;
                return true;
            }
        }
    }
}