CREATE TABLE [dbo].[ExistenciaPorAlmacen](
	[IdProducto] INT NOT NULL , 
    [IdAlmacen] SMALLINT NOT NULL, 
    [Existencia] INT NOT NULL DEFAULT 0,  
    CONSTRAINT [FK_ExistenciaPorAlmacen_Almacen] FOREIGN KEY (IdAlmacen) REFERENCES Almacen(IdAlmacen), 
    CONSTRAINT [FK_ExistenciaPorAlmacen_Producto] FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto), 
    CONSTRAINT [PK_ExistenciaPorAlmacen] PRIMARY KEY ([IdProducto],[IdAlmacen])
)
