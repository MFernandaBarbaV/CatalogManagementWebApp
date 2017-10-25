CREATE TABLE [dbo].[Producto] (
    [IdProducto]        INT            IDENTITY (1, 1) NOT NULL,
    [Descripcion]       NVARCHAR (MAX) NOT NULL,
    [Codigo]            NVARCHAR (50)  NOT NULL,
    [Cantidad]          BIGINT         NOT NULL,
    [IdTipoProducto]    INT            NOT NULL,
    [IdSubTipoProducto] INT            NOT NULL,
    [IdMarca]           INT            NOT NULL,
    [IdProveedor]       INT            NOT NULL,
    [IdTalla]           INT            NOT NULL,
    [IdUnidad]          INT            NOT NULL,
    [IdGenero]          INT            CONSTRAINT [DF_Producto_IdGenero] DEFAULT ((1)) NOT NULL,
    [Imagen]            IMAGE          NULL,
    [PrecioVenta]       MONEY          CONSTRAINT [DF_Producto_PrecioVenta] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED ([IdProducto] ASC),
    CONSTRAINT [FK_Producto_Genero] FOREIGN KEY ([IdGenero]) REFERENCES [dbo].[Genero] ([IdGenero]),
    CONSTRAINT [FK_Producto_Marca] FOREIGN KEY ([IdMarca]) REFERENCES [dbo].[Marca] ([IdMarca]),
    CONSTRAINT [FK_Producto_Proveedor] FOREIGN KEY ([IdProveedor]) REFERENCES [dbo].[Proveedor] ([IdProveedor]),
    CONSTRAINT [FK_Producto_SubTipoProducto] FOREIGN KEY ([IdSubTipoProducto]) REFERENCES [dbo].[SubTipoProducto] ([IdSubTipoProducto]),
    CONSTRAINT [FK_Producto_TipoProducto] FOREIGN KEY ([IdTipoProducto]) REFERENCES [dbo].[TipoProducto] ([IdTipoProducto]),
    CONSTRAINT [FK_Producto_Unidad] FOREIGN KEY ([IdUnidad]) REFERENCES [dbo].[Unidad] ([IdUnidad])
);

