﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.Entities
{
    public class MenuItem
    {
        public string Name { get; set; }

        public int OperationId { get; set; }

        public bool IsDropBox { get; set; }

        public bool IsVisible { get; set; }

        public List<MenuItem> InnerItems { get; set; }

        public string Action { get; set; }

        public string Controller { get; set; }

        public string OnSuccess { get; set; }

        public string OnFaliure { get; set; }

        public string Target { get; set; }

        public bool InnerItemsContainsVisible
        {
            get
            {
                if (InnerItems == null || InnerItems.Count == 0)
                    return false;

                if (InnerItems.FirstOrDefault(i=> i.IsVisible) == null)
                    return false;

                return true;
            }
        }

        /// <summary>
        /// Glyphicon or font-awesome
        /// </summary>
        public string Span { get; set; }

        public MenuItem()
        {
            IsVisible = true;
        }
    }
}