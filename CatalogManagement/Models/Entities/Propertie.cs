using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.Entities
{
    public class Propertie
    {


        public string Id { get; set; }

        public string Label { get; set; }

        private string _value;
        public string Value
        {
            get
            {
                if (ObjectValue != null && ObjectValue.GetType() == typeof(KeyValuePair<int, String>))
                {
                    return ((KeyValuePair<int, String>)ObjectValue).Key.ToString();
                }

                if (string.IsNullOrEmpty(_value))
                {
                    if (ObjectValue != null)
                        return ObjectValue.ToString();
                    if (DateValue != DateTime.MinValue)
                        return DateValue.ToString();
                    if (DecimalValue != decimal.MinValue)
                        return DecimalValue.ToString();
                }

                return _value;
            }
            set { _value = value; }
        }

        public bool BooleanValue
        {
            get
            {
                bool val = false;
                if (!string.IsNullOrEmpty(Value) && bool.TryParse(Value.ToString(), out val))
                {
                    return val;
                }
                else
                    return false;
            }
            set { Value = value.ToString(); }
        }

        public DateTime DateValue { get; set; }

        public object ObjectValue { get; set; }

        public string RegEx { get; set; }

        public string ClassIcon { get; set; }

        public string ErrorMessage { get; set; }

        public PropertieType Type { get; set; }

        public Dictionary<int, string> MultipleValues { get; set; }

        public bool IsEnabled { get; set; }



        [DisplayFormat(DataFormatString = "{0:C0}", ApplyFormatInEditMode = true)]
        public decimal DecimalValue { get; internal set; }

        public List<Propertie> InnerProperties { get; set; }


        public bool IsDissabled { get { return !IsEnabled; } }

        public int MaxLenght { get; private set; }
        public int MinLenght { get; private set; }

        public Propertie()
        {
            ClassIcon = faIconss.pencil;
            IsEnabled = true;

        }

        private void GenerateRegex(bool numbers, bool spaces, int minLenght, int maxLenght, bool specialChars)
        {

            bool accent = true;
            bool aphabeticLower = true;
            bool alphabeticUpper = true;

            this.MaxLenght = maxLenght;
            this.MinLenght = minLenght;

            string tempRegex = (alphabeticUpper ? "A-ZÑ" : "") +
                                (aphabeticLower ? "a-zñ" : "") +
                                (numbers ? "0-9" : "") +
                                (spaces ? @"\s" : "") +
                                (specialChars ? @".,\-/&\"";:*/°/$/_/#/|@<>()/\^+~¿¡?=%/|/=/~/¬/!/¿/¡/?/(/)/@/</>/[\]/{/}/+\\/^" : "") +
                                (accent & alphabeticUpper ? "ÁÉÍÓÚ" : "") +
                                (accent & aphabeticLower ? "áéíóú" : "");

            this.RegEx = "^([" + tempRegex + "]{" + minLenght + "," + maxLenght + "})$";
            ErrorMessage = "El campo no acepta: " +
                                            (alphabeticUpper ? "" : "Mayúsculas A-Z, ") +
                                            (aphabeticLower ? "" : "Minúsculas a-z, ") +
                                            (accent ? "" : "Acentos, ") +
                                            (numbers ? "" : "Números 0-9, ") +
                                            (spaces ? "" : "Espacios, ") +
                                            (specialChars ? "" : @"Caracteres especiales:  .,:;-=*+°_{}()[]¿?¡!#$%&^*~¬\/|") +
                                            " y una longitud de " + minLenght + " a " + maxLenght + " caracteres.";




        }

        public Propertie(int maxLenght, int minLenght = 0)
        {
            this.MaxLenght = maxLenght;
            this.MinLenght = minLenght;
        }


    }

    public enum PropertieType
    {
        TextBox, ComboBox, CheckBox, Password, ConfirmPassword,
        Date, Money, InnerPropertie,
        Line
    }

    public static class faIconss
    {
        public static string pencil = "fa fa-pencil";
        public static string application = "fa fa-desktop";
        public static string user = "fa fa-user";
        public static string profile = "fa fa-user-circle-o";
        public static string operation = "fa fa-cubes";
        public static string gendle = "fa fa-venus-mars";
        public static string status = "fa fa-list";
        public static string date = "fa fa-calendar";
        public static string email = "fa fa-envelope";
        public static string password = "fa fa-lock";
        public static string search = "fa fa-search";
        public static string hand = "fa fa-hand-o-up";
        public static string money = "fa fa-money";
        public static string filter = "fa fa-filter";
        public static string bookmark = "fa fa-bookmark-o";
        public static string shopping = "fa fa-shopping-cart ";
    }

}