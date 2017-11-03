using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.DBModels;
using CatalogManagement.Models.Entities;


namespace CatalogManagement.Code.ConfigureEntitie
{
    public class Application : Base
    {
        internal static void GetCatalog(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
            {
                model.SetAttributes("Aplicaciones", (OperationsEnum)operationId, OperationsEnum.NuevaAplicación);
                foreach (var item in db.mApplications)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.ApplicationID.ToString(), ID = item.ApplicationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.ApplicationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Tipo", Value = item.Type.ToString(), ID = item.ApplicationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Version", Value = item.Version.ToString(), ID = item.ApplicationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Fecha", Value = item.ReleaseDate.ToString(), ID = item.ApplicationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Estatus", Value = item.mStatus.Name.ToString(), ID = item.ApplicationID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Editar", Value = item.ApplicationID.ToString(), ID = item.ApplicationID.ToString(), Type = ColumnType.Button, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)OperationsEnum.EditarAplicaciones });
                    model.Rows.Add(row);
                }
            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
            {
                Dictionary<int, string> statusList = new Dictionary<int, string>();
                foreach (var item in db.mStatus.Where(s => s.mStatusTypes.TypeID == 1))
                {
                    statusList.Add(item.StatusID, item.Name);
                }
                mApplications resultApp = null;

                if (itemId == 0)//Nuevo
                {
                    resultApp = new mApplications();
                    model.SetAttributes(itemId, "Nueva Aplicación", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerAplicaciones);
                }
                else//Editar
                {
                    resultApp = db.mApplications.First(app => app.ApplicationID == itemId);
                    model.SetAttributes(itemId, "Editar Aplicación", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerAplicaciones);
                }

                if (resultApp != null)
                {
                    model.Properties = new List<Propertie>();
                    model.Properties.Add(new Propertie() { Id = "name", Label = "Nombre", Value = resultApp.Name, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "Type", Label = "Tipo", Value = resultApp.Type, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 10, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "version", Label = "Versión", Value = resultApp.Version, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 10, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "statusID", Label = "Estatus", Value = resultApp.StatusID.ToString(), Type = PropertieType.ComboBox, MultipleValues = statusList, ClassIcon = faIconss.status });
                }
            }
        }

        internal static bool Edit(ItemViewModel model, int userId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
            {
                var resAppUdt = db.spmApplications_Update(
                    applicationID: model.ItemId
                      , name: model.GetValuePropertieString("name")
                      , type: model.GetValuePropertieString("type")
                      , origin: string.Empty
                      , releaseDate: DateTime.Now
                      , version: model.GetValuePropertieString("version")
                      , statusID: model.GetValuePropertieInteger("statusID")
                      );
                return resAppUdt > 0;
            }
        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage)
        {
            try
            {
                using (var db = new CatalogManagementDBModel())
                {
                    param = new System.Data.Entity.Core.Objects.ObjectParameter("applicationID", typeof(int));

                    var resAppIns = db.spmApplications_Insert(
                        applicationID: param,
                        name: model.GetValuePropertieString("name"),
                        type: model.GetValuePropertieString("type"),
                        origin: string.Empty,
                        statusID: model.GetValuePropertieInteger("statusID"),
                        version: model.GetValuePropertieString("version"),
                        releaseDate: null
                        );

                    return resAppIns > 0; ;
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