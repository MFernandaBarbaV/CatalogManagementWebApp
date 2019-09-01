CREATE TABLE [dbo].[CorteX]
(
	[IdCorteX] INT identity(1,1) NOT NULL PRIMARY KEY, 
    [IdUsuario] INT NOT NULL, 
    [Fecha] DATETIME NOT NULL, 
    [IdVentaInicio] INT NOT NULL, 
    [IdVentaFin] INT NOT NULL, 
    [MontoVenta] MONEY NOT NULL, 
    CONSTRAINT [FK_CorteX_Usuario] FOREIGN KEY (IdUsuario) REFERENCES [Usuario] ([IdUsuario]), 
    CONSTRAINT [FK_CorteX_VentaInicio] FOREIGN KEY (IdVentaInicio) REFERENCES Venta(IdVenta),
	CONSTRAINT [FK_CorteX_VentaFin] FOREIGN KEY (IdVentaFin) REFERENCES Venta(IdVenta)
)
