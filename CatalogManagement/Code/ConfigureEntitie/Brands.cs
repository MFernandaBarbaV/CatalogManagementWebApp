using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.DBModels;
using CatalogManagement.Models.Entities;

namespace CatalogManagement.Code.ConfigureEntitie
{
    public class Brands : Base
    {
        internal static void GetAll(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                model.SetAttributes("Marcas", (OperationsEnum)operationId, OperationsEnum.NuevoTipoProducto);
                foreach (var item in db2.Marca)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "IdMarca", Value = item.IdMarca.ToString(), ID = item.IdMarca.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Descripcion", Value = item.Descripcion, ID = item.IdMarca.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Editar", ID = item.IdMarca.ToString(), Type = ColumnType.Button, ButtonOperationId = (int)OperationsEnum.EditarMarcas, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog" });

                    model.Rows.Add(row);
                }

            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            var modelBackup = model;
            using (var db2 = new CatalogManagementDBEntities())
            {
                Marca result = null;

                if (itemId == 0)//Nuevo
                {
                    result = new Marca();

                    model.SetAttributes(itemId, "Nueva Marca", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerMarcas);

                }
                else // Editar
                {
                    result = db2.Marca.Where(us => us.IdMarca == itemId).FirstOrDefault();
                    model.SetAttributes(itemId, "Editar Marca", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerMarcas);
                }
                if (modelBackup != null && modelBackup.Properties != null && modelBackup.Properties.Count > 0)
                {
                    result.IdMarca = model.GetValuePropertieInteger("IdMarca");
                    result.Descripcion = model.GetValuePropertieString("Descripcion");
                }

                if (result != null)
                {

                    model.Properties = new List<Propertie>();

                    //   model.Properties.Add(new Propertie() { Id = "IdMarca", Label = "IdMarca", Value = result.IdMarca.ToString(), Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 300, true, true, ref messageValidation), ErrorMessage = messageValidation });
                    model.Properties.Add(new Propertie(30) { Id = "Descripcion", Label = "Descripcion", Value = result.Descripcion, Type = PropertieType.TextBox, RegEx = Utils.GenerateRegex(true, true, true, true, 0, 100, true, true, ref messageValidation), ErrorMessage = messageValidation });

                }

            }
        }

        internal static bool Edit(ItemViewModel model, int userId, ref string errorMessage)
        {

            using (var db2 = new CatalogManagementDBEntities())
            {
                param = new System.Data.Entity.Core.Objects.ObjectParameter("idVenta", typeof(int));
                var result = new Marca();
                result.IdMarca = model.ItemId;
                result.Descripcion = model.GetValuePropertieString("Descripcion");

                var resultProductoAgregar = db2.MarcaModificar(result.Descripcion, result.IdMarca);
                db2.SaveChanges();
                return true;
            }


        }

        internal static bool New(ItemViewModel model, int userId, ref string errorMessage, out int id)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                param = new System.Data.Entity.Core.Objects.ObjectParameter("idVenta", typeof(int));

                var result = new Marca();
                result.IdMarca = model.ItemId;
                result.Descripcion = model.GetValuePropertieString("Descripcion");
                var resultProductoAgregar = db2.MarcaAgregar(result.Descripcion);
                id = resultProductoAgregar.First().Value;
                db2.SaveChanges();

                return true;
            }


        }
    }
}