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
        /// <summary>
        /// Elementos del listado
        /// </summary>
        public List<Row> Rows { get; set; }


        /// <summary>
        /// Características del modelo
        /// </summary>      
        public void SetAttributes(string title, Operations operation)
        {
            this.Title = title;
            this.OperationIdAction = (int)operation;
        }


    }


}