CREATE TABLE [dbo].[TipoProducto] (
    [IdTipoProducto] INT           IDENTITY (1, 1) NOT NULL,
    [Descripcion]    NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_TipoProducto] PRIMARY KEY CLUSTERED ([IdTipoProducto] ASC)
);

