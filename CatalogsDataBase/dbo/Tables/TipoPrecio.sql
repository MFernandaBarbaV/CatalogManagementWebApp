CREATE TABLE [dbo].[TipoPrecio] (
    [IdTipoPrecio]   SMALLINT           NOT NULL IDENTITY(1,1),
    [Descripcion]    NVARCHAR (50) NOT NULL,
    [Multiplicador]  MONEY         CONSTRAINT [DF_TipoPrecio_Multiplicador] DEFAULT ((1)) NOT NULL,
    [CantidadPiezas] INT           DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_TipoPrecio] PRIMARY KEY CLUSTERED ([IdTipoPrecio] ASC)
);

