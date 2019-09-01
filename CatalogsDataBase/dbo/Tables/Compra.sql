CREATE TABLE [dbo].[Compra] (
    [IdCompra]    INT      IDENTITY (1, 1) NOT NULL,
    [IdProveedor] INT      NOT NULL,
    [IdUsuario]  INT      NOT NULL,
    [FechaCompra] DATETIME NOT NULL,
	[FechaRegistro] DATETIME NOT NULL DEFAULT ((GETDATE())),
	[Folio]			NVARCHAR(15) NULL DEFAULT ((NULL)),    
	[EsFactura]        BIT        NOT NULL DEFAULT 0,
	[Subtotal] MONEY NOT NULL,
	[IVA] MONEY NOT NULL DEFAULT 0, 
	[Descuento] MONEY NOT NULL DEFAULT 0, 
	[Flete] MONEY NOT NULL DEFAULT 0,
	[Total]       MONEY    NOT NULL,
	[Pagado]            MONEY      NOT NULL DEFAULT 0,
    [IdAlmacen] SMALLINT NOT NULL DEFAULT 1, 
    CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED ([IdCompra] ASC), 
    CONSTRAINT [FK_Compra_Proveedor] FOREIGN KEY ([IdProveedor]) REFERENCES [Proveedor]([IdProveedor]), 
    CONSTRAINT [FK_Compra_Usuario] FOREIGN KEY ([IdUsuario]) REFERENCES [Usuario]([IdUsuario]), 
    CONSTRAINT [FK_Compra_Almacen] FOREIGN KEY ([IdAlmacen]) REFERENCES Almacen([IdAlmacen])
);

