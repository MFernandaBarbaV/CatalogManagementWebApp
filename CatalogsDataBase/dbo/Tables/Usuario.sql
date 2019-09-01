CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](300) NOT NULL,
	[Direccion] [nvarchar](300) NULL,
	[Email] [nvarchar](120) NULL,		
	[Contraseña] [nvarchar](300) NOT NULL,
	[IdEstatus] [int] NOT NULL DEFAULT 1
 CONSTRAINT [PK_mUsers] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY], 
    [Telefono] NVARCHAR(150) NULL, 
    [Celular] NVARCHAR(150) NULL,    
    [SueldoBase] MONEY NULL, 
    [FechaNacimiento] DATETIME NULL, 
	 [FechaContratacion] DATETIME NULL, 
    [FechaBaja] DATETIME NULL, 
    [Login] NVARCHAR(10) NULL, 
    [EsVendedor] BIT NULL DEFAULT 0
) ON [PRIMARY]
GO


