CREATE TABLE [dbo].[VentaDetalle] (
    [IdVentaDetalle] INT   IDENTITY (1, 1) NOT NULL,
    [IdVenta]        INT   NOT NULL,
    [IdProducto]     INT   NOT NULL,
    [IdUnidad]       INT   NOT NULL,
    [IdTipoPrecio]   INT   NOT NULL,
    [Cantidad]       INT   NOT NULL,
    [PrecioUnitario] MONEY NOT NULL,
    [PrecioTotal]    MONEY NOT NULL,
    CONSTRAINT [PK_VentaDetalle] PRIMARY KEY CLUSTERED ([IdVentaDetalle] ASC),
    CONSTRAINT [FK_VentaDetalle_Producto] FOREIGN KEY ([IdProducto]) REFERENCES [dbo].[Producto] ([IdProducto]),
    CONSTRAINT [FK_VentaDetalle_TipoPrecio] FOREIGN KEY ([IdTipoPrecio]) REFERENCES [dbo].[TipoPrecio] ([IdTipoPrecio]),
    CONSTRAINT [FK_VentaDetalle_Unidad] FOREIGN KEY ([IdUnidad]) REFERENCES [dbo].[Unidad] ([IdUnidad]),
    CONSTRAINT [FK_VentaDetalle_Venta] FOREIGN KEY ([IdVenta]) REFERENCES [dbo].[Venta] ([IdVenta])
);

