CREATE TABLE [dbo].[CodigoBarras]
(
	[IdCodigoBarras] INT NOT NULL  IDENTITY(1,1), 
    [CodigoBarras] NVARCHAR(50) NOT NULL, 
    [IdProducto] INT NOT NULL, 
    [IdTipoPrecio] SMALLINT NOT NULL, 
    [IdPresentacion] SMALLINT NOT NULL,
	CONSTRAINT [FK_CodigoBarras_Producto] FOREIGN KEY ([IdProducto]) REFERENCES [dbo].[Producto] ([IdProducto]),
    CONSTRAINT [FK_CodigoBarras_TipoPrecio] FOREIGN KEY ([IdTipoPrecio]) REFERENCES [dbo].[TipoPrecio] ([IdTipoPrecio]), 
    CONSTRAINT [FK_CodigoBarras_Presentacion] FOREIGN KEY (IdPresentacion) REFERENCES Presentacion(IdPresentacion), 
    CONSTRAINT [PK_CodigoBarras] PRIMARY KEY ([IdCodigoBarras]), 
    CONSTRAINT [AK_CodigoBarras_CodigoBarras] UNIQUE ([CodigoBarras]), 
  

)
