USE [CatalogManagementDB]
GO
DELETE FROM [dbo].[dProfileOperations]
GO
DELETE FROM [dbo].[mAccessLog]
GO
DBCC CHECKIDENT ('[dbo].[mAccessLog]', reseed, 0)
GO
DELETE FROM [dbo].[mOperations]
GO
DBCC CHECKIDENT ('[dbo].[mOperations]', reseed, 0)
GO
DELETE FROM [dbo].[dUserProfiles]
GO
DELETE FROM [dbo].[mUsers]
GO
DBCC CHECKIDENT ('[dbo].[mUsers]', reseed, 0)
GO
DELETE FROM [dbo].[mProfiles]
GO
DBCC CHECKIDENT ('[dbo].[mProfiles]', reseed, 0)
GO
DELETE FROM [dbo].[mApplications]
GO
DBCC CHECKIDENT ('[dbo].[mApplications]', reseed, 0)
GO
DELETE FROM [dbo].[mStatus]
GO
DBCC CHECKIDENT ('[dbo].[mStatus]', reseed, 0)
GO
DELETE FROM [dbo].[mStatusTypes]
GO
DELETE FROM [dbo].[mAccessTemplates]
GO
DBCC CHECKIDENT ('[dbo].[mAccessTemplates]', reseed, 0)
GO
SET IDENTITY_INSERT [dbo].[mAccessTemplates] ON 

GO
INSERT [dbo].[mAccessTemplates] ([AccessTemplateID], [Name], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [Sunday], [IsReadOnly]) VALUES (1, N'Matutino 6:00-13:59 hrs L-D', N'003FC0', N'003FC0', N'003FC0', N'003FC0', N'003FC0', N'003FC0', N'003FC0', 0)
GO
INSERT [dbo].[mAccessTemplates] ([AccessTemplateID], [Name], [Monday], [Tuesday], [Wednesday], [Thursday], [Friday], [Saturday], [Sunday], [IsReadOnly]) VALUES (2, N'DiaCompleto', N'FFFFFF', N'FFFFFF', N'FFFFFF', N'FFFFFF', N'FFFFFF', N'FFFFFF', N'FFFFFF', 0)
GO


SET IDENTITY_INSERT [dbo].[mAccessTemplates] OFF
GO
GO
INSERT [dbo].[mStatusTypes] ([TypeID], [Name]) VALUES (1, N'System')
GO
SET IDENTITY_INSERT [dbo].[mStatus] ON 

GO
INSERT [dbo].[mStatus] ([StatusID], [Name], [Type]) VALUES (1, N'Activo', 1)
GO
SET IDENTITY_INSERT [dbo].[mStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[mApplications] ON 

GO
INSERT [dbo].[mApplications] ([ApplicationID], [Name], [Type], [Origin], [Version], [ReleaseDate], [IsReadOnly], [ManagesDelagations], [StatusID]) VALUES (1, N'Administrador de Catalogos', N'Web', N'', N'', CAST(N'2017-09-11 19:45:54.523' AS DateTime), 0, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[mApplications] OFF
GO
SET IDENTITY_INSERT [dbo].[mProfiles] ON 

GO
INSERT [dbo].[mProfiles] ([ProfileID], [Name], [ApplicationID], [IsReadOnly], [StatusID]) VALUES (1, N'Administrador', 1, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[mProfiles] OFF
GO
SET IDENTITY_INSERT [dbo].[mUsers] ON 

GO
INSERT [dbo].[mUsers] ([UserID], [Name], [LastName], [Surname], [Address], [ZipCode], [Email], [Organization], [Position], [ShortName], [Login], [Password], [Sex], [StatusID], [CreateDate], [IsReadOnly], [IsFirstSession], [IsActiveSession], [LastLogin]) VALUES (1, N'María Fernanda', N'Barba', N'Velázquez', N'Tierra del Fuego', 44630, N'ma.fer.bv23@gmail.com', N'FBSoftware', N'Ing. de Software', N'Fer', N'Fer', N'6fead90aa061349b9874d904c108b59c79d12d76', 1, 1, CAST(N'2017-09-11 19:54:40.290' AS DateTime), 0, 0, 0, CAST(N'2017-09-11 21:24:08.193' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[mUsers] OFF
GO
INSERT [dbo].[dUserProfiles] ([UserID], [ProfileID], [AccessTemplateID]) VALUES (1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[mOperations] ON 

GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (1, N'Inicio de sesión', 1, 1, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (2, N'Ver Usuarios', 1, 2, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (3, N'Editar Usuarios', 1, 3, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (4, N'Crear Usuario', 1, 4, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (5, N'Eliminar Usuarios', 1, 5, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (6, N'Ver Aplicaciones', 1, 6, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (7, N'Nueva Aplicación', 1, 7, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (8, N'Editar Aplicaciones', 1, 8, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (9, N'Eliminar Aplicaciones', 1, 9, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (10, N'Ver Operaciones', 1, 10, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (11, N'Nueva Operación', 1, 11, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (12, N'Editar Operaciones', 1, 12, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (13, N'Eliminar Operaciones', 1, 13, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (14, N'Ver Perfiles', 1, 14, 1)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (15, N'Nuevo Perfil', 1, 15, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (16, N'Editar Perfiles', 1, 16, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (17, N'Eliminar Perfiles', 1, 17, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (18, N'Ver Plantillas de Acceso', 1, 18, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (19, N'Nueva Plantilla de Acceso', 1, 19, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (20, N'Editar Plantilla de Acceso', 1, 20, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (21, N'Eliminar Plantilla de Acceso', 1, 21, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (22, N'Ver Reportes', 1, 22, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (23, N'Nuevo Reporte', 1, 23, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (24, N'Editar Reportes', 1, 24, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (25, N'Eliminar Reportes', 1, 25, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (26, N'Imprimir Reportes', 1, 26, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (27, N'Asignar Operacióna Perfil', 1, 27, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (28, N'Asignar Reporte a Usuario', 1, 28, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (29, N'Asignar Reporte a Perfil', 1, 29, 0)
GO
INSERT [dbo].[mOperations] ([OperationID], [Name], [ApplicationID], [SysOperation], [IsReadOnly]) VALUES (30, N'Asignar Perfil a Usuario', 1, 30, 0)
GO
SET IDENTITY_INSERT [dbo].[mOperations] OFF
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 1)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 2)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 3)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 4)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 5)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 6)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 7)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 8)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 9)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 10)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 11)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 12)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 13)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 14)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 15)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 16)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 17)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 18)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 19)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 20)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 21)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 22)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 23)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 24)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 25)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 26)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 27)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 28)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 29)
GO
INSERT [dbo].[dProfileOperations] ([ProfileID], [OperationID]) VALUES (1, 30)
GO