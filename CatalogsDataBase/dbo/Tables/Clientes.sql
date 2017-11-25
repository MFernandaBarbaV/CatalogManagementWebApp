CREATE TABLE [dbo].[Clientes] (
    [IdCliente]                     INT            IDENTITY (1, 1) NOT NULL,
    [NombreCliente]                 NVARCHAR (300) NOT NULL,
    [Email]                         NVARCHAR (100) NULL,
    [RFC]                           NVARCHAR (100) NULL,
    [CalleDomicilioFiscal]          NVARCHAR (100) NULL,
    [NumeroInteriorDomicilioFiscal] NVARCHAR (100) NULL,
    [NumeroExteriorDomicilioFiscal] NVARCHAR (100) NULL,
    [ColoniaDomicilioFiscal]        NVARCHAR (100) NULL,
    [CodigoPostalDomicilioFiscal]   NVARCHAR (100) NULL,
    [CiudadDomicilioFiscal]         NVARCHAR (100) NULL,
    [EstadoDomicilioFiscal]         NVARCHAR (100) NULL,
    [Telefono]                      NVARCHAR (100) NULL,
    CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED ([IdCliente] ASC)
);

