CREATE TABLE [dbo].[Genero] (
    [IdGenero]    INT           IDENTITY (1, 1) NOT NULL,
    [Descripcion] NVARCHAR (50) NOT NULL,
    CONSTRAINT [PK_Genero] PRIMARY KEY CLUSTERED ([IdGenero] ASC)
);

