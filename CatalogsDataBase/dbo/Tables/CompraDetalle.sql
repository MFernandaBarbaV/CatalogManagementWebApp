CREATE TABLE [dbo].[CompraDetalle] (
    [IdCompraDetalle] INT   IDENTITY (1, 1) NOT NULL,
    [IdCompra]        INT   NOT NULL,
    [IdProducto]      INT   NOT NULL,
    [IdUnidad]        INT   NOT NULL,
    [Cantidad]        INT   NOT NULL,
    [CostoUnitario]   MONEY NOT NULL,
    [CostoTotal]      MONEY NOT NULL,
    [Existencia]      INT   NOT NULL,
    [Lote]            INT   NOT NULL,
    [GananciaDeLote]  MONEY NOT NULL,
    [PrecioVenta]     MONEY CONSTRAINT [DF_CompraDetalle_PrecioVenta] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_CompraDetalle] PRIMARY KEY CLUSTERED ([IdCompraDetalle] ASC),
    CONSTRAINT [FK_CompraDetalle_Compra] FOREIGN KEY ([IdCompra]) REFERENCES [dbo].[Compra] ([IdCompra]),
    CONSTRAINT [FK_CompraDetalle_Producto] FOREIGN KEY ([IdProducto]) REFERENCES [dbo].[Producto] ([IdProducto]),
    CONSTRAINT [FK_CompraDetalle_Unidad] FOREIGN KEY ([IdUnidad]) REFERENCES [dbo].[Unidad] ([IdUnidad])
);

