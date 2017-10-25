CREATE TABLE [dbo].[Talla] (
    [IdTalla]     INT           IDENTITY (1, 1) NOT NULL,
    [Descripcion] NVARCHAR (50) NOT NULL,
    [IdGenero]    INT           NULL,
    CONSTRAINT [PK_Talla] PRIMARY KEY CLUSTERED ([IdTalla] ASC)
);

