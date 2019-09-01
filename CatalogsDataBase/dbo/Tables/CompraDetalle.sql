CREATE TABLE [dbo].[CompraDetalle] (
    [IdCompraDetalle] INT   IDENTITY (1, 1) NOT NULL,
    [IdCompra]        INT   NOT NULL,
    [IdProducto]      INT   NOT NULL,
	[IdPresentacion]  SMALLINT   NOT NULL,
    [Cantidad]        INT   NOT NULL,
    [CostoUnitario]   MONEY NOT NULL,
    [CostoTotal]      MONEY NOT NULL,
    [Existencia]      INT   NOT NULL,
    [CantidadVendida]  INT   NOT NULL,[FechaUltimoVendido] DATETIME NULL DEFAULT NULL, 
    -- cuanto se ha vendido de este lote
 
    
    CONSTRAINT [PK_CompraDetalle] PRIMARY KEY CLUSTERED ([IdCompraDetalle] ASC),
    CONSTRAINT [FK_CompraDetalle_Compra] FOREIGN KEY ([IdCompra]) REFERENCES [dbo].[Compra] ([IdCompra]),
    CONSTRAINT [FK_CompraDetalle_Producto] FOREIGN KEY ([IdProducto]) REFERENCES [dbo].[Producto] ([IdProducto]),
	CONSTRAINT [FK_CompraDetalle_Presentacion] FOREIGN KEY ([IdPresentacion]) REFERENCES [dbo].[Presentacion] ([IdPresentacion]),

);

