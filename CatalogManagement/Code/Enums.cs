using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.Entities
{
    public enum OperationsEnum : int
    {
        IniciodeSesión = 0,
        CerrarSesionUsuario = 1,
        
        //Usuario
        VerUsuarios = 2,
        EditarUsuarios = 3,
        NuevoUsuario = 4,
        EliminarUsuarios = 5,
              
        //Operaciones
        VerOperaciones = 10,    
        
        //Reportes
        VerReporteGastos = 22,
        VerReporteCompras = 23,

        //Relacional
        AsignarOperaciónaUsuario = 27,
        AsignarReporteaUsuario = 28, 

        //Punto de venta
        NuevaCompra = 31,     
        NuevoGasto = 32,
        VerCompras = 33,
        VerGastos = 34,
        Dashboard = 35,
        EditarGasto = 36,
        EliminarGasto = 37,
        VerTipoGasto = 38,
        EditarTipoGasto = 39,
        NuevoTipoGasto = 40,

        VerVentas = 41,
        NuevaVenta = 42,
        VerProductos = 43,
        NuevoProducto = 44,
     
        EliminarCompra = 46,
        VerBalance = 47,
        VerReporteVentas = 48,
       
        EditarProducto = 50,
        VerProveedores = 51,
        VerClientes = 52,
        VerMarcas = 53,
        VerTipoProducto = 54,
        VerTallas = 55,
        EditarProveedor = 56,
        NuevoProveedor = 57,
        EditarCliente = 58,
        NuevoCliente = 59,
        EditarMarca = 60,
        NuevaMarca = 61,
        EditarTipoProducto = 62,
        NuevoTipoProducto = 63,
        VerReporteGananciaTicketSUPERTICKET = 64,
        VerReporteGananciaProductoSUPERTICKET = 65,
        VerReporteVentasMesSUPERTICKET = 66,
        VerReporteVentasSUPERTICKET = 67
    }

 
}