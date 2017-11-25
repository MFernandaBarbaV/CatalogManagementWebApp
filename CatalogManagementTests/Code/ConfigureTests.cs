using Microsoft.VisualStudio.TestTools.UnitTesting;
using CatalogManagement.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CatalogManagement.Models.Entities;
using CatalogManagement.Models.ViewModels;

namespace CatalogManagement.Code.Tests
{
    [TestClass()]
    public class ConfigureTests
    {

        /// <summary>
        /// Método para cargar la información de un catálogo según la operación
        /// </summary>
        [TestMethod()]
        public void LoadViewCatalogTest()
        {
            try
            {
                var instance = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
                string errorMessage = string.Empty;
                Models.ViewModels.ListItemsViewModel model = new Models.ViewModels.ListItemsViewModel();

                foreach (OperationsEnum operationId in Enum.GetValues(typeof(OperationsEnum)))
                {
                    model = new Models.ViewModels.ListItemsViewModel();

                    Configure.LoadViewCatalog(ref model, (int)operationId, ref errorMessage);

                    if (!string.IsNullOrEmpty(errorMessage))
                    {
                        Assert.AreEqual(errorMessage.Contains("Modulo no implementado en Configure"), true, operationId.ToString("g") + " " + errorMessage);
                        continue;
                    }
                    int count = model.Rows.Count();
                    Assert.AreNotEqual(0, count, $"{operationId.ToString("g")} - No hubo elementos");

                }
            }
            catch (Exception ex)
            {
                Assert.Fail(ex.Message);
            }
        }

        /// <summary>
        /// Método para cargar la información de un elemento según la operación
        /// </summary>
        [TestMethod()]
        public void LoadItemDataTest()
        {
            try
            {
                var instance = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
                string errorMessage = string.Empty;
                Models.ViewModels.ItemViewModel model = new Models.ViewModels.ItemViewModel();
                int itemId = 0;// 0 para nuevo, # para editar

                foreach (OperationsEnum operationId in Enum.GetValues(typeof(OperationsEnum)))
                {
                    model = new Models.ViewModels.ItemViewModel();
                    Configure.LoadItemData(ref model, (int)operationId, itemId, ref errorMessage);

                    if (!string.IsNullOrEmpty(errorMessage))
                    {
                        Assert.AreEqual(errorMessage.Contains("Modulo no implementado en Configure"), true, operationId.ToString("g") + " " + errorMessage);
                        continue;
                    }
                    int count = model.Properties.Count();
                    Assert.AreNotEqual(0, count, $"{operationId.ToString("g")} - No hubo elementos");

                }
            }
            catch (Exception ex)
            {
                Assert.Fail(ex.Message);
            }
        }


        /// <summary>
        /// Método para cargar la información de un elemento según la operación
        /// </summary>
        [TestMethod()]
        public void InsertItemDataTest()
        {
            var instance = System.Data.Entity.SqlServer.SqlProviderServices.Instance;

            string errorMessage = string.Empty;

            Models.ViewModels.ItemViewModel model = new Models.ViewModels.ItemViewModel();

            int itemId = 0;// 0 para nuevo, # para editar

            foreach (OperationsEnum operationId in Enum.GetValues(typeof(OperationsEnum)))
            {
                model = new Models.ViewModels.ItemViewModel();
                //obtengo el modelo
                errorMessage = string.Empty;

                if (operationId.ToString("g").ToLower().Contains("edit"))
                    itemId = 1;// 0 para nuevo, # para editar
                else if (operationId.ToString("g").ToLower().Contains("nuev"))
                    itemId = 0;// 0 para nuevo, # para editar

                Configure.LoadItemData(ref model, (int)operationId, itemId, ref errorMessage);



                if (!string.IsNullOrEmpty(errorMessage))
                {
                    Assert.AreEqual(errorMessage.Contains("Modulo no implementado en Configure"), true, operationId.ToString("g") + " " + errorMessage);
                    continue;
                }
                //reviso el modelo
                int count = model.Properties.Count();
                Assert.AreNotEqual(0, count, $"{operationId.ToString("g")} - No hubo elementos");

                //llenado de datos fake
                foreach (var propertie in model.Properties)
                {
                    switch (propertie.Type)
                    {
                        case PropertieType.CheckBox:
                            propertie.BooleanValue = true;
                            break;
                        case PropertieType.ComboBox:
                            propertie.ObjectValue = propertie.MultipleValues.First(i => i.Key != 0);
                            break;
                        case PropertieType.Date:
                            propertie.DateValue = DateTime.Now;
                            break;
                        case PropertieType.Money:
                            propertie.Value = "1.5";
                            break;
                        case PropertieType.Password:
                            propertie.Value = GetString(operationId.ToString(), propertie.MaxLenght);
                            break;
                        case PropertieType.TextBox:
                            propertie.Value = GetString(operationId.ToString(), propertie.MaxLenght);
                            break;
                        default:
                            break;

                    };
                }

                //guardado
                if (!Configure.SaveItem(ref model, ref errorMessage, 1))
                {
                    Assert.Fail(operationId + " " + errorMessage);
                }
                else
                {
                    if (model.ItemId == 0)
                    {
                        Assert.Fail(operationId + " ES CEROO!");
                    }

                    ItemViewModel newmodel = new ItemViewModel();
                    Configure.LoadItemData(ref newmodel, (int)operationId, model.ItemId, ref errorMessage);

                    //aquí comparar los datos

                    for (int i = 0; i < newmodel.Properties.Count; i++)
                    {
                        if (newmodel.Properties[i].Value != model.Properties[i].Value)
                        {
                            if (newmodel.Properties[i].Type == PropertieType.Money)
                            {

                            }
                            else if (newmodel.Properties[i].Type == PropertieType.Date)
                            {
                                //TODO:ESTO LUEGO
                            }
                            else if (double.TryParse(newmodel.Properties[i].Value, out double res) && double.TryParse(model.Properties[i].Value, out double res2))
                            {
                               // Assert.AreEqual(res, res2, operationId + $": La propiedad {newmodel.Properties[i].Label} no se guardó correctamente. {model.Properties[i].Value} vs {newmodel.Properties[i].Value}");
                            }
                            else
                            {
                                Assert.Fail(operationId + $": La propiedad {newmodel.Properties[i].Label} no se guardó correctamente. {model.Properties[i].Value} vs {newmodel.Properties[i].Value}");
                            }
                        }
                    }
                }
            }

        }

        private string GetString(string seed, int Lenght)
        {
            return $"abc{seed}ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789ABCDEFGHIJ0123456789"
                .Substring(0, Lenght);
        }

        /// <summary>
        /// Método para cargar la información de una relación según la operación
        /// </summary>
        [TestMethod()]
        public void LoadRelationDataTest()
        {
            try
            {
                string errorMessage = string.Empty;
                int itemId = 1;
                RelationViewModel model = new RelationViewModel();
                foreach (OperationsEnum operationId in Enum.GetValues(typeof(OperationsEnum)))
                {
                    model = new RelationViewModel();
                    Configure.LoadRelationData(ref model, (int)operationId, itemId, ref errorMessage);

                    if (!string.IsNullOrEmpty(errorMessage))
                    {
                        Assert.AreEqual(errorMessage.Contains("Modulo no implementado en Configure"), true, operationId.ToString("g") + " " + errorMessage);
                        continue;
                    }
                    int count = model.Items.Count();
                    Assert.AreNotEqual(0, count, $"{operationId.ToString("g")} - No hubo elementos");

                }
            }
            catch (Exception ex)
            {
                Assert.Fail(ex.Message);
            }
        }

        /// <summary>
        /// Método para cargar la información de un catálogo según la operación
        /// </summary>
        [TestMethod()]
        public void LoadDataReportTest()
        {
            try
            {
                string errorMessage = string.Empty;

                ReportViewModel model = new ReportViewModel();
                foreach (OperationsEnum operationId in Enum.GetValues(typeof(OperationsEnum)))
                {
                    model = new ReportViewModel();

                    Configure.LoadDataReport(ref model, (int)operationId, ref errorMessage, false);

                    if (!string.IsNullOrEmpty(errorMessage))
                    {
                        Assert.AreEqual(errorMessage.Contains("Modulo no implementado en Configure"), true, operationId.ToString("g") + " " + errorMessage);
                        continue;
                    }
                    int count = model.Rows.Count();
                    Assert.AreNotEqual(0, count, $"{operationId.ToString("g")} - No hubo elementos");

                }
            }
            catch (Exception ex)
            {
                Assert.Fail(ex.Message);
            }
        }
    }
}