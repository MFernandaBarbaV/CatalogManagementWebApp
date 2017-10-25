CREATE TABLE [dbo].[TipoGasto] (
    [IdTipoGasto] TINYINT       IDENTITY (1, 1) NOT NULL,
    [Descripcion] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_TipoGasto] PRIMARY KEY CLUSTERED ([IdTipoGasto] ASC)
);

