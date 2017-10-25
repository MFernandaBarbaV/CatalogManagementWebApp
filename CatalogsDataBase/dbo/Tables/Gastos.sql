CREATE TABLE [dbo].[Gastos] (
    [IdGasto]     INT            IDENTITY (1, 1) NOT NULL,
    [IdTipoGasto] TINYINT        NOT NULL,
    [Descripcion] NVARCHAR (150) NOT NULL,
    [Cantidad]    MONEY          NOT NULL,
    [Fecha]       DATETIME       CONSTRAINT [DF_Gastos_Fecha] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Gastos] PRIMARY KEY CLUSTERED ([IdGasto] ASC),
    CONSTRAINT [FK_Gastos_Gastos] FOREIGN KEY ([IdTipoGasto]) REFERENCES [dbo].[TipoGasto] ([IdTipoGasto])
);

