using System;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.Models.Entities;
using System.Collections.Generic;
using CatalogManagement.DBModels;
using System.Linq;

namespace CatalogManagement.Code.ConfigureEntitie
{
    internal class Products : Base
    {
        internal static void GetProductsCatalog(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {
            using (var db2 = new CatalogManagementDBEntities())
            {
                model.SetAttributes("Productos", (OperationsEnum)operationId, OperationsEnum.NuevoProducto);
                foreach (var item in db2.Producto)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "IdProducto", Value = item.IdProducto.ToString(), ID = item.IdProducto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Codigo", Value = item.Codigo.ToString(), ID = item.IdProducto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Descripcion", Value = item.Descripcion.ToString(), ID = item.IdProducto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Marca", Value = item.Marca.Descripcion.ToString(), ID = item.IdProducto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Tipo Producto", Value = item.TipoProducto.Descripcion.ToString(), ID = item.IdProducto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Sub Tipo Producto", Value = item.SubTipoProducto.Descripcion.ToString(), ID = item.IdProducto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Cantidad", Value = item.Cantidad.ToString(), ID = item.IdProducto.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Editar", ID = item.IdProducto.ToString(), Type = ColumnType.Button, ButtonOperationId = (int)OperationsEnum.EditarProducto, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog" });
                    model.Rows.Add(row);
                }

            }
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            var modelBackup = model;
            using (var db2 = new CatalogManagementDBEntities())
            {
                Producto result = null;

                if (itemId == 0)//Nuevo
                {
                    result = new Producto();

                    model.SetAttributes(itemId, "Nuevo Producto", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerProductos);

                }
                else // Editar
                {
                    result = db2.Producto.Where(us => us.IdProducto == itemId).FirstOrDefault();
                    model.SetAttributes(itemId, "Editar Producto", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerProductos);
                }
                if (modelBackup != null && modelBackup.Properties != null && modelBackup.Properties.Count > 0)
                {
                    result.Codigo = model.GetValuePropertieString("Codigo");
                    result.Descripcion = model.GetValuePropertieString("Descripcion");
                    result.IdGenero = model.GetValuePropertieInteger("IdGenero");
                    result.IdProducto = model.ItemId;
                    result.IdMarca = model.GetValuePropertieInteger("IdMarca");
                    result.IdProveedor = model.GetValuePropertieInteger("IdProveedor");
                    result.IdSubTipoProducto = model.GetValuePropertieInteger("IdSubTipoProducto");
                    result.IdTalla = model.GetValuePropertieInteger("IdTalla");
                    result.IdTipoProducto = model.GetValuePropertieInteger("IdTipoProducto");
                }

                if (result != null)
                {

                    model.Properties = new List<Propertie>();

                    model.Properties.Add(new Propertie(50) { Id = "Codigo", Label = "Codigo", Value = result.Codigo, Type = PropertieType.TextBox });
                    model.Properties.Add(new Propertie(500) { Id = "Descripcion", Label = "Descripcion", Value = result.Descripcion, Type = PropertieType.TextBox });

                    Dictionary<int, string> genero = new Dictionary<int, string>();
                    genero.Add(0, "--Seleccionar--");
                    foreach (var item in db2.Genero)
                    {
                        genero.Add(item.IdGenero, item.Descripcion);
                    }
                    model.Properties.Add(new Propertie() { Id = "IdGenero", Label = "Genero", Type = PropertieType.ComboBox, MultipleValues = genero, Value = result.IdGenero.ToString() });

                    Dictionary<int, string> marcas = new Dictionary<int, string>();
                    marcas.Add(0, "--Seleccionar--");
                    foreach (var item in db2.Marca)
                    {
                        marcas.Add(item.IdMarca, item.Descripcion);
                    }
                    model.Properties.Add(new Propertie() { Id = "IdMarca", Label = "Marca", Type = PropertieType.ComboBox, MultipleValues = marcas, Value = result.IdMarca.ToString() });

                    Dictionary<int, string> proveedores = new Dictionary<int, string>();
                    proveedores.Add(0, "--Seleccionar--");
                    foreach (var item in db2.Proveedor)
                    {
                        proveedores.Add(item.IdProveedor, item.NombreProveedor);
                    }
                    model.Properties.Add(new Propertie() { Id = "IdProveedor", Label = "Proveedor", Type = PropertieType.ComboBox, MultipleValues = proveedores, Value = result.IdProveedor.ToString() });

                    Dictionary<int, string> tipo = new Dictionary<int, string>();
                    tipo.Add(0, "--Seleccionar--");
                    foreach (var item in db2.TipoProducto)
                    {
                        tipo.Add(item.IdTipoProducto, item.Descripcion);
                    }
                    model.Properties.Add(new Propertie() { Id = "IdTipoProducto", Label = "Tipo de Producto", Type = PropertieType.ComboBox, MultipleValues = tipo, Value = result.IdTipoProducto.ToString() });

                    Dictionary<int, string> subtipo = new Dictionary<int, string>();
                    subtipo.Add(0, "--Seleccionar--");
                    foreach (var item in db2.SubTipoProducto)
                    {
                        subtipo.Add(item.IdSubTipoProducto, item.Descripcion);
                    }
                    model.Properties.Add(new Propertie() { Id = "IdSubTipoProducto", Label = "Sub-Tipo de Producto", Type = PropertieType.ComboBox, MultipleValues = subtipo, Value = result.IdSubTipoProducto.ToString() });

                    Dictionary<int, string> tallas = new Dictionary<int, string>();
                    tallas.Add(0, "--Seleccionar--");
                    foreach (var item in db2.Talla)
                    {
                        tallas.Add(item.IdTalla, item.Descripcion);
                    }
                    model.Properties.Add(new Propertie() { Id = "IdTalla", Label = "Talla", Type = PropertieType.ComboBox, MultipleValues = tallas, ObjectValue = new KeyValuePair<int, string>(result.IdTalla, tallas[result.IdTalla]) });

                }
                else
                {

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

                    var producto = new Producto()
                    {
                        Codigo = model.GetValuePropertieString("Codigo"),
                        Descripcion = model.GetValuePropertieString("Descripcion"),
                        IdGenero = model.GetValuePropertieInteger("IdGenero"),
                        IdProducto = model.ItemId,
                        IdMarca = model.GetValuePropertieInteger("IdMarca"),
                        IdProveedor = model.GetValuePropertieInteger("IdProveedor"),
                        IdSubTipoProducto = model.GetValuePropertieInteger("IdSubTipoProducto"),
                        IdTalla = model.GetValuePropertieInteger("IdTalla"),
                        IdTipoProducto = model.GetValuePropertieInteger("IdTipoProducto")
                    };

                    var resultProductoAgregar = db2.ProductoModificar(producto.Descripcion, producto.Codigo, producto.IdTipoProducto, producto.IdSubTipoProducto, producto.IdMarca, producto.IdProveedor, 0, producto.IdUnidad, producto.IdGenero, null, producto.IdProducto);

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

                var producto = new Producto()
                {
                    Codigo = model.GetValuePropertieString("Codigo"),
                    Descripcion = model.GetValuePropertieString("Descripcion"),
                    IdGenero = model.GetValuePropertieInteger("IdGenero"),
                    IdMarca = model.GetValuePropertieInteger("IdMarca"),
                    IdProveedor = model.GetValuePropertieInteger("IdProveedor"),
                    IdSubTipoProducto = model.GetValuePropertieInteger("IdSubTipoProducto"),
                    IdTalla = model.GetValuePropertieInteger("IdTalla"),
                    IdTipoProducto = model.GetValuePropertieInteger("IdTipoProducto")
                };

                var resultProductoAgregar = db2.ProductoAgregar(producto.Descripcion, producto.Codigo, producto.IdTipoProducto, producto.IdSubTipoProducto, producto.IdMarca, producto.IdProveedor, 0, producto.IdGenero, null, producto.PrecioVenta);
                id = resultProductoAgregar.First().Value;
                db2.SaveChanges();

                return true;
            }


        }
    }
}