CREATE TABLE [dbo].[Marca] (
    [IdMarca]     INT        IDENTITY (1, 1) NOT NULL,
    [Descripcion] NCHAR (30) NOT NULL,
    CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED ([IdMarca] ASC)
);

