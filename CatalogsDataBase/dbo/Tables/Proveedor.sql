CREATE TABLE [dbo].[Proveedor] (
    [IdProveedor]         INT            IDENTITY (1, 1) NOT NULL,
    [NombreProveedor]     NVARCHAR (350) NOT NULL,
    [Telefono]            NVARCHAR (50)  NULL,
    [Dirección]           NVARCHAR (350) NULL,
	[NumeroInterior] NVARCHAR (100) NULL,
    [NumeroExterior] NVARCHAR (100) NULL,
    [Colonia]        NVARCHAR (100) NULL,
    [CodigoPostal]   NVARCHAR (100) NULL,
    [Ciudad]         NVARCHAR (100) NULL,
    [Estado]         NVARCHAR (100) NULL,
    [InformacionBancaria] NVARCHAR (350) NULL,
    [Email]               NVARCHAR (50)  NULL,
    [DiasCredito]         TINYINT        NOT NULL DEFAULT 0,
    [Adeudo] MONEY NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED ([IdProveedor] ASC)
);

