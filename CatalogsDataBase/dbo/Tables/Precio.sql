CREATE TABLE [dbo].[Precio] (
    [IdProducto]   INT   CONSTRAINT [DF_TipoPrecioPorProducto_IdProducto] DEFAULT ((0)) NOT NULL,
    [IdTipoPrecio] SMALLINT   NOT NULL,
	  [IdPresentacion] SMALLINT   NOT NULL,
    [Precio]       MONEY NOT NULL,   
    CONSTRAINT [FK_Precio_Producto] FOREIGN KEY ([IdProducto]) REFERENCES [dbo].[Producto] ([IdProducto]),
    CONSTRAINT [FK_Precio_TipoPrecio] FOREIGN KEY ([IdTipoPrecio]) REFERENCES [dbo].[TipoPrecio] ([IdTipoPrecio]), 
    CONSTRAINT [PK_PrecioPorProducto] PRIMARY KEY ([IdProducto],[IdTipoPrecio],[IdPresentacion]), 
    CONSTRAINT [FK_Precio_Presentacion] FOREIGN KEY (IdPresentacion) REFERENCES Presentacion(IdPresentacion) 
);

