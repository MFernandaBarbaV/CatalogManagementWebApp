using CatalogManagement.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.ViewModels
{
    /// <summary>
    /// Modelo para relacionar elementos de una tabla, a un elemento de otra. Aplica a tablas relacionales.
    /// </summary>
    public class RelationViewModel : ViewTemplate
    {      

        public List<Row> Items { get; set; }     

        public string NameItem { get; protected set; }

        public string TitlePrincipalElement { get; protected set; }

        public string TitleRelationElement { get; protected set; }



        /// <summary>
        /// Características del modelo
        /// </summary>      
        internal void SetAttributes(string Title, int ItemId, string NameItem, string TitlePrincipalElement, string TitleRelationElement, string ButtonAction, string ButtonController, string ButtonText, int OperationIdAction, int OperationIdToReturn)
        {
            this.Title = Title;
            this.ItemId = ItemId;
            this.NameItem = NameItem;
            this.TitlePrincipalElement = TitlePrincipalElement;
            this.TitleRelationElement = TitleRelationElement;
            this.ButtonAction = ButtonAction;
            this.ButtonController = ButtonController;
            this.ButtonText = ButtonText;

            this.OperationIdAction = OperationIdAction;
            this.OperationIdToReturn = OperationIdToReturn;
        }
    }


}