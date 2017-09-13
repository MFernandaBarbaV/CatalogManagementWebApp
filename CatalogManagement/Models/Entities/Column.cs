using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.Entities
{
    public class Column
    {
        public string ID { get; set; }

        public string Value { get; set; }

        public bool BooleanValue { get; set; }

        public string ColumnHeader { get; set; }

        public ColumnType Type { get; set; }



        public string ButtonText { get; set; }

        public string ButtonAction { get; set; }

        public string ButtonController { get; set; }

        public bool ButtonDissabled { get; set; }

        public int ButtonOperationId { get; set; }

        /// <summary>
        /// Para el comboBox
        /// </summary>
        public Dictionary<int, string> MultipleValues { get; set; }

        public Column()
        {
            Type = ColumnType.Text;
        }
    }

    public enum ColumnType
    {
        Text, Button, CheckBox, ComboBox
    }
}