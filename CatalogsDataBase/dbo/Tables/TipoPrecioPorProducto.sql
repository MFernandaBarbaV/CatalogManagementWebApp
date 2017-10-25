CREATE TABLE [dbo].[TipoPrecioPorProducto] (
    [IdProducto]   INT   CONSTRAINT [DF_TipoPrecioPorProducto_IdProducto] DEFAULT ((0)) NOT NULL,
    [IdTipoPrecio] INT   NOT NULL,
    [Precio]       MONEY NOT NULL,
    [SeUsa]        BIT   CONSTRAINT [DF_TipoPrecio_Seleccion] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [FK_TipoPrecio_Producto] FOREIGN KEY ([IdProducto]) REFERENCES [dbo].[Producto] ([IdProducto]),
    CONSTRAINT [FK_TipoPrecio_TipoPrecio1] FOREIGN KEY ([IdTipoPrecio]) REFERENCES [dbo].[TipoPrecio] ([IdTipoPrecio])
);

