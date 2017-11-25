using CatalogManagement.DBModels;
using CatalogManagement.Models.Entities;
using CatalogManagement.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Code.ConfigureEntitie
{
    public class ProductTypes : Base
    {
        internal static void GetAll(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                model.SetAttributes("Tipo de producto", (OperationsEnum)operationId, OperationsEnum.NuevoTipoProducto);
                foreach (var item in db2.TipoProducto)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "IdTipoProducto", Value = item.IdTipoProducto.ToString(), ID = item.IdTipoProducto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Descripcion", Value = item.Descripcion, ID = item.IdTipoProducto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Editar", ID = item.IdTipoProducto.ToString(), Type = ColumnType.Button, ButtonOperationId = (int)OperationsEnum.EditarTipoProducto, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog" });

                    model.Rows.Add(row);
                }

            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            var modelBackup = model;
            using (var db2 = new CatalogManagementDBEntities())
            {
                TipoProducto result = null;

                if (itemId == 0)//Nuevo
                {
                    result = new TipoProducto();

                    model.SetAttributes(itemId, "Nuevo Tipo de producto", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerTipoProducto);

                }
                else // Editar
                {
                    result = db2.TipoProducto.Where(us => us.IdTipoProducto == itemId).FirstOrDefault();
                    model.SetAttributes(itemId, "Editar Tipo de producto", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerTipoProducto);
                }
                if (modelBackup != null && modelBackup.Properties != null && modelBackup.Properties.Count > 0)
                {
                    result.IdTipoProducto = model.GetValuePropertieInteger("IdTipoProducto");
                    result.Descripcion = model.GetValuePropertieString("Descripcion");
                }

                if (result != null)
                {

                    model.Properties = new List<Propertie>();
                    model.Properties.Add(new Propertie(50) { Id = "Descripcion", Label = "Descripcion", Value = result.Descripcion, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });

                }

            }
        }

        internal static bool Edit(ItemViewModel model, int userId, ref string errorMessage)
        {

            using (var db2 = new CatalogManagementDBEntities())
            {
                var result = new TipoProducto();
                result.IdTipoProducto = model.ItemId;
                result.Descripcion = model.GetValuePropertieString("Descripcion");

                var resultProductoAgregar = db2.TipoProductoModificar(result.Descripcion, result.IdTipoProducto);
                db2.SaveChanges();
                return true;
            }


        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage, out int id)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                var result = new TipoProducto();
                result.IdTipoProducto = model.ItemId;
                result.Descripcion = model.GetValuePropertieString("Descripcion");
                var resultProductoAgregar = db2.TipoProductoAgregar(result.Descripcion);
                id = resultProductoAgregar.First().Value;
                db2.SaveChanges();

                return true;
            }


        }
    }
}