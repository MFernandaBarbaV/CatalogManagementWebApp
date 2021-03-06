﻿using CatalogManagement.Models.Entities;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.ViewModels
{
    /// <summary>
    /// Modelo para mostrar un formulario
    /// </summary>
    public class ItemViewModel : ViewTemplate
    {
        /// <summary>
        /// Propiedades a mostrar en el formulario
        /// </summary>
        public List<Propertie> Properties { get; set; }

        /// <summary>
        /// Características del modelo
        /// </summary>      
        public void SetAttributes(int itemId, string title, string buttonText, string buttonAction, string buttonController, OperationsEnum operationIdAction, OperationsEnum operationIdToReturn)
        {
            this.ItemId = itemId;
            this.Title = title;
            this.ButtonText = buttonText;
            this.ButtonAction = buttonAction;
            this.ButtonController = buttonController;
            this.OperationIdAction = (int)operationIdAction;
            this.OperationIdToReturn = (int)operationIdToReturn;
        }

        public string GetValuePropertieString(string id)
        {
            try
            {
                if (Properties == null || Properties.Count == 0)
                    return string.Empty;

                var prop = Properties.FirstOrDefault(p => p.Id.ToLower().Trim() == id.ToLower().Trim());

                if (prop == null)
                    return string.Empty;

                if (prop.Type == PropertieType.CheckBox)
                    return prop.BooleanValue.ToString();
                else if (prop.Type == PropertieType.ComboBox)
                    return prop.Value;
                else if (prop.Type == PropertieType.Password)
                    return ((string[])prop.ObjectValue)[0];
                else if (prop.Type == PropertieType.TextBox)
                    return prop.Value;
                else
                    return string.Empty;
            }
            catch (Exception ex)
            {
                Debug.WriteLine("GetValuePropertieString Exception: " + ex.Message);
                return string.Empty;
            }
        }

        public DateTime GetValuePropertieDateTime(string id)
        {
            try
            {
                if (Properties == null || Properties.Count == 0)
                    return DateTime.MinValue;

                var prop = Properties.FirstOrDefault(p => p.Id.ToLower().Trim() == id.ToLower().Trim());

                if (prop == null)
                    return DateTime.MinValue;

                return prop.DateValue;
            }
            catch (Exception EX)
            {
                Debug.WriteLine("GetValuePropertieInteger Exception: " + EX.Message);
                return DateTime.MinValue;
            }
        }

        public bool? GetValuePropertieBoolean(string id)
        {
            try
            {
                if (Properties == null || Properties.Count == 0)
                    return null;

                var prop = Properties.FirstOrDefault(p => p.Id.ToLower().Trim() == id.ToLower().Trim());

                if (prop == null)
                    return null;

                if (prop.Type == PropertieType.CheckBox)
                    return prop.BooleanValue;

                else
                    return null;
            }
            catch (Exception EX)
            {
                Debug.WriteLine("GetValuePropertieInteger Exception: " + EX.Message);
                return null;
            }
        }

        public int GetValuePropertieInteger(string id)
        {
            try
            {
                if (Properties == null || Properties.Count == 0)
                    return -1;

                var prop = Properties.FirstOrDefault(p => p.Id.ToLower().Trim() == id.ToLower().Trim());

                if (prop == null)
                    return -1;

                else if (prop.Type == PropertieType.ComboBox)
                {

                    if (prop.ObjectValue.GetType() == typeof(System.String[]))
                        return int.Parse(((String[])prop.ObjectValue)[0]);
                    if (prop.ObjectValue.GetType() == typeof(KeyValuePair<int, string>))
                        return ((KeyValuePair<int, string>)prop.ObjectValue).Key;
                    if (prop.Value != null)
                        return int.Parse(prop.Value);
                    else
                        return -1;
                }
                else if (prop.Type == PropertieType.TextBox)
                    return int.Parse(prop.Value);
                else if (prop.Type == PropertieType.Money)
                    return int.Parse(prop.Value);
                else
                    return -1;
            }
            catch (FormatException fe)
            {
                Debug.WriteLine("Una de las propiedades no tiene Id." + fe.Message);
                return -1;
            }
            catch (Exception EX)
            {
                Debug.WriteLine("GetValuePropertieInteger Exception: " + EX.Message);
                return -1;
            }
        }

        public decimal GetValuePropertieDecimal(string id)
        {
            try
            {
                if (Properties == null || Properties.Count == 0)
                    return 0;

                var prop = Properties.FirstOrDefault(p => p.Id.ToLower().Trim() == id.ToLower().Trim());

                if (prop == null)
                    return 0;

                else if (prop.Type == PropertieType.ComboBox)
                {
                    if (prop.Value != null)
                        return int.Parse(prop.Value);
                    if (prop.ObjectValue.GetType() == typeof(System.String[]))
                        return int.Parse(((String[])prop.ObjectValue)[0]);
                    else
                        return 0;
                }
                else if (prop.Type == PropertieType.TextBox)
                    return int.Parse(prop.Value);
                else if (prop.Type == PropertieType.Money)
                    return decimal.Parse(prop.Value);
                else
                    return 0;
            }
            catch (Exception EX)
            {
                Debug.WriteLine("GetValuePropertieInteger Exception: " + EX.Message);
                return 0;
            }
        }

        public byte GetValuePropertieByte(string id)
        {
            try
            {
                if (Properties == null || Properties.Count == 0)
                    return 0;

                var prop = Properties.FirstOrDefault(p => p.Id.ToLower().Trim() == id.ToLower().Trim());

                if (prop == null)
                    return 0;

                else if (prop.Type == PropertieType.ComboBox)
                {
                   
                    if (prop.ObjectValue.GetType() == typeof(System.String[]))
                        return byte.Parse(((String[])prop.ObjectValue)[0]);
                    if (prop.Value != null)
                        return byte.Parse(prop.Value);
                    else
                        return 0;
                }
                else if (prop.Type == PropertieType.TextBox)
                    return byte.Parse(prop.Value);
                else
                    return 0;
            }
            catch (Exception EX)
            {
                Debug.WriteLine("GetValuePropertieInteger Exception: " + EX.Message);
                return 0;
            }
        }
    }



}