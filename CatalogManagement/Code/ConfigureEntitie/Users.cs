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
            using (var db = new CatalogManagementDBModel())
            {
                model.SetAttributes("Usuarios", (OperationsEnum)operationId,  OperationsEnum.NuevoUsuario);

                foreach (var item in db.mUsers)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.UserID.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Login", Value = item.Login.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Estatus", Value = item.mStatus.Name, ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Apellido Paterno", Value = item.LastName.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Genero", Value = item.Sex.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Organización", Value = item.Organization.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Estatus", Value = item.mStatus.Name.ToString(), ID = item.UserID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Editar", Value = item.UserID.ToString(), ID = item.UserID.ToString(), Type = ColumnType.Button, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)OperationsEnum.EditarUsuarios });
                    row.Columns.Add(new Column()
                    {
                        ColumnHeader = "Perfil",
                        Value = item.UserID.ToString(),
                        ID = item.UserID.ToString(),
                        Type = ColumnType.Button,
                        ButtonText = "Ver Perfiles",
                        ButtonAction = "AddRelation",
                        ButtonController = "Catalog",
                        ButtonDissabled = false,
                        ButtonOperationId = (int)OperationsEnum.AsignarPerfilaUsuario
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
            using (var db = new CatalogManagementDBModel())
            {
                Dictionary<int, string> statusList = new Dictionary<int, string>();
                foreach (var item in db.mStatus.Where(s => s.mStatusTypes.TypeID == 1))
                {
                    statusList.Add(item.StatusID, item.Name);
                }
                mUsers resultUser = null;

                if (itemId == 0)//Nuevo
                {
                    resultUser = new mUsers();
                    model.SetAttributes(itemId, "Nuevo Usuario", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerUsuarios);
                }
                else // Editar
                {
                    resultUser = db.mUsers.Where(us => us.UserID == itemId).FirstOrDefault();
                    model.SetAttributes(itemId, "Editar Usuario", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerUsuarios);
                }

                Dictionary<int, string> gendleList = new Dictionary<int, string>();
                gendleList.Add(1, "Masculino");
                gendleList.Add(2, "Femenino");

                if (resultUser != null)
                {

                    model.Properties = new List<Propertie>();
                    #region FillProperties

                    model.Properties.Add(new Propertie() { Id = "Name", Label = "Nombre", Value = resultUser.Name, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "LastName", Label = "Apellido Paterno", Value = resultUser.LastName, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "Surname", Label = "Apellido Materno", Value = resultUser.Surname, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "ShortName", Label = "Nombre Corto", Value = resultUser.ShortName, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "Sex", Label = "Genero", Value = resultUser.Sex.ToString(), Type = PropertieType.ComboBox, MultipleValues = gendleList, ClassIcon = faIconss.gendle });

                    model.Properties.Add(new Propertie() { Id = "Address", Label = "Dirección", Value = resultUser.Address, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "ZipCode", Label = "Código Postal", Value = resultUser.ZipCode.ToString(), RegEx = Utils.GenerateRegex(false, false, true, false, 0, 6, false, false, ref messageValidation), ErrorMessage = messageValidation });

                    model.Properties.Add(new Propertie() { Id = "Email", Label = "Email", Value = resultUser.Email, RegEx = Utils.RegexEmail, ErrorMessage = "Formato invalido para un correo" });
                    model.Properties.Add(new Propertie() { Id = "Organization", Label = "Organización", Value = resultUser.Organization, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "Position", Label = "Puesto", Value = resultUser.Position, RegEx = Utils.GenerateRegex(true, true, false, true, 0, 30, true, false, ref messageValidation), ErrorMessage = messageValidation });

                    model.Properties.Add(new Propertie() { Id = "Status", Label = "Estatus", Value = resultUser.StatusID.ToString(), Type = PropertieType.ComboBox, MultipleValues = statusList, ClassIcon = faIconss.status });

                    model.Properties.Add(new Propertie() { Id = "Login", Label = "Usuario", Value = resultUser.Login, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 30, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "Password", Label = "Contraseña", Value = resultUser.Password, ClassIcon = faIconss.password, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 30, true, false, ref messageValidation), ErrorMessage = messageValidation, Type = PropertieType.Password });
                    model.Properties.Add(new Propertie() { Label = "Confirmar Contraseña", Value = "", ClassIcon = faIconss.password, Type = PropertieType.ConfirmPassword });
                    #endregion
                }

            }
        }

        internal static void GetProfiles(ref RelationViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
            {

                Dictionary<int, string> templates = new Dictionary<int, string>();

                foreach (var item in db.mAccessTemplates)
                {
                    templates.Add(item.AccessTemplateID, item.Name);
                }

                var user = db.mUsers.FirstOrDefault(u => u.UserID == itemId);
                var profilesAssigned = user.dUserProfiles;
                var allProfiles = db.mProfiles;


                model.SetAttributes(Title: "Perfiles de usuario", ItemId: user.UserID, NameItem: user.Login, TitlePrincipalElement: "Usuario", TitleRelationElement: "Perfiles",
                   ButtonAction: "SaveRelation", ButtonController: "Catalog", ButtonText: "Guardar", OperationIdAction: operationId, OperationIdToReturn: (int)OperationsEnum.VerUsuarios);

                model.Items = new List<Row>();
                foreach (var profile in allProfiles)
                {
                    Row row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column()
                    {
                        Type = ColumnType.CheckBox,
                        BooleanValue = profilesAssigned.FirstOrDefault(p => p.ProfileID == profile.ProfileID) != null,
                        ColumnHeader = "Selección",
                        ID = profile.ProfileID.ToString()
                    });

                    row.Columns.Add(new Column() { ID = profile.ProfileID.ToString(), ColumnHeader = "Id de Perfil", Value = profile.ProfileID.ToString() });
                    row.Columns.Add(new Column() { ID = profile.ProfileID.ToString(), ColumnHeader = "Perfil", Value = profile.Name.ToString() });
                    row.Columns.Add(new Column() { ID = profile.ProfileID.ToString(), ColumnHeader = "Aplicación", Value = profile.mApplications.Name.ToString() });
                    row.Columns.Add(new Column() { ID = profile.ProfileID.ToString(), ColumnHeader = "Horario", Value = "", Type = ColumnType.ComboBox, MultipleValues = templates });
                    model.Items.Add(row);
                }
            }

        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
            {
                param = new System.Data.Entity.Core.Objects.ObjectParameter("userID", typeof(int));

                var resUserIns = db.spmUser_Insert(
                    userID: param,
                    name: model.GetValuePropertieString("Name"),
                    lastName: model.GetValuePropertieString("LastName"),
                    surname: model.GetValuePropertieString("Surname"),
                    sexID: model.GetValuePropertieInteger("Sex"),
                    address: model.GetValuePropertieString("Address"),
                    zipCode: model.GetValuePropertieInteger("ZipCode"),
                    email: model.GetValuePropertieString("Email"),
                    organization: model.GetValuePropertieString("Organization"),
                    position: model.GetValuePropertieString("Position"),
                    shortName: model.GetValuePropertieString("ShortName"),
                    login: model.GetValuePropertieString("Login"),
                    password: Security.Encrypt(model.GetValuePropertieString("Password")),
                    status: model.GetValuePropertieInteger("Status"));

                return resUserIns > 0;
            }
        }

        internal static bool Edit(ItemViewModel model, int userId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
            {
                var resUserUpd = db.spmUser_Update(
                                  userID: model.ItemId,
                                  name: model.GetValuePropertieString("Name"),
                                  lastName: model.GetValuePropertieString("LastName"),
                                  surname: model.GetValuePropertieString("Surname"),
                                  sexID: model.GetValuePropertieInteger("Sex"),
                                  address: model.GetValuePropertieString("Address"),
                                  zipCode: model.GetValuePropertieInteger("ZipCode"),
                                  email: model.GetValuePropertieString("Email"),
                                  organization: model.GetValuePropertieString("Organization"),
                                  position: model.GetValuePropertieString("Position"),
                                  shortName: model.GetValuePropertieString("ShortName"),
                                  login: model.GetValuePropertieString("Login"),
                                  password: Security.Encrypt(model.GetValuePropertieString("Password")),
                                  status: model.GetValuePropertieInteger("Status"));

                return resUserUpd != null && resUserUpd.First() > 0;
            }
        }

        internal static bool SetProfiles(RelationViewModel model, ref string errorMessage)
        {
            bool result = true;
            using (var db = new CatalogManagementDBModel())
            {

                using (var dbContextTransaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        int r1 = db.spdUserProfiles_Delete(model.ItemId);

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

                                var r2 = db.spdUserProfiles_Insert(model.ItemId, int.Parse(item.Columns[0].ID), int.Parse(item.Columns[3].Value));
                                if (r2 == null || r2.First() < 1)
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