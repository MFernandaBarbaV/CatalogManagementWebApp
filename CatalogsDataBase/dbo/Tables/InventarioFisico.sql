CREATE TABLE [dbo].[InventarioFisico]
(
	[IdInventarioFisico] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [FechaInventario] DATETIME NOT NULL DEFAULT (GETDATE()), 
    [IdOperador] INT NOT NULL, 
    [IdAlmacen] SMALLINT NOT NULL, 
    [IdProducto] INT NOT NULL, 
    [CantidadPzs] INT NOT NULL, 
    [Observaciones] NVARCHAR(250) NULL DEFAULT NULL, 
	  [CantidadPzsAnterior] INT NOT NULL DEFAULT 0, 
    CONSTRAINT [FK_InventarioFisico_Uusario] FOREIGN KEY ([IdOperador]) REFERENCES Usuario(IdUsuario), 
    CONSTRAINT [FK_InventarioFisico_Almacen] FOREIGN KEY ([IdAlmacen]) REFERENCES [Almacen]([IdAlmacen]),
)
