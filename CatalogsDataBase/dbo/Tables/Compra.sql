CREATE TABLE [dbo].[Compra] (
    [IdCompra]    INT      IDENTITY (1, 1) NOT NULL,
    [IdProveedor] INT      NOT NULL,
    [IdOperador]  INT      NOT NULL,
    [FechaCompra] DATETIME2 NOT NULL,
    [Total]       MONEY    NOT NULL,
    CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED ([IdCompra] ASC), 
    CONSTRAINT [FK_Compra_Proveedor] FOREIGN KEY ([IdProveedor]) REFERENCES [Proveedor]([IdProveedor]), 
    CONSTRAINT [FK_Compra_Operador] FOREIGN KEY ([IdOperador]) REFERENCES [Operador]([IdOperador])
);

