CREATE TABLE [dbo].[Presentacion]
(
	[IdPresentacion] SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Descripcion] NVARCHAR(30) NOT NULL, 
    [Piezas] SMALLINT NOT NULL
)
