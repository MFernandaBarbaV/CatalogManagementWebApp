CREATE TABLE [dbo].[Almacen]
(
	[IdAlmacen] SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Nombre] NCHAR(30) NOT NULL, 
    [EsAlmacenDeVenta] BIT NOT NULL DEFAULT 0 
)
