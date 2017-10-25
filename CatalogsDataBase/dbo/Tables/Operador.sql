CREATE TABLE [dbo].[Operador] (
    [IdOperador]      INT            IDENTITY (1, 1) NOT NULL,
    [Nombre]          NVARCHAR (100) NOT NULL,
    [ApellidoPaterno] NVARCHAR (100) NULL,
    [ApellidoMaterno] NVARCHAR (100) NULL,
    [Telefono]        NVARCHAR (50)  NULL,
    [Direccion]       NVARCHAR (100) NULL,
    [HoraInicio]      DATETIME       NULL,
    [HoraFinal]       DATETIME       NULL,
    [Contraseña]      NVARCHAR (100) NOT NULL,
    [Usuario]         NVARCHAR (100) NULL,
    CONSTRAINT [PK_Operador] PRIMARY KEY CLUSTERED ([IdOperador] ASC)
);

