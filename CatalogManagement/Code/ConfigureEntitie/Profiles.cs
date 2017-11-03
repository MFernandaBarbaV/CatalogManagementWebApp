using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.DBModels;
using CatalogManagement.Models.Entities;

namespace CatalogManagement.Code.ConfigureEntitie
{
    public class Profiles : Base
    {
        internal static void GetProfilesCatalog(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
            {
                model.SetAttributes("Perfiles", (OperationsEnum)operationId,  OperationsEnum.NuevoPerfil);
                foreach (var item in db.mProfiles)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.ProfileID.ToString(), ID = item.ProfileID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.ProfileID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Aplicación", Value = item.mApplications.Name, ID = item.ProfileID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "", Value = item.ProfileID.ToString(), ID = item.ProfileID.ToString(), Type = ColumnType.Button, ButtonText = "Editar Perfil", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)OperationsEnum.EditarPerfiles });
                    row.Columns.Add(new Column() { ColumnHeader = "", Value = item.ProfileID.ToString(), ID = item.ProfileID.ToString(), Type = ColumnType.Button, ButtonText = "Editar Operaciones", ButtonAction = "AddRelation", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)OperationsEnum.AsignarOperaciónaPerfil });

                    model.Rows.Add(row);
                }
            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
            {
                #region Perfiles
                {
                    mProfiles resultProfile = null;

                    Dictionary<int, string> aplicaciones = new Dictionary<int, string>();

                    foreach (var item in db.mApplications)
                    {
                        aplicaciones.Add(item.ApplicationID, item.Name);
                    }

                    if (itemId == 0)//Nuevo
                    {
                        resultProfile = new mProfiles();
                        model.SetAttributes(itemId, "Nuevo Perfil", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerPerfiles);

                    }
                    else // Editar
                    {
                        resultProfile = db.mProfiles.Where(us => us.ProfileID == itemId).FirstOrDefault();
                        model.SetAttributes(itemId, "Editar Perfil", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerPerfiles);
                    }

                    if (resultProfile != null)
                    {
                        model.Properties = new List<Propertie>();
                        model.Properties.Add(new Propertie() { Id = "Name", Label = "Nombre", Value = resultProfile.Name, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                        model.Properties.Add(new Propertie() { Id = "ApplicationID", Label = "Aplicación", Value = resultProfile.ApplicationID.ToString(), Type = PropertieType.ComboBox, MultipleValues = aplicaciones, IsEnabled = itemId == 0, ClassIcon = faIconss.application });

                    }
                }
                #endregion
            }
        }

        internal static void GetOperations(ref RelationViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
            {

                var profileToAssign = db.mProfiles.FirstOrDefault(p => p.ProfileID == itemId);
                var operationsAssigned = profileToAssign.mOperations;
                var allOperations = db.mOperations.Where(o => o.ApplicationID == profileToAssign.ApplicationID);

                model.SetAttributes("Operaciones del perfil", profileToAssign.ProfileID, profileToAssign.Name, "Perfil", "Operaciones", "SaveRelation", "Catalog", "Guardar", OperationIdAction: operationId, OperationIdToReturn: (int)OperationsEnum.VerPerfiles);

                model.Items = new List<Row>();
                foreach (var operation in allOperations)
                {
                    Row row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column()
                    {
                        Type = ColumnType.CheckBox,
                        BooleanValue = operationsAssigned.FirstOrDefault(p => p.OperationID == operation.OperationID) != null,
                        ColumnHeader = "Selección",
                        ID = operation.OperationID.ToString()
                    });

                    row.Columns.Add(new Column() { ID = operation.OperationID.ToString(), ColumnHeader = "Id de Operación", Value = operation.OperationID.ToString() });
                    row.Columns.Add(new Column() { ID = operation.Name.ToString(), ColumnHeader = "Operación", Value = operation.Name.ToString() });
                    row.Columns.Add(new Column() { ID = operation.SysOperation.ToString(), ColumnHeader = "Id de Sistema", Value = operation.SysOperation.ToString() });
                    row.Columns.Add(new Column() { ID = operation.mApplications.Name.ToString(), ColumnHeader = "Aplicación", Value = operation.mApplications.Name.ToString() });

                    model.Items.Add(row);
                }

            }
        }

        internal static bool Edit(ItemViewModel model, int userId, ref string errorMessage)
        {
            try
            {
                using (var db = new CatalogManagementDBModel())


                {
                    var resProfileUpd = db.spmProfiles_Update(
               profileID: model.ItemId,
               name: model.GetValuePropertieString("name"),
               applicationID: model.GetValuePropertieInteger("ApplicationID"));

                    return resProfileUpd != null && resProfileUpd.First() > 0;

                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return false;
            }
        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage)
        {
            try
            {
                using (var db = new CatalogManagementDBModel())
                {
                    param = new System.Data.Entity.Core.Objects.ObjectParameter("profileID", typeof(int));

                    var resProfileIns = db.spmProfiles_Insert(
                        profileID: param,
                        name: model.GetValuePropertieString("name"),
                        applicationID: model.GetValuePropertieInteger("ApplicationID"));

                    return resProfileIns > 0;
                }
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return false;
            }
        }

        internal static bool SetOperations(RelationViewModel model, ref string errorMessage)
        {
            bool result = false;
            using (var db = new CatalogManagementDBModel())
            {
                #region AsignarOperaciónaPerfil

                using (var dbContextTransaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        int r1 = db.spdProfileOperations_Delete(model.ItemId);

                        if (r1 < 0)
                        {
                            return false;
                        }
                        else
                        {
                            result = true;
                        }

                        int r2 = 0;
                        foreach (var item in model.Items)
                        {
                            if (result && item.Columns[0].BooleanValue)
                            {
                                r2 = db.spdProfileOperations_Insert(model.ItemId, int.Parse(item.Columns[0].ID));
                                if (r2 < 1)
                                {
                                    result = false;
                                    continue;
                                }
                            }
                        }

                        dbContextTransaction.Commit();
                        result = true;
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        result = false;
                    }
                }

                #endregion
            }
            return result;
        }
    }
}