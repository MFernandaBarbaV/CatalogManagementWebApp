CREATE TABLE [dbo].[Log]
(
	[IdLog] BIGINT NOT NULL  identity(1,1), 
    [IdOperacion] INT NOT NULL, 
    [IdUsuario] INT NOT NULL, 
    [IdObject] INT NOT NULL, 
    [Fecha] DATETIME NOT NULL DEFAULT ((GETDATE())), 
    CONSTRAINT [PK_Log] PRIMARY KEY ([IdLog]), 
    CONSTRAINT [FK_Log_Usuarios] FOREIGN KEY (IdOperacion) REFERENCES dbo.Operaciones(IdOperacion), 
    CONSTRAINT [FK_Log_Operaciones] FOREIGN KEY (IdUsuario) REFERENCES dbo.Usuario(IdUsuario)
)
