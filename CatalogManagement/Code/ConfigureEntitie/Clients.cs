using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.DBModels;
using CatalogManagement.Models.Entities;

namespace CatalogManagement.Code.ConfigureEntitie
{
    public class Clients : Base
    {
        internal static void GetAll(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                model.SetAttributes("Clientes", (OperationsEnum)operationId, OperationsEnum.NuevoCliente);
                foreach (var item in db2.Clientes)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "IdCliente", Value = item.IdCliente.ToString(), ID = item.IdCliente.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.NombreCliente, ID = item.IdCliente.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "RFC", Value = item.RFC, ID = item.IdCliente.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Telefono", Value = item.Telefono, ID = item.IdCliente.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Email", Value = item.Email, ID = item.IdCliente.ToString() });

                    string direccion = item.CalleDomicilioFiscal + " " + item.NumeroExteriorDomicilioFiscal + " - " + item.NumeroInteriorDomicilioFiscal + " C.P.:" + item.CodigoPostalDomicilioFiscal + " " + item.ColoniaDomicilioFiscal + " " + item.CiudadDomicilioFiscal + " " + item.EstadoDomicilioFiscal;
                    row.Columns.Add(new Column() { ColumnHeader = "Direccion", Value = direccion, ID = item.IdCliente.ToString() });

                    row.Columns.Add(new Column() { ColumnHeader = "Editar", ID = item.IdCliente.ToString(), Type = ColumnType.Button, ButtonOperationId = (int)OperationsEnum.EditarCliente, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog" });
                    model.Rows.Add(row);
                }

            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            var modelBackup = model;
            using (var db2 = new CatalogManagementDBEntities())
            {
                Clientes result = null;

                if (itemId == 0)//Nuevo
                {
                    result = new Clientes();

                    model.SetAttributes(itemId, "Nuevo Cliente", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerClientes);

                }
                else // Editar
                {
                    result = db2.Clientes.Where(us => us.IdCliente == itemId).FirstOrDefault();
                    model.SetAttributes(itemId, "Editar Cliente", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerClientes);
                }
                if (modelBackup != null && modelBackup.Properties != null && modelBackup.Properties.Count > 0)
                {
                    result.IdCliente = model.GetValuePropertieInteger("IdCliente");
                    result.NombreCliente = model.GetValuePropertieString("NombreCliente");
                    result.CalleDomicilioFiscal = model.GetValuePropertieString("CalleDomicilioFiscal");
                    result.CiudadDomicilioFiscal = model.GetValuePropertieString("CiudadDomicilioFiscal");
                    result.CodigoPostalDomicilioFiscal = model.GetValuePropertieString("CodigoPostalDomicilioFiscal");
                    result.ColoniaDomicilioFiscal = model.GetValuePropertieString("ColoniaDomicilioFiscal");

                    result.Email = model.GetValuePropertieString("Email");
                    result.EstadoDomicilioFiscal = model.GetValuePropertieString("EstadoDomicilioFiscal");
                    result.NumeroExteriorDomicilioFiscal = model.GetValuePropertieString("NumeroExteriorDomicilioFiscal");
                    result.NumeroInteriorDomicilioFiscal = model.GetValuePropertieString("NumeroInteriorDomicilioFiscal");

                    result.RFC = model.GetValuePropertieString("RFC");
                    result.Telefono = model.GetValuePropertieString("Telefono");
                }

                if (result != null)
                {

                    model.Properties = new List<Propertie>();

                    model.Properties.Add(new Propertie(300) { Id = "NombreCliente", Label = "NombreCliente", Value = result.NombreCliente, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 300, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(100) { Id = "Telefono", Label = "Telefono", Value = result.Telefono, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });

                    model.Properties.Add(new Propertie(100) { Id = "RFC", Label = "RFC", Value = result.RFC, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(100) { Id = "Email", Label = "Email", Value = result.Email, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(100) { Id = "CalleDomicilioFiscal", Label = "CalleDomicilioFiscal", Value = result.CalleDomicilioFiscal, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(100) { Id = "NumeroInteriorDomicilioFiscal", Label = "NumeroInteriorDomicilioFiscal", Value = result.NumeroInteriorDomicilioFiscal, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(100) { Id = "NumeroExteriorDomicilioFiscal", Label = "NumeroExteriorDomicilioFiscal", Value = result.NumeroExteriorDomicilioFiscal, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(100) { Id = "CodigoPostalDomicilioFiscal", Label = "CodigoPostalDomicilioFiscal", Value = result.CodigoPostalDomicilioFiscal, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(100) { Id = "ColoniaDomicilioFiscal", Label = "ColoniaDomicilioFiscal", Value = result.ColoniaDomicilioFiscal, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(100) { Id = "CiudadDomicilioFiscal", Label = "CiudadDomicilioFiscal", Value = result.CiudadDomicilioFiscal, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(100) { Id = "EstadoDomicilioFiscal", Label = "EstadoDomicilioFiscal", Value = result.EstadoDomicilioFiscal, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });
                }

            }
        }

        internal static bool Edit(ItemViewModel model, int userId, ref string errorMessage)
        {

            using (var db2 = new CatalogManagementDBEntities())
            {
                param = new System.Data.Entity.Core.Objects.ObjectParameter("idVenta", typeof(int));
                var result = new Clientes();
                result.IdCliente = model.ItemId;
                result.NombreCliente = model.GetValuePropertieString("NombreCliente");
                result.CalleDomicilioFiscal = model.GetValuePropertieString("CalleDomicilioFiscal");
                result.CiudadDomicilioFiscal = model.GetValuePropertieString("CiudadDomicilioFiscal");
                result.CodigoPostalDomicilioFiscal = model.GetValuePropertieString("CodigoPostalDomicilioFiscal");
                result.ColoniaDomicilioFiscal = model.GetValuePropertieString("ColoniaDomicilioFiscal");

                result.Email = model.GetValuePropertieString("Email");
                result.EstadoDomicilioFiscal = model.GetValuePropertieString("EstadoDomicilioFiscal");
                result.NumeroExteriorDomicilioFiscal = model.GetValuePropertieString("NumeroExteriorDomicilioFiscal");
                result.NumeroInteriorDomicilioFiscal = model.GetValuePropertieString("NumeroInteriorDomicilioFiscal");

                result.RFC = model.GetValuePropertieString("RFC");
                result.Telefono = model.GetValuePropertieString("Telefono");

              //  var resultProductoAgregar = db2.ClienteEditar(result.NombreCliente, result.Email, result.RFC, result.CalleDomicilioFiscal, result.NumeroInteriorDomicilioFiscal, result.NumeroExteriorDomicilioFiscal, result.ColoniaDomicilioFiscal, result.CodigoPostalDomicilioFiscal, result.CiudadDomicilioFiscal, result.EstadoDomicilioFiscal, result.Telefono, result.IdCliente);
                db2.SaveChanges();
                return true;
            }


        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage, out int id)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                param = new System.Data.Entity.Core.Objects.ObjectParameter("idVenta", typeof(int));

                var result = new Clientes();
                result.IdCliente = model.ItemId;
                result.NombreCliente = model.GetValuePropertieString("NombreCliente");
                result.CalleDomicilioFiscal = model.GetValuePropertieString("CalleDomicilioFiscal");
                result.CiudadDomicilioFiscal = model.GetValuePropertieString("CiudadDomicilioFiscal");
                result.CodigoPostalDomicilioFiscal = model.GetValuePropertieString("CodigoPostalDomicilioFiscal");
                result.ColoniaDomicilioFiscal = model.GetValuePropertieString("ColoniaDomicilioFiscal");

                result.Email = model.GetValuePropertieString("Email");
                result.EstadoDomicilioFiscal = model.GetValuePropertieString("EstadoDomicilioFiscal");
                result.NumeroExteriorDomicilioFiscal = model.GetValuePropertieString("NumeroExteriorDomicilioFiscal");
                result.NumeroInteriorDomicilioFiscal = model.GetValuePropertieString("NumeroInteriorDomicilioFiscal");

                result.RFC = model.GetValuePropertieString("RFC");
                result.Telefono = model.GetValuePropertieString("Telefono");
             //   var resultProductoAgregar = db2.ClienteAgregar(result.NombreCliente, result.Email, result.RFC, result.CalleDomicilioFiscal, result.NumeroInteriorDomicilioFiscal, result.NumeroExteriorDomicilioFiscal, result.ColoniaDomicilioFiscal, result.CodigoPostalDomicilioFiscal, result.CiudadDomicilioFiscal, result.EstadoDomicilioFiscal, result.Telefono);

              //  id = resultProductoAgregar.First().Value;
                db2.SaveChanges();
                id = 0;
                return true;
            }


        }
    }
}