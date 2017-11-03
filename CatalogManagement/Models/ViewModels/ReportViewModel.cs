using CatalogManagement.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.ViewModels
{
    public class ReportViewModel : ViewTemplate
    {
        /// <summary>
        /// Elementos del listado
        /// </summary>
        public List<Row> Rows { get; set; }

        /// <summary>
        /// Filtros del listado
        /// </summary>
        public List<Filter> Filters { get; set; }

        /// <summary>
        /// Totales
        /// </summary>
        public List<Row> Totales { get; set; }

        /// <summary>
        /// Características del modelo
        /// </summary>      
        public void SetAttributes(string title, string buttonText, string buttonAction, string buttonController,
            OperationsEnum operationIdAction, OperationsEnum operationIdToReturn)
        {
            this.Title = title;
            this.OperationIdAction = (int)operationIdAction;
          
         
            this.ButtonText = buttonText;
            this.ButtonAction = buttonAction;
            this.ButtonController = buttonController;
            this.OperationIdAction = (int)operationIdAction;
            this.OperationIdToReturn = (int)operationIdToReturn;
        }
    }

    public class Filter
    {
        public string Id { get; set; }

        public string ColumnName { get; set; }

        public string Description { get; set; }

        public FilterType Type { get; set; }

        public DateTime DateValue { get; set; }

        public string Value { get; set; }

        public object ObjectValue { get; set; }

      //  public Dictionary<int, string> MultipleValues { get; set; }

        public IEnumerable<KeyValuePair<int,string>> MultipleValues { get; set; }

        public IEnumerable<int> selectedMultipleValues { get; set; }

        public bool IsNulleable { get; set; }

        public string ClassIcon { get; set; }
    }

    public enum FilterType
    {
        Text, Date, Number, Combo
    }
}