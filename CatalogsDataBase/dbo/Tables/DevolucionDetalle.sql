CREATE TABLE [dbo].[DevolucionDetalle]
(
	[IdDevolucionDetalle] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [IdDevolucion] INT NOT NULL, 
    [IdProducto] INT NOT NULL, 
    [Cantidad] INT NOT NULL, 
    [IdPresentacion] SMALLINT NOT NULL, 
    [ImporteDevolucion] MONEY NOT NULL, 
    [IdVentaDetalle] INT NOT NULL, 
    CONSTRAINT [FK_DevolucionDetalle_Devolucion] FOREIGN KEY (IdDevolucion) REFERENCES [Devolucion] ([IdDevolucion] ), 
    CONSTRAINT [FK_DevolucionDetalle_Producto] FOREIGN KEY ([IdProducto]) REFERENCES [Producto]([IdProducto]), 
    CONSTRAINT [FK_DevolucionDetalle_Presentacion] FOREIGN KEY ([IdPresentacion]) REFERENCES [Presentacion]([IdPresentacion]),
)
