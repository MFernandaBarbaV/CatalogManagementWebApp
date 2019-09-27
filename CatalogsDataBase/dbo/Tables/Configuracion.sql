CREATE TABLE [dbo].[Configuracion] (
    [IdConfiguracion] INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]          NVARCHAR (50) NULL,
    [Valor]           NVARCHAR (500) NULL,
    CONSTRAINT [PK_Configuracion] PRIMARY KEY CLUSTERED ([IdConfiguracion] ASC)
);

