CREATE TABLE [dbo].[SubTipoProducto] (
    [IdSubTipoProducto] INT           IDENTITY (1, 1) NOT NULL,
    [Descripcion]       NVARCHAR (50) NOT NULL,
    [IdTipoProducto]    INT           CONSTRAINT [DF_SubTipoProducto_IdTipoProducto] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_SubTipoProducto] PRIMARY KEY CLUSTERED ([IdSubTipoProducto] ASC)
);

