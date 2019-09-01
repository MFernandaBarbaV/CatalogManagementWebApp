using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.Entities
{
    public enum OperationsEnum : int
    {
        IniciarSesion,

        HacerVenta = 1,
        EliminarVenta,
        DarDescuentoEnVenta,
        EliminarPagoEnVenta,

        VerProductos,
        NuevoProducto,
        EditarProducto,
        EliminarProducto,
        VerCostoProducto,

        VerClientes,
        NuevoCliente,
        EditarCliente,
        EliminarCliente,

        VerProveedores,
        NuevoProveedor,
        EditarProveedores,
        EliminarProveedor,

        VerVentasDiarias,
        VerCostosEnReportes,
        HacerCorteX,
        HacerCorteY,

        VerCompras,
        NuevaCompra,
        EditarCompra,
        EliminarCompra,
        EliminarPagoEnCompra,

        MovimientosDeInventario,


        HacerDevolucion,

        VerUsuarios,
        NuevoUsuario,
        EditarUsuarios,

        VerOperaciones,
        AsignarOperaciónaUsuario,

        VerMarcas,
        NuevaMarca,
        EditarMarcas,
        EliminarMarcas,

        VerTipoProducto,
        NuevoTipoProducto,
        EditarTipoProducto,
        EliminarTipoProducto,

        VerTallas,
        NuevaTalla,
        EditarTalla,
        EliminarTalla,


    }


}