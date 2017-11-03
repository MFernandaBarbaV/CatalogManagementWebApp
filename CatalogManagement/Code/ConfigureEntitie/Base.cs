using CatalogManagement.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CatalogManagement.Code.ConfigureEntitie
{
    public  class Base
    {
        public static Row row { get; set; }

        public static string messageValidation = string.Empty;

       public static System.Data.Entity.Core.Objects.ObjectParameter param = null;
    }
}
