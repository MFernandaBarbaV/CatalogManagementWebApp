using CatalogManagement.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.ViewModels
{
    /// <summary>
    /// Modelo para crear un listado de elementos
    /// </summary>
    public class ListItemsViewModel : ViewTemplate
    {
        public int OperationNewItem { get; set; }

        public bool UseNewItemButton { get; set; }

        /// <summary>
        /// Elementos del listado
        /// </summary>
        public List<Row> Rows { get; set; }


       
        /// <summary>
        /// Características del modelo
        /// </summary>      
        public void SetAttributes(string title, OperationsEnum operation)
        {
            this.Title = title;
            this.OperationIdAction = (int)operation;
            this.UseNewItemButton = false;
        }


        /// <summary>
        /// Características del modelo
        /// </summary>      
        public void SetAttributes(string title, OperationsEnum operation, OperationsEnum operationNewItem)
        {
            this.Title = title;
            this.OperationIdAction = (int)operation;
            this.ButtonText = "Nuevo";
            this.OperationNewItem = (int)operationNewItem;
            this.UseNewItemButton = true;
            this.ButtonAction = "NewItem";
            this.ButtonController = "Catalog";
        }

        public ListItemsViewModel()
        {
            Rows = new List<Row>();
        }
       
    }


}