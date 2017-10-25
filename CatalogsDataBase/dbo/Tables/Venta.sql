CREATE TABLE [dbo].[Venta] (
    [IdVenta]          INT        IDENTITY (1, 1) NOT NULL,
    [IdCliente]        INT        NOT NULL,
    [IdOperador]       INT        NOT NULL,
    [FechaVenta]       DATETIME   NOT NULL,
    [Descuento]        FLOAT (53) NOT NULL,
    [EsFactura]        BIT        NOT NULL,
    [Total]            MONEY      NOT NULL,
    [GuardadoTemporal] BIT        NOT NULL,
    CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED ([IdVenta] ASC),
    CONSTRAINT [FK_Venta_Clientes] FOREIGN KEY ([IdCliente]) REFERENCES [dbo].[Clientes] ([IdCliente]),
    CONSTRAINT [FK_Venta_Operador] FOREIGN KEY ([IdOperador]) REFERENCES [dbo].[Operador] ([IdOperador])
);

