CREATE TABLE [dbo].[Compra] (
    [IdCompra]    INT      IDENTITY (1, 1) NOT NULL,
    [IdProveedor] INT      NOT NULL,
    [IdOperador]  INT      NOT NULL,
    [FechaCompra] DATETIME NOT NULL,
    [Total]       MONEY    NOT NULL,
    CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED ([IdCompra] ASC)
);

