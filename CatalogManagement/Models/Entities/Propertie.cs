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

        public string Value { get; set; }

        public bool BooleanValue
        {
            get
            {
                bool val = false;
                if (!string.IsNullOrEmpty(Value) &&  bool.TryParse(Value.ToString(), out val))
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

        public bool IsDissabled { get { return !IsEnabled; } }

        [DisplayFormat(DataFormatString = "{0:C0}", ApplyFormatInEditMode = true)]   
        public decimal DecimalValue { get; internal set; }

        public List<Propertie> InnerProperties { get; set; }

        public Propertie()
        {
            ClassIcon = faIconss.pencil;
            IsEnabled = true;
            
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
        public static string pencil =       "fa fa-pencil";
        public static string application =  "fa fa-desktop";
        public static string user =         "fa fa-user";
        public static string profile =      "fa fa-user-circle-o";
        public static string operation =    "fa fa-cubes";
        public static string gendle =       "fa fa-venus-mars";
        public static string status =       "fa fa-list";
        public static string date =         "fa fa-calendar";
        public static string email =        "fa fa-envelope";
        public static string password =     "fa fa-lock";
        public static string search =       "fa fa-search";
        public static string hand =         "fa fa-hand-o-up";
        public static string money = "fa fa-money";
        public static string filter = "fa fa-filter";
        public static string bookmark = "fa fa-bookmark-o";
        public static string shopping = "fa fa-shopping-cart ";
    }
    
}