CREATE TABLE [dbo].[PrecioHistorial]
(
	[IdPrecioHistorial] BIGINT  IDENTITY (1, 1)  NOT NULL PRIMARY KEY, 
	[IdProducto] INT NOT NULL, 
    [Costo] MONEY NOT NULL , 
    [Precio] MONEY NULL DEFAULT NULL, 
    [Fecha] DATETIME NOT NULL DEFAULT ((GETDATE())), 
    [IdTipoPrecio] SMALLINT NULL DEFAULT NULL, 
    [IdPresentacion] SMALLINT NULL DEFAULT NULL
)
