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
            using (var db = new CatalogManagementDBModel())
            {
                model.SetAttributes("Operaciones", (OperationsEnum)operationId,  OperationsEnum.NuevaOperación);
                foreach (var item in db.mOperations)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.OperationID.ToString(), ID = item.OperationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.OperationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Id De Sistema", Value = item.SysOperation.ToString(), ID = item.OperationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Aplicación", Value = item.mApplications.Name, ID = item.OperationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Editar", Value = item.OperationID.ToString(), ID = item.OperationID.ToString(), Type = ColumnType.Button, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)OperationsEnum.EditarOperaciones });
                    model.Rows.Add(row);
                }
            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
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
                    model.SetAttributes(itemId, "Nueva Operación", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerOperaciones);

                }
                else // Editar
                {
                    resultOperation = db.mOperations.Where(us => us.OperationID == itemId).FirstOrDefault();
                    model.SetAttributes(itemId, "Editar Operación", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerOperaciones);
                }

                if (resultOperation != null)
                {
                    model.Properties = new List<Propertie>();
                    model.Properties.Add(new Propertie() { Id = "Name", Label = "Nombre", Value = resultOperation.Name, RegEx = Utils.GenerateRegex(true, true, false, true, 1, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "SysOperation", Label = "Id de Sistema", Value = resultOperation.SysOperation.ToString(), Type = PropertieType.TextBox, IsEnabled = itemId == 0, RegEx = Utils.OnlyNumber, ErrorMessage = Utils.ErrorOnlyNumber });

                    model.Properties.Add(new Propertie() { Id = "ApplicationID", Label = "Aplicación", Value = resultOperation.ApplicationID.ToString(), Type = PropertieType.ComboBox, MultipleValues = aplicaciones, IsEnabled = itemId == 0, ClassIcon = faIconss.application });

                }

            }
        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage)
        {
            try
            {
                using (var db = new CatalogManagementDBModel())

                {
                    param = new System.Data.Entity.Core.Objects.ObjectParameter("OperationId", typeof(int));
                    var resOperatInsert = db.spmOperations_Insert(
                        operationID: param,
                        name: model.GetValuePropertieString("name"),
                        applicationID: model.GetValuePropertieInteger("ApplicationID"));

                    return resOperatInsert > 0;
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return false;
            }
        }
    }
}