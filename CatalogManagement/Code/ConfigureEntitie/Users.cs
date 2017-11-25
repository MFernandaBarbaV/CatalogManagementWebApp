using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.Models.Entities;
using CatalogManagement.DBModels;

namespace CatalogManagement.Code.ConfigureEntitie
{
    public class Users : Base
    {

        internal static void GetAll(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBEntities())
            {
                model.SetAttributes("Usuarios", (OperationsEnum)operationId, OperationsEnum.NuevoUsuario);

                foreach (var item in db.Users)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.UserID.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Login", Value = item.Login.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Estatus", Value = item.Status.Name, ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Apellido Paterno", Value = item.LastName.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Estatus", Value = item.Status.Name.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Editar", Value = item.UserID.ToString(), ID = item.UserID.ToString(), Type = ColumnType.Button, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)OperationsEnum.EditarUsuarios });
                    row.Columns.Add(new Column()
                    {
                        ColumnHeader = "Perfil",
                        Value = item.UserID.ToString(),
                        ID = item.UserID.ToString(),
                        Type = ColumnType.Button,
                        ButtonText = "Ver Operaiones",
                        ButtonAction = "AddRelation",
                        ButtonController = "Catalog",
                        ButtonDissabled = false,
                        ButtonOperationId = (int)OperationsEnum.AsignarOperaciónaUsuario
                    });
                    row.Columns.Add(new Column()
                    {
                        ColumnHeader = "Cerrar Sesión",
                        Value = item.UserID.ToString(),
                        ID = item.UserID.ToString(),
                        Type = ColumnType.Button,
                        ButtonText = "Cerrar Sesión",
                        ButtonAction = "CloseUserSesion",
                        ButtonController = "Catalog",
                        ButtonDissabled = !item.IsActiveSession,
                        ButtonOperationId = (int)OperationsEnum.CerrarSesionUsuario
                    });

                    model.Rows.Add(row);
                }
            }

        }

        internal static void Get(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBEntities())
            {
                if (db.Database.Connection.State != System.Data.ConnectionState.Open)
                    db.Database.Connection.Open();

                Dictionary<int, string> statusList = new Dictionary<int, string>();
                statusList.Add(0, "-Seleccionar-");
                foreach (var item in db.Status)
                {
                    statusList.Add(item.StatusID, item.Name);
                }
                DBModels.Users resultUser = null;

                if (itemId == 0)//Nuevo
                {
                    resultUser = new DBModels.Users();
                    model.SetAttributes(itemId, "Nuevo Usuario", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerUsuarios);
                }
                else // Editar
                {
                    resultUser = db.Users.Where(us => us.UserID == itemId).FirstOrDefault();
                    resultUser.Password = Security.Decrypt(resultUser.Password);
                    model.SetAttributes(itemId, "Editar Usuario", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerUsuarios);
                }

                Dictionary<int, string> gendleList = new Dictionary<int, string>();
                gendleList.Add(1, "Masculino");
                gendleList.Add(2, "Femenino");

                if (resultUser != null)
                {

                    model.Properties = new List<Propertie>();
                    #region FillProperties

                    model.Properties.Add(new Propertie(25, 1) { Id = "Name", Label = "Nombre", Value = resultUser.Name, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(50, 1) { Id = "LastName", Label = "Apellido Paterno", Value = resultUser.LastName, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(50) { Id = "Surname", Label = "Apellido Materno", Value = resultUser.Surname, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(15, 0) { Id = "ShortName", Label = "Nombre Corto", Value = resultUser.ShortName, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });

                    model.Properties.Add(new Propertie(100, 1) { Id = "Address", Label = "Dirección", Value = resultUser.Address, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "ZipCode", Label = "Código Postal", Value = resultUser.ZipCode.ToString(), RegEx = Utils.GenerateRegex(false, false, true, false, 0, 6, false, false, ref messageValidation), ErrorMessage = messageValidation });

                    model.Properties.Add(new Propertie(120) { Id = "Email", Label = "Email", Value = resultUser.Email, RegEx = Utils.RegexEmail, ErrorMessage = "Formato invalido para un correo" });
                    model.Properties.Add(new Propertie(50) { Id = "Position", Label = "Puesto", Value = resultUser.Position, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });


                    model.Properties.Add(new Propertie(50, 1) { Id = "Login", Label = "Usuario", Value = resultUser.Login, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(64, 64) { Id = "Password", Label = "Contraseña", Value = resultUser.Password, ClassIcon = faIconss.password, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 30, true, false, ref messageValidation), ErrorMessage = messageValidation, Type = PropertieType.Password });
                    model.Properties.Add(new Propertie(64, 64) { Id = "ConfirmPassword", Label = "Confirmar Contraseña", Value = "", ClassIcon = faIconss.password, Type = PropertieType.ConfirmPassword });

                    model.Properties.Add(new Propertie() { Id = "Status", Label = "Estatus", ObjectValue = new KeyValuePair<int, string>(resultUser.StatusID, statusList[resultUser.StatusID]), Type = PropertieType.ComboBox, MultipleValues = statusList, ClassIcon = faIconss.status });
                    #endregion
                }

            }
        }

        internal static void GetOperations(ref RelationViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBEntities())
            {


                var user = db.Users.FirstOrDefault(u => u.UserID == itemId);
                var profilesAssigned = user.Operations;
                var allOperations = db.Operations;


                model.SetAttributes(Title: "Perfiles de usuario", ItemId: user.UserID, NameItem: user.Login, TitlePrincipalElement: "Usuario", TitleRelationElement: "Perfiles",
                   ButtonAction: "SaveRelation", ButtonController: "Catalog", ButtonText: "Guardar", OperationIdAction: operationId, OperationIdToReturn: (int)OperationsEnum.VerUsuarios);

                model.Items = new List<Row>();
                foreach (var operation in allOperations)
                {
                    Row row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column()
                    {
                        Type = ColumnType.CheckBox,
                        BooleanValue = profilesAssigned.FirstOrDefault(p => p.OperationID == operation.OperationID) != null,
                        ColumnHeader = "Selección",
                        ID = operation.OperationID.ToString()
                    });

                    row.Columns.Add(new Column() { ID = operation.OperationID.ToString(), ColumnHeader = "Id de Operaciòn", Value = operation.OperationID.ToString() });
                    row.Columns.Add(new Column() { ID = operation.OperationID.ToString(), ColumnHeader = "Name", Value = operation.Name.ToString() });
                    row.Columns.Add(new Column() { ID = operation.OperationID.ToString(), ColumnHeader = "SysOperation", Value = operation.SysOperation.ToString() });
                    model.Items.Add(row);
                }
            }

        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage, out int id)
        {
            using (var db = new CatalogManagementDBEntities())
            {
                param = new System.Data.Entity.Core.Objects.ObjectParameter("userID", typeof(int));

                var resUserIns = db.spUser_Insert(
                    userID: param,
                    name: model.GetValuePropertieString("Name"),
                    lastName: model.GetValuePropertieString("LastName"),
                    surname: model.GetValuePropertieString("Surname"),
                    address: model.GetValuePropertieString("Address"),
                    zipCode: model.GetValuePropertieInteger("ZipCode"),
                    email: model.GetValuePropertieString("Email"),
                    position: model.GetValuePropertieString("Position"),
                    shortName: model.GetValuePropertieString("ShortName"),
                    login: model.GetValuePropertieString("Login"),
                    password: Security.Encrypt(model.GetValuePropertieString("Password")),
                    status: model.GetValuePropertieInteger("Status"));
                id = int.Parse(param.Value.ToString());
                return resUserIns > 0;
            }
        }

        internal static bool Edit(ItemViewModel model, int userId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBEntities())
            {
                var resUserUpd = db.spUser_Update(
                                  userID: model.ItemId,
                                  name: model.GetValuePropertieString("Name"),
                                  lastName: model.GetValuePropertieString("LastName"),
                                  surname: model.GetValuePropertieString("Surname"),

                                  address: model.GetValuePropertieString("Address"),
                                  zipCode: model.GetValuePropertieInteger("ZipCode"),
                                  email: model.GetValuePropertieString("Email"),

                                  position: model.GetValuePropertieString("Position"),
                                  shortName: model.GetValuePropertieString("ShortName"),
                                  login: model.GetValuePropertieString("Login"),
                                  password: Security.Encrypt(model.GetValuePropertieString("Password")),
                                  status: model.GetValuePropertieInteger("Status"));

                return resUserUpd != null && resUserUpd.First() > 0;
            }
        }

        internal static bool SetOperations(RelationViewModel model, ref string errorMessage)
        {
            bool result = true;
            using (var db = new CatalogManagementDBEntities())
            {

                using (var dbContextTransaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        int r1 = db.spOperationUser_DeleteAllByUser(model.ItemId);

                        if (r1 < 0)
                        {
                            return false;
                        }
                        else
                        {
                            result = true;
                        }


                        foreach (var item in model.Items)
                        {
                            if (result && item.Columns[0].BooleanValue)
                            {

                                var r2 = db.spOperationUser_Insert(int.Parse(item.Columns[0].ID), model.ItemId);
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
                    catch (Exception ex)
                    {
                        errorMessage = ex.Message + (ex.InnerException == null ? string.Empty : " " + ex.InnerException.Message);
                        dbContextTransaction.Rollback();
                        result = false;
                    }
                }

            }

            return result;
        }
    }
}