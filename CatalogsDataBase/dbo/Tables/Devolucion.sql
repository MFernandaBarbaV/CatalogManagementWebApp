CREATE TABLE [dbo].[Devolucion]
(
	[IdDevolucion] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [FechaDevolucion] DATETIME NOT NULL, 
	 [FolioDevolucion] BIGINT NOT NULL,
    [IdOperador] INT NOT NULL, 
    [IdVenta] INT NOT NULL, 
    [ImporteDevolucion] MONEY NOT NULL, 
    CONSTRAINT [FK_Devolucion_Operador] FOREIGN KEY ([IdOperador] ) REFERENCES [Usuario]  ([IdUsuario]),
	CONSTRAINT [FK_Devolucion_Venta] FOREIGN KEY ([IdVenta] ) REFERENCES [Venta] ([IdVenta])
   
)
