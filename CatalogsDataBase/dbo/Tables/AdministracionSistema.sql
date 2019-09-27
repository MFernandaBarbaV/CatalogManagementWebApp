CREATE TABLE [dbo].[AdministracionSistema]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- id pc
    [Dato1] NVARCHAR(500) NOT NULL,  -- nombre pc
    [Dato2] NVARCHAR(500) NOT NULL,  -- fecha limite de uso
	[Dato3] NVARCHAR(500) NOT NULL,  -- fecha ultimo pago
	[Dato4] NVARCHAR(500) NOT NULL,  -- cantidad ultimo pago

)
