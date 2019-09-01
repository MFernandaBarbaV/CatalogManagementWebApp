CREATE TABLE [dbo].[Pagos]
(
	[IdPago] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY, 
	[IdVenta] INT NOT NULL,
    [ImportePago] MONEY NOT NULL, 
    [FechaPago] DATETIME NOT NULL DEFAULT GETDATE(), 
    [Observaciones] NVARCHAR(150) NULL, 
    [IdFormaDePago] SMALLINT NULL, 
    [IdUsuario] INT NOT NULL DEFAULT 1, 
    [Cambio] MONEY NOT NULL DEFAULT 0, 
	  [IdEstatus] TINYINT NOT NULL DEFAULT 1, 
    CONSTRAINT [FK_Pagos_Venta] FOREIGN KEY (IdVenta) REFERENCES [Venta]([IdVenta]), 
    CONSTRAINT [FK_Pagos_FormaDePago] FOREIGN KEY ([IdFormaDePago]) REFERENCES [FormaDePago]([IdFormaDePago]),
	 CONSTRAINT [FK_Pagos_Estatus] FOREIGN KEY (IdEstatus) REFERENCES Estatus(IdEstatus)
   
)
