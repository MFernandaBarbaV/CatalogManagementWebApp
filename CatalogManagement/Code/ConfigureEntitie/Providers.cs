using CatalogManagement.DBModels;
using CatalogManagement.Models.Entities;
using CatalogManagement.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Code.ConfigureEntitie
{
    public class Providers : Base
    {
        internal static void GetAll(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                model.SetAttributes("Proveedores", (OperationsEnum)operationId, OperationsEnum.NuevoProducto);
                foreach (var item in db2.Proveedor)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "IdProveedor", Value = item.IdProveedor.ToString(), ID = item.IdProveedor.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "NombreProveedor", Value = item.NombreProveedor, ID = item.IdProveedor.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Telefono", Value = item.Telefono, ID = item.IdProveedor.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Dirección", Value = item.Dirección, ID = item.IdProveedor.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Email", Value = item.Email, ID = item.IdProveedor.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "DiasCredito", Value = item.DiasCredito.ToString(), ID = item.IdProveedor.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Informacion Bancaria", Value = item.InformacionBancaria, ID = item.IdProveedor.ToString() });

                    row.Columns.Add(new Column() { ColumnHeader = "Editar", ID = item.IdProveedor.ToString(), Type = ColumnType.Button, ButtonOperationId = (int)OperationsEnum.EditarProveedores, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog" });
                    model.Rows.Add(row);
                }

            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            var modelBackup = model;
            using (var db2 = new CatalogManagementDBEntities())
            {
                Proveedor result = null;

                if (itemId == 0)//Nuevo
                {
                    result = new Proveedor();

                    model.SetAttributes(itemId, "Nuevo Proveedor", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerProveedores);

                }
                else // Editar
                {
                    result = db2.Proveedor.Where(us => us.IdProveedor == itemId).FirstOrDefault();
                    model.SetAttributes(itemId, "Editar Proveedor", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerProveedores);
                }
                if (modelBackup != null && modelBackup.Properties != null && modelBackup.Properties.Count > 0)
                {
                    result.IdProveedor = itemId;
                    result.NombreProveedor = model.GetValuePropertieString("NombreProveedor");
                    result.Telefono = model.GetValuePropertieString("Telefono");
                    result.Dirección = model.GetValuePropertieString("Dirección");
                    result.Email = model.GetValuePropertieString("Email");
                    result.DiasCredito = model.GetValuePropertieByte("DiasCredito");
                    result.InformacionBancaria = model.GetValuePropertieString("InformacionBancaria");
                }

                if (result != null)
                {

                    model.Properties = new List<Propertie>();

                    model.Properties.Add(new Propertie(350) { Id = "NombreProveedor", Label = "NombreProveedor", Value = result.NombreProveedor, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true,true,true,true,1,350,true,true, ref messageValidation), ErrorMessage = messageValidation  });
                    model.Properties.Add(new Propertie(50) { Id = "Telefono", Label = "Telefono", Value = result.Telefono, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 50, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(350) { Id = "Dirección", Label = "Dirección", Value = result.Dirección, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 350, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(50) { Id = "Email", Label = "Email", Value = result.Email, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 50, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie() { Id = "DiasCredito", Label = "DiasCredito", Value = result.DiasCredito.ToString(), Type = PropertieType.TextBox, RegEx = Utils.OnlyNumber, ErrorMessage = Utils.ErrorOnlyNumber });
                    model.Properties.Add(new Propertie(350) { Id = "InformacionBancaria", Label = "Informacion Bancaria", Value = result.InformacionBancaria, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 350, true, true, ref messageValidation), ErrorMessage = messageValidation });

                }

            }
        }

        internal static bool Edit(ItemViewModel model, int userId, ref string errorMessage)
        {
            try
            {
                using (var db2 = new CatalogManagementDBEntities())
                {
                    param = new System.Data.Entity.Core.Objects.ObjectParameter("idVenta", typeof(int));

                    var proveedor = new Proveedor()
                    {
                        IdProveedor = model.ItemId,
                        NombreProveedor = model.GetValuePropertieString("NombreProveedor"),
                        Telefono = model.GetValuePropertieString("Telefono"),
                        Dirección = model.GetValuePropertieString("Dirección"),
                        Email = model.GetValuePropertieString("Email"),
                        DiasCredito = model.GetValuePropertieByte("DiasCredito"),
                        InformacionBancaria = model.GetValuePropertieString("InformacionBancaria"),
                    };

                    var resultProductoAgregar = db2.ProveedorEditar(proveedor.NombreProveedor, proveedor.Telefono, proveedor.Email, proveedor.Dirección, proveedor.DiasCredito, proveedor.InformacionBancaria, proveedor.IdProveedor);
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
                param = new System.Data.Entity.Core.Objects.ObjectParameter("idVenta", typeof(int));

                var proveedor = new Proveedor()
                {
                  
                    NombreProveedor = model.GetValuePropertieString("NombreProveedor"),
                    Telefono = model.GetValuePropertieString("Telefono"),
                    Dirección = model.GetValuePropertieString("Dirección"),
                    Email = model.GetValuePropertieString("Email"),
                    DiasCredito = model.GetValuePropertieByte("DiasCredito"),
                    InformacionBancaria = model.GetValuePropertieString("InformacionBancaria"),
                };

                var resultProductoAgregar = db2.ProveedorAgregar(proveedor.NombreProveedor, proveedor.Telefono, proveedor.Email, proveedor.Dirección, proveedor.DiasCredito, proveedor.InformacionBancaria);

                id = resultProductoAgregar.First().Value;
                db2.SaveChanges();

                return true;
            }


        }
    }
}