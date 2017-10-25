using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CatalogManagement.Models.Entities
{
    public enum Operations : int
    {
        IniciodeSesión = 0,
        CerrarCesionUsuario = 1,
        
        //Usuario
        VerUsuarios = 2,
        EditarUsuarios = 3,
        NuevoUsuario = 4,
        EliminarUsuarios = 5,

        //Aplicacion
        VerAplicaciones = 6,
        NuevaAplicación = 7,
        EditarAplicaciones = 8,
        EliminarAplicaciones = 9,

        //Operaciones
        VerOperaciones = 10,
        NuevaOperación = 11,
        EditarOperaciones = 12,
        EliminarOperaciones = 13,

        //Perfiles
        VerPerfiles = 14,
        NuevoPerfil = 15,
        EditarPerfiles = 16,
        EliminarPerfiles = 17,      

        //Plantilla de accesso
        VerPlantillasdeAcceso = 18,
        NuevaPlantilladeAcceso = 19,
        EditarPlantillasdeAcceso = 20,
        EliminarPlantillasdeAcceso = 21,

        //Reportes
        VerReporteGastos = 22,
        VerReporteCompras = 23,
        EditarReportes = 24,
        EliminarReportes = 25,      
        ImprimirReportes = 26,

        //Relacional
        AsignarOperaciónaPerfil = 27,
        AsignarReporteaUsuario = 28,      
        AsignarReporteaPerfil = 29,   
        AsignarPerfilaUsuario = 30,

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
    }

 
}