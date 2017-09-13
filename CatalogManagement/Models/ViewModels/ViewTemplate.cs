using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.ViewModels
{
    public abstract class ViewTemplate
    {
        /// <summary>
        /// Titulo de la vista
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// Identificador del elemento actual (si aplica)
        /// </summary>
        public int ItemId { get; set; }

        /// <summary>
        /// Operación de la acción a realizar
        /// </summary>
        public int OperationIdAction { get; set; }

        /// <summary>
        /// Operación que se aplicará cuando se realize la acción
        /// </summary>
        public int OperationIdToReturn { get; set; }

        /// <summary>
        /// Texto del botón
        /// </summary>
        public string ButtonText { get; set; }

        /// <summary>
        /// Nombre del método
        /// </summary>
        public string ButtonAction { get; set; }
        
        /// <summary>
        /// Nombre del controlador
        /// </summary>
        public string ButtonController { get; set; }
    }

  
}