CREATE TABLE [dbo].[PagosCompras]
(
	[IdPagoCompra] INT IDENTITY (1, 1) NOT NULL PRIMARY KEY, 
	[IdCompra] INT NOT NULL,
    [ImportePago] MONEY NOT NULL, 
    [FechaPago] DATETIME NOT NULL DEFAULT GETDATE(), 
    [Observaciones] NVARCHAR(150) NULL, 
    [IdFormaDePago] SMALLINT NULL, 
    [IdUsuario] INT NOT NULL DEFAULT 1, 
    
    [IdEstatus] TINYINT NOT NULL DEFAULT 1, 
    CONSTRAINT [FK_PagoCompra_Venta] FOREIGN KEY ([IdCompra]) REFERENCES [Compra]([IdCompra]), 
    CONSTRAINT [FK_PagoCompra_FormaDePago] FOREIGN KEY ([IdFormaDePago]) REFERENCES [FormaDePago]([IdFormaDePago]), 
    CONSTRAINT [FK_PagosCompras_Estatus] FOREIGN KEY (IdEstatus) REFERENCES Estatus(IdEstatus)
)
