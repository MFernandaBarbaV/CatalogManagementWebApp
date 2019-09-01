CREATE TABLE [dbo].[ClienteTipoPrecio]
(
	[IdCliente] INT NOT NULL , 
    [IdTipoPrecio] SMALLINT NOT NULL, 
    CONSTRAINT [FK_ClienteTipoPrecio_Cliente] FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente), 
    CONSTRAINT [FK_ClienteTipoPrecio_TipoPrecio] FOREIGN KEY (IdTipoPrecio) REFERENCES TipoPrecio(IdTipoPrecio)
)
