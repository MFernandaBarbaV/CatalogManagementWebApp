CREATE TABLE [dbo].[InventarioHistorial]
(
	[IdHistorial] INT NOT NULL PRIMARY KEY identity (1,1), 
    [IdAlmacenOrigen] smallint NULL, 
    [IdAlmacenDestino] smallint NULL, 
    [IdProducto] INT NOT NULL, 
    [Cantidad] INT NOT NULL, 
    [Fecha] DATETIME NOT NULL DEFAULT getdate(), 
    [Observaciones] NVARCHAR(500) NULL, 
    [IdOperador] INT NOT NULL, 
    CONSTRAINT [FK_InventarioHistorial_AlmacenOrigen] FOREIGN KEY ([IdAlmacenOrigen]) REFERENCES Almacen (IdAlmacen),
	 CONSTRAINT [FK_InventarioHistorial_AlmacenDestino] FOREIGN KEY ([IdAlmacenDestino]) REFERENCES Almacen (IdAlmacen), 
    CONSTRAINT [FK_InventarioHistorial_Producto] FOREIGN KEY ([IdProducto]) REFERENCES producto([IdProducto]), 
    CONSTRAINT [FK_InventarioHistorial_Usuario] FOREIGN KEY ([IdOperador]) REFERENCES Usuario(IdUsuario)
)
