using System;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.Models.Entities;
using CatalogManagement.DBModels;
using System.Collections.Generic;
using System.Linq;

namespace CatalogManagement.Code.ConfigureEntitie
{
    internal class Operations : Base
    {
        internal static void GetOperationsCatalog(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db = new DBModels.CatalogManagementDBEntities())// CatalogManagementDBEntities())
            {
                model.SetAttributes("Operaciones", (OperationsEnum)operationId);
                foreach (var item in db.Operations)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.OperationID.ToString(), ID = item.OperationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.OperationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Id De Sistema", Value = item.SysOperation.ToString(), ID = item.OperationID.ToString() });
                   model.Rows.Add(row);
                }
            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBEntities())
            {

                DBModels.Operations resultOperation = null;


                if (itemId == 0)//Nuevo
                {
                    resultOperation = new DBModels.Operations();
                    model.SetAttributes(itemId, "Nueva Operación", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerOperaciones);

                }
                else // Editar
                {
                    resultOperation = db.Operations.Where(us => us.OperationID == itemId).FirstOrDefault();
                    model.SetAttributes(itemId, "Editar Operación", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerOperaciones);
                }

                if (resultOperation != null)
                {
                    model.Properties = new List<Propertie>();
                    model.Properties.Add(new Propertie() { Id = "Name", Label = "Nombre", Value = resultOperation.Name, RegEx = Utils.GenerateRegex(true, true, false, true, 1, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "SysOperation", Label = "Id de Sistema", Value = resultOperation.SysOperation.ToString(), Type = PropertieType.TextBox, IsEnabled = itemId == 0, RegEx = Utils.OnlyNumber, ErrorMessage = Utils.ErrorOnlyNumber });

                  
                }

            }
        }

       
    }
}