using System;
using CatalogManagement.Models.ViewModels;
using CatalogManagement.Models.Entities;
using System.Collections.Generic;
using CatalogManagement.DBModels;
using System.Linq;


namespace CatalogManagement.Code.ConfigureEntitie
{
    internal class AccessTemplates : Base
    {
        internal static void GetAccessTemplatesCatalog(ref ListItemsViewModel model, int operationId, ref string errorMessage)
        {

            using (var db = new CatalogManagementDBModel())
            {
                model.SetAttributes("Plantillas de Acceso", (OperationsEnum)operationId, OperationsEnum.NuevaPlantilladeAcceso );
                foreach (var item in db.mAccessTemplates)
                {
                    row = new Row();
                    row.Columns = new List<Column>();
                    row.Columns.Add(new Column() { ColumnHeader = "Id", Value = item.AccessTemplateID.ToString(), ID = item.AccessTemplateID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Nombre", Value = item.Name.ToString(), ID = item.AccessTemplateID.ToString() });

                    row.Columns.Add(new Column() { ColumnHeader = "Lunes", Value = LoadDayTemplate(item.Monday), ID = item.AccessTemplateID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Martes", Value = LoadDayTemplate(item.Tuesday), ID = item.AccessTemplateID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Miércoles", Value = LoadDayTemplate(item.Wednesday), ID = item.AccessTemplateID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Jueves", Value = LoadDayTemplate(item.Thursday), ID = item.AccessTemplateID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Viernes", Value = LoadDayTemplate(item.Friday), ID = item.AccessTemplateID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Sábado", Value = LoadDayTemplate(item.Saturday), ID = item.AccessTemplateID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Domingo", Value = LoadDayTemplate(item.Sunday), ID = item.AccessTemplateID.ToString() });
                    row.Columns.Add(new Column() { ColumnHeader = "Editar", Value = item.AccessTemplateID.ToString(), ID = item.AccessTemplateID.ToString(), Type = ColumnType.Button, ButtonText = "Editar", ButtonAction = "LoadItemData", ButtonController = "Catalog", ButtonDissabled = item.IsReadOnly, ButtonOperationId = (int)OperationsEnum.EditarPlantillasdeAcceso });

                    model.Rows.Add(row);
                }
            }

          
        }

     

        public static string LoadDayTemplate(string hexstring)
        {
            string first = string.Empty, last = string.Empty;

            int cont, value = Convert.ToInt32(hexstring, 16);

            for (cont = 0; cont < 24; cont++)
            {
                if ((value & (1 << cont)) == (1 << cont))
                {
                    if (string.IsNullOrEmpty(first))
                        first = cont.ToString() + ":00 - ";
                    last = (cont).ToString() + ":59 hrs";
                }
            }

            return first + last;
        }

        public static string LoadDayTemplate(string hexstring, ref int firstHour, ref int lastHour)
        {
            if (string.IsNullOrEmpty(hexstring))
                hexstring = "03FE00";

            string first = string.Empty, last = string.Empty;

            int cont, value = Convert.ToInt32(hexstring, 16);

            for (cont = 0; cont < 24; cont++)
            {
                if ((value & (1 << cont)) == (1 << cont))
                {
                    if (string.IsNullOrEmpty(first))
                    {
                        firstHour = cont;
                        first = cont.ToString() + ":00 - ";
                    }

                    last = (cont).ToString() + ":59 hrs";
                    lastHour = cont;
                }
            }

            return first + last;
        }

        internal static void GetData(ref ItemViewModel model, int operationId, int itemId, ref string errorMessage)
        {
            using (var db = new CatalogManagementDBModel())
            {
                #region EditarPlantillasdeAcceso
                {
                    mAccessTemplates resultAccessTemplate = null;

                    Dictionary<int, string> horariosInicio = new Dictionary<int, string>();
                    Dictionary<int, string> horariosFin = new Dictionary<int, string>();

                    for (int i = 1; i < 24; i++)
                    {
                        horariosInicio.Add(i, i + ":00 hrs");
                    }

                    for (int i = 1; i < 24; i++)
                    {
                        horariosFin.Add(i, i + ":59 hrs");
                    }

                    if (itemId == 0)//Nuevo
                    {
                        resultAccessTemplate = new mAccessTemplates();
                        model.SetAttributes(itemId, "Nueva Plantilla de Acceso", "Guardar", "New", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerPlantillasdeAcceso);

                    }
                    else // Editar
                    {
                        resultAccessTemplate = db.mAccessTemplates.FirstOrDefault(at => at.AccessTemplateID == itemId);
                        model.SetAttributes(itemId, "Editar Plantilla de Acceso", "Guardar", "Edit", "Catalog", (OperationsEnum)operationId, OperationsEnum.VerPlantillasdeAcceso);
                    }

                    if (resultAccessTemplate != null)
                    {
                        model.Properties = new List<Propertie>();
                        model.Properties.Add(new Propertie() { Id = "Name", Label = "Nombre", Value = resultAccessTemplate.Name, RegEx = Utils.GenerateRegex(true, true, true, true, 1, 30, true, true, ref messageValidation), ErrorMessage = messageValidation });

                        int init = 0, end = 0;
                        LoadDayTemplate(resultAccessTemplate.Monday, ref init, ref end);
                        model.Properties.Add(new Propertie() { Id = "Monday", Label = "Lunes", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                        model.Properties.Add(new Propertie() { Id = "MondayInit", Label = "Hora inicial de Lunes", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                        model.Properties.Add(new Propertie() { Id = "MondayEnd", Label = "Hora final de Lunes", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                        LoadDayTemplate(resultAccessTemplate.Tuesday, ref init, ref end);
                        model.Properties.Add(new Propertie() { Id = "Tuesday", Label = "Martes", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                        model.Properties.Add(new Propertie() { Id = "TuesdayInit", Label = "Hora inicial de Martes", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                        model.Properties.Add(new Propertie() { Id = "TuesdayEnd", Label = "Hora final de Martes", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                        LoadDayTemplate(resultAccessTemplate.Wednesday, ref init, ref end);
                        model.Properties.Add(new Propertie() { Id = "Wednesday", Label = "Miércoles", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                        model.Properties.Add(new Propertie() { Id = "WednesdayInit", Label = "Hora inicial de Miércoles", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                        model.Properties.Add(new Propertie() { Id = "WednesdayEnd", Label = "Hora final de Miércoles", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                        LoadDayTemplate(resultAccessTemplate.Thursday, ref init, ref end);
                        model.Properties.Add(new Propertie() { Id = "Thursday", Label = "Jueves", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                        model.Properties.Add(new Propertie() { Id = "ThursdayInit", Label = "Hora inicial de Jueves", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                        model.Properties.Add(new Propertie() { Id = "ThursdayEnd", Label = "Hora final de Jueves", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                        LoadDayTemplate(resultAccessTemplate.Friday, ref init, ref end);
                        model.Properties.Add(new Propertie() { Id = "Friday", Label = "Viernes", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                        model.Properties.Add(new Propertie() { Id = "FridayInit", Label = "Hora inicial de viernes", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                        model.Properties.Add(new Propertie() { Id = "FridayEnd", Label = "Hora final de viernes", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                        LoadDayTemplate(resultAccessTemplate.Saturday, ref init, ref end);
                        model.Properties.Add(new Propertie() { Id = "Saturday", Label = "Sábado", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                        model.Properties.Add(new Propertie() { Id = "SaturdayInit", Label = "Hora inicial de Sábado", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                        model.Properties.Add(new Propertie() { Id = "SaturdayEnd", Label = "Hora final de Sábado", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });

                        LoadDayTemplate(resultAccessTemplate.Sunday, ref init, ref end);
                        model.Properties.Add(new Propertie() { Id = "Sunday", Label = "Domingo", Value = init.ToString(), Type = PropertieType.CheckBox, ClassIcon = faIconss.hand });
                        model.Properties.Add(new Propertie() { Id = "SundayInit", Label = "Hora inicial de Domingo", Value = init.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosInicio });
                        model.Properties.Add(new Propertie() { Id = "SundayEnd", Label = "Hora final de Domingo", Value = end.ToString(), Type = PropertieType.ComboBox, MultipleValues = horariosFin });


                    }
                }
                #endregion
            }
        }
      
    }
}