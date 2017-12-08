using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.Entities
{
    public enum OperationsEnum : int
    {
        IniciodeSesión=1 ,

        //Usuario
        VerUsuarios ,
        EditarUsuarios,
        NuevoUsuario ,

        //Operaciones
        VerOperaciones,

        //Relacional  TODO:Al relacionar agregar opción de seleccionar todo
        AsignarOperaciónaUsuario ,
        
        //FINANZAS------------
        NuevaCompra,
        VerReporteCompras ,
        EliminarCompra ,

        NuevoGasto ,
        VerReporteGastos,
        EditarGasto,
        EliminarGasto,

        VerTipoGasto ,
        EditarTipoGasto ,
        NuevoTipoGasto ,

        VerVentas ,
        NuevaVenta ,
        VerReporteVentas ,

        VerBalance ,

        //CATALOGOS-------------
        VerProductos,
        NuevoProducto ,
        EditarProducto,

        VerProveedores ,
        EditarProveedor ,
        NuevoProveedor ,

        VerClientes,
        EditarCliente ,
        NuevoCliente ,

        VerMarcas,
        EditarMarca,
        NuevaMarca ,

        VerTipoProducto ,
        EditarTipoProducto,
        NuevoTipoProducto ,

        VerTallas ,
        NuevaTalla,
        EditarTalla,

        //REPORTES DEL SUPERTICKET--------------
        VerReporteGananciaTicketSUPERTICKET = 1000,
        VerReporteGananciaProductoSUPERTICKET = 1001,
        VerReporteVentasMesSUPERTICKET = 1002,
        VerReporteVentasSUPERTICKET = 1003
    }


}