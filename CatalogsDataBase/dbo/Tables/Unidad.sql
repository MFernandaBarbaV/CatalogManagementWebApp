CREATE TABLE [dbo].[Unidad] (
    [IdUnidad]    INT           IDENTITY (1, 1) NOT NULL,
    [Descripcion] NVARCHAR (50) NOT NULL,
    [Cantidad]    INT           NOT NULL,
    CONSTRAINT [PK_Unidad] PRIMARY KEY CLUSTERED ([IdUnidad] ASC)
);

