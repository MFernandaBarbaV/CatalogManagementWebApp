CREATE TABLE [dbo].[Proveedor] (
    [IdProveedor]         INT            IDENTITY (1, 1) NOT NULL,
    [NombreProveedor]     NVARCHAR (350) NOT NULL,
    [Telefono]            NVARCHAR (50)  NULL,
    [Dirección]           NVARCHAR (350) NULL,
    [InformacionBancaria] NVARCHAR (350) NULL,
    [Email]               NVARCHAR (50)  NULL,
    [DiasCredito]         TINYINT        NULL,
    CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED ([IdProveedor] ASC)
);

