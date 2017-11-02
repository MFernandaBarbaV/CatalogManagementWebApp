

MERGE INTO [dbo].[mStatusTypes] AS Target
USING (VALUES
  (1,N'System')
) AS Source ([TypeID],[Name])
ON (Target.[TypeID] = Source.[TypeID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([TypeID],[Name])
 VALUES(Source.[TypeID],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO


SET IDENTITY_INSERT [dbo].[mStatus] ON
GO
MERGE INTO [dbo].[mStatus] AS Target
USING (VALUES
  (1,N'Activo',1)
) AS Source ([StatusID],[Name],[Type])
ON (Target.[StatusID] = Source.[StatusID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[Type], Target.[Type]) IS NOT NULL OR NULLIF(Target.[Type], Source.[Type]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [Type] = Source.[Type]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([StatusID],[Name],[Type])
 VALUES(Source.[StatusID],Source.[Name],Source.[Type])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO
SET IDENTITY_INSERT [dbo].[mStatus] OFF
GO


SET IDENTITY_INSERT [dbo].[mApplications] ON
GO
MERGE INTO [dbo].[mApplications] AS Target
USING (VALUES
  (1,N'Administrador de Catalogos',N'Web',N'',N'','2017-09-11T19:45:54.523',0,0,1)
) AS Source ([ApplicationID],[Name],[Type],[Origin],[Version],[ReleaseDate],[IsReadOnly],[ManagesDelagations],[StatusID])
ON (Target.[ApplicationID] = Source.[ApplicationID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[Type], Target.[Type]) IS NOT NULL OR NULLIF(Target.[Type], Source.[Type]) IS NOT NULL OR 
	NULLIF(Source.[Origin], Target.[Origin]) IS NOT NULL OR NULLIF(Target.[Origin], Source.[Origin]) IS NOT NULL OR 
	NULLIF(Source.[Version], Target.[Version]) IS NOT NULL OR NULLIF(Target.[Version], Source.[Version]) IS NOT NULL OR 
	NULLIF(Source.[ReleaseDate], Target.[ReleaseDate]) IS NOT NULL OR NULLIF(Target.[ReleaseDate], Source.[ReleaseDate]) IS NOT NULL OR 
	NULLIF(Source.[IsReadOnly], Target.[IsReadOnly]) IS NOT NULL OR NULLIF(Target.[IsReadOnly], Source.[IsReadOnly]) IS NOT NULL OR 
	NULLIF(Source.[ManagesDelagations], Target.[ManagesDelagations]) IS NOT NULL OR NULLIF(Target.[ManagesDelagations], Source.[ManagesDelagations]) IS NOT NULL OR 
	NULLIF(Source.[StatusID], Target.[StatusID]) IS NOT NULL OR NULLIF(Target.[StatusID], Source.[StatusID]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [Type] = Source.[Type], 
  [Origin] = Source.[Origin], 
  [Version] = Source.[Version], 
  [ReleaseDate] = Source.[ReleaseDate], 
  [IsReadOnly] = Source.[IsReadOnly], 
  [ManagesDelagations] = Source.[ManagesDelagations], 
  [StatusID] = Source.[StatusID]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ApplicationID],[Name],[Type],[Origin],[Version],[ReleaseDate],[IsReadOnly],[ManagesDelagations],[StatusID])
 VALUES(Source.[ApplicationID],Source.[Name],Source.[Type],Source.[Origin],Source.[Version],Source.[ReleaseDate],Source.[IsReadOnly],Source.[ManagesDelagations],Source.[StatusID])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO
SET IDENTITY_INSERT [dbo].[mApplications] OFF
GO


SET IDENTITY_INSERT [dbo].[mOperations] ON
GO
MERGE INTO [dbo].[mOperations] AS Target
USING (VALUES
  (1,N'Inicio de sesión',1,1,0)
 ,(2,N'Ver Usuarios',1,2,0)
 ,(3,N'Editar Usuarios',1,3,0)
 ,(4,N'Crear Usuario',1,4,0)
 ,(5,N'Eliminar Usuarios',1,5,0)
 ,(6,N'Ver Aplicaciones',1,6,0)
 ,(7,N'Nueva Aplicación',1,7,0)
 ,(8,N'Editar Aplicaciones',1,8,0)
 ,(9,N'Eliminar Aplicaciones',1,9,0)
 ,(10,N'Ver Operaciones',1,10,0)
 ,(11,N'Nueva Operación',1,11,0)
 ,(12,N'Editar Operaciones',1,12,0)
 ,(13,N'Eliminar Operaciones',1,13,0)
 ,(14,N'Ver Perfiles',1,14,1)
 ,(15,N'Nuevo Perfil',1,15,0)
 ,(16,N'Editar Perfiles',1,16,0)
 ,(17,N'Eliminar Perfiles',1,17,0)
 ,(18,N'Ver Plantillas de Acceso',1,18,0)
 ,(19,N'Nueva Plantilla de Acceso',1,19,0)
 ,(20,N'Editar Plantilla de Acceso',1,20,0)
 ,(21,N'Eliminar Plantilla de Acceso',1,21,0)
 ,(22,N'Ver Reportes',1,22,0)
 ,(23,N'Nuevo Reporte',1,23,0)
 ,(24,N'Editar Reportes',1,24,0)
 ,(25,N'Eliminar Reportes',1,25,0)
 ,(26,N'Imprimir Reportes',1,26,0)
 ,(27,N'Asignar Operacióna Perfil',1,27,0)
 ,(28,N'Asignar Reporte a Usuario',1,28,0)
 ,(29,N'Asignar Reporte a Perfil',1,29,0)
 ,(30,N'Asignar Perfil a Usuario',1,30,0)
 ,(31,N'Nueva Compra',1,31,0)
 ,(32,N'Nuevo Gasto',1,32,0)
 ,(33,N'Ver Compras',1,33,0)
 ,(34,N'Ver Gastos',1,34,0)
 ,(35,N'Dashboard',1,35,0)
 ,(36,N'Editar Gasto',1,36,0)
 ,(37,N'Eliminar Gasto',1,37,0)
 ,(38,N'Ver Tipo de Gasto',1,38,0)
 ,(39,N'Editar Tipo de Gasto',1,39,0)
 ,(40,N'Nuevo Tipo de Gasto',1,40,0)
 ,(41,N'Ver Ventas',1,41,0)
 ,(42,N'Nueva Venta',1,42,0)
 ,(43,N'Ver Producto',1,43,0)
 ,(44,N'Nuevo Producto',1,44,0)
 ,(45,N'Editar Compra',1,45,0)
 ,(46,N'Eliminar Compra',1,46,0)
 ,(47,N'Ver Valance',1,47,0)
 ,(48,N'Ver Reporte Ventas',1,48,0)
 ,(49,N'Editar Venta',1,49,0)
  ,(50,N'Editar Producto',1,50,0)
) AS Source ([OperationID],[Name],[ApplicationID],[SysOperation],[IsReadOnly])
ON (Target.[OperationID] = Source.[OperationID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[ApplicationID], Target.[ApplicationID]) IS NOT NULL OR NULLIF(Target.[ApplicationID], Source.[ApplicationID]) IS NOT NULL OR 
	NULLIF(Source.[SysOperation], Target.[SysOperation]) IS NOT NULL OR NULLIF(Target.[SysOperation], Source.[SysOperation]) IS NOT NULL OR 
	NULLIF(Source.[IsReadOnly], Target.[IsReadOnly]) IS NOT NULL OR NULLIF(Target.[IsReadOnly], Source.[IsReadOnly]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [ApplicationID] = Source.[ApplicationID], 
  [SysOperation] = Source.[SysOperation], 
  [IsReadOnly] = Source.[IsReadOnly]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([OperationID],[Name],[ApplicationID],[SysOperation],[IsReadOnly])
 VALUES(Source.[OperationID],Source.[Name],Source.[ApplicationID],Source.[SysOperation],Source.[IsReadOnly])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO
SET IDENTITY_INSERT [dbo].[mOperations] OFF
GO



SET IDENTITY_INSERT [dbo].[mProfiles] ON
GO
MERGE INTO [dbo].[mProfiles] AS Target
USING (VALUES
  (1,N'Administrador',1,0,1)
) AS Source ([ProfileID],[Name],[ApplicationID],[IsReadOnly],[StatusID])
ON (Target.[ProfileID] = Source.[ProfileID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[ApplicationID], Target.[ApplicationID]) IS NOT NULL OR NULLIF(Target.[ApplicationID], Source.[ApplicationID]) IS NOT NULL OR 
	NULLIF(Source.[IsReadOnly], Target.[IsReadOnly]) IS NOT NULL OR NULLIF(Target.[IsReadOnly], Source.[IsReadOnly]) IS NOT NULL OR 
	NULLIF(Source.[StatusID], Target.[StatusID]) IS NOT NULL OR NULLIF(Target.[StatusID], Source.[StatusID]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [ApplicationID] = Source.[ApplicationID], 
  [IsReadOnly] = Source.[IsReadOnly], 
  [StatusID] = Source.[StatusID]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ProfileID],[Name],[ApplicationID],[IsReadOnly],[StatusID])
 VALUES(Source.[ProfileID],Source.[Name],Source.[ApplicationID],Source.[IsReadOnly],Source.[StatusID])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO
SET IDENTITY_INSERT [dbo].[mProfiles] OFF
GO


SET IDENTITY_INSERT [dbo].[mAccessTemplates] ON
GO
MERGE INTO [dbo].[mAccessTemplates] AS Target
USING (VALUES
  (1,N'Matutino 6:00-13:59 hrs L-D',N'003FC0',N'003FC0',N'003FC0',N'003FC0',N'003FC0',N'003FC0',N'003FC0',0)
 ,(2,N'DiaCompleto',N'FFFFFF',N'FFFFFF',N'FFFFFF',N'FFFFFF',N'FFFFFF',N'FFFFFF',N'FFFFFF',0)
) AS Source ([AccessTemplateID],[Name],[Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Saturday],[Sunday],[IsReadOnly])
ON (Target.[AccessTemplateID] = Source.[AccessTemplateID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[Monday], Target.[Monday]) IS NOT NULL OR NULLIF(Target.[Monday], Source.[Monday]) IS NOT NULL OR 
	NULLIF(Source.[Tuesday], Target.[Tuesday]) IS NOT NULL OR NULLIF(Target.[Tuesday], Source.[Tuesday]) IS NOT NULL OR 
	NULLIF(Source.[Wednesday], Target.[Wednesday]) IS NOT NULL OR NULLIF(Target.[Wednesday], Source.[Wednesday]) IS NOT NULL OR 
	NULLIF(Source.[Thursday], Target.[Thursday]) IS NOT NULL OR NULLIF(Target.[Thursday], Source.[Thursday]) IS NOT NULL OR 
	NULLIF(Source.[Friday], Target.[Friday]) IS NOT NULL OR NULLIF(Target.[Friday], Source.[Friday]) IS NOT NULL OR 
	NULLIF(Source.[Saturday], Target.[Saturday]) IS NOT NULL OR NULLIF(Target.[Saturday], Source.[Saturday]) IS NOT NULL OR 
	NULLIF(Source.[Sunday], Target.[Sunday]) IS NOT NULL OR NULLIF(Target.[Sunday], Source.[Sunday]) IS NOT NULL OR 
	NULLIF(Source.[IsReadOnly], Target.[IsReadOnly]) IS NOT NULL OR NULLIF(Target.[IsReadOnly], Source.[IsReadOnly]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [Monday] = Source.[Monday], 
  [Tuesday] = Source.[Tuesday], 
  [Wednesday] = Source.[Wednesday], 
  [Thursday] = Source.[Thursday], 
  [Friday] = Source.[Friday], 
  [Saturday] = Source.[Saturday], 
  [Sunday] = Source.[Sunday], 
  [IsReadOnly] = Source.[IsReadOnly]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([AccessTemplateID],[Name],[Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Saturday],[Sunday],[IsReadOnly])
 VALUES(Source.[AccessTemplateID],Source.[Name],Source.[Monday],Source.[Tuesday],Source.[Wednesday],Source.[Thursday],Source.[Friday],Source.[Saturday],Source.[Sunday],Source.[IsReadOnly])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO
SET IDENTITY_INSERT [dbo].[mAccessTemplates] OFF
GO


SET IDENTITY_INSERT [dbo].[mUsers] ON
GO
MERGE INTO [dbo].[mUsers] AS Target
USING (VALUES
  (1,N'María Fernanda',N'Barba',N'Velázquez',N'Tierra del Fuego',44630,N'ma.fer.bv23@gmail.com',N'FBSoftware',N'Ing. de Software',N'Fer',N'Fer',N'QUJDLzEyMyo0NTZfNzg5LkFCQy8xMjMqNDU2Xzc4OS6TxFB6y2snIZx65+bj58TA',1,1,'2017-09-11T19:54:40.290',0,0,0,'2017-09-29T19:09:43.923'),
  (2,N'María Fernanda2',N'Barba',N'Velázquez',N'Tierra del Fuego',44630,N'ma.fer.bv23@gmail.com',N'FBSoftware',N'Ing. de Software',N'Fer',N'Fer',N'QUJDLzEyMyo0NTZfNzg5LkFCQy8xMjMqNDU2Xzc4OS6TxFB6y2snIZx65+bj58TA',1,1,'2017-09-11T19:54:40.290',0,0,0,'2017-09-29T19:09:43.923')
) AS Source ([UserID],[Name],[LastName],[Surname],[Address],[ZipCode],[Email],[Organization],[Position],[ShortName],[Login],[Password],[Sex],[StatusID],[CreateDate],[IsReadOnly],[IsFirstSession],[IsActiveSession],[LastLogin])
ON (Target.[UserID] = Source.[UserID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[LastName], Target.[LastName]) IS NOT NULL OR NULLIF(Target.[LastName], Source.[LastName]) IS NOT NULL OR 
	NULLIF(Source.[Surname], Target.[Surname]) IS NOT NULL OR NULLIF(Target.[Surname], Source.[Surname]) IS NOT NULL OR 
	NULLIF(Source.[Address], Target.[Address]) IS NOT NULL OR NULLIF(Target.[Address], Source.[Address]) IS NOT NULL OR 
	NULLIF(Source.[ZipCode], Target.[ZipCode]) IS NOT NULL OR NULLIF(Target.[ZipCode], Source.[ZipCode]) IS NOT NULL OR 
	NULLIF(Source.[Email], Target.[Email]) IS NOT NULL OR NULLIF(Target.[Email], Source.[Email]) IS NOT NULL OR 
	NULLIF(Source.[Organization], Target.[Organization]) IS NOT NULL OR NULLIF(Target.[Organization], Source.[Organization]) IS NOT NULL OR 
	NULLIF(Source.[Position], Target.[Position]) IS NOT NULL OR NULLIF(Target.[Position], Source.[Position]) IS NOT NULL OR 
	NULLIF(Source.[ShortName], Target.[ShortName]) IS NOT NULL OR NULLIF(Target.[ShortName], Source.[ShortName]) IS NOT NULL OR 
	NULLIF(Source.[Login], Target.[Login]) IS NOT NULL OR NULLIF(Target.[Login], Source.[Login]) IS NOT NULL OR 
	NULLIF(Source.[Password], Target.[Password]) IS NOT NULL OR NULLIF(Target.[Password], Source.[Password]) IS NOT NULL OR 
	NULLIF(Source.[Sex], Target.[Sex]) IS NOT NULL OR NULLIF(Target.[Sex], Source.[Sex]) IS NOT NULL OR 
	NULLIF(Source.[StatusID], Target.[StatusID]) IS NOT NULL OR NULLIF(Target.[StatusID], Source.[StatusID]) IS NOT NULL OR 
	NULLIF(Source.[CreateDate], Target.[CreateDate]) IS NOT NULL OR NULLIF(Target.[CreateDate], Source.[CreateDate]) IS NOT NULL OR 
	NULLIF(Source.[IsReadOnly], Target.[IsReadOnly]) IS NOT NULL OR NULLIF(Target.[IsReadOnly], Source.[IsReadOnly]) IS NOT NULL OR 
	NULLIF(Source.[IsFirstSession], Target.[IsFirstSession]) IS NOT NULL OR NULLIF(Target.[IsFirstSession], Source.[IsFirstSession]) IS NOT NULL OR 
	NULLIF(Source.[IsActiveSession], Target.[IsActiveSession]) IS NOT NULL OR NULLIF(Target.[IsActiveSession], Source.[IsActiveSession]) IS NOT NULL OR 
	NULLIF(Source.[LastLogin], Target.[LastLogin]) IS NOT NULL OR NULLIF(Target.[LastLogin], Source.[LastLogin]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [LastName] = Source.[LastName], 
  [Surname] = Source.[Surname], 
  [Address] = Source.[Address], 
  [ZipCode] = Source.[ZipCode], 
  [Email] = Source.[Email], 
  [Organization] = Source.[Organization], 
  [Position] = Source.[Position], 
  [ShortName] = Source.[ShortName], 
  [Login] = Source.[Login], 
  [Password] = Source.[Password], 
  [Sex] = Source.[Sex], 
  [StatusID] = Source.[StatusID], 
  [CreateDate] = Source.[CreateDate], 
  [IsReadOnly] = Source.[IsReadOnly], 
  [IsFirstSession] = Source.[IsFirstSession], 
  [IsActiveSession] = Source.[IsActiveSession], 
  [LastLogin] = Source.[LastLogin]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([UserID],[Name],[LastName],[Surname],[Address],[ZipCode],[Email],[Organization],[Position],[ShortName],[Login],[Password],[Sex],[StatusID],[CreateDate],[IsReadOnly],[IsFirstSession],[IsActiveSession],[LastLogin])
 VALUES(Source.[UserID],Source.[Name],Source.[LastName],Source.[Surname],Source.[Address],Source.[ZipCode],Source.[Email],Source.[Organization],Source.[Position],Source.[ShortName],Source.[Login],Source.[Password],Source.[Sex],Source.[StatusID],Source.[CreateDate],Source.[IsReadOnly],Source.[IsFirstSession],Source.[IsActiveSession],Source.[LastLogin])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO
SET IDENTITY_INSERT [dbo].[mUsers] OFF
GO

MERGE INTO [dbo].[dProfileOperations] AS Target
USING (VALUES
  (1,1)
 ,(1,2)
 ,(1,3)
 ,(1,4)
 ,(1,5)
 ,(1,6)
 ,(1,7)
 ,(1,8)
 ,(1,9)
 ,(1,10)
 ,(1,11)
 ,(1,12)
 ,(1,13)
 ,(1,14)
 ,(1,15)
 ,(1,16)
 ,(1,17)
 ,(1,18)
 ,(1,19)
 ,(1,20)
 ,(1,21)
 ,(1,22)
 ,(1,23)
 ,(1,24)
 ,(1,25)
 ,(1,26)
 ,(1,27)
 ,(1,28)
 ,(1,29)
 ,(1,30)
 ,(1,31)
 ,(1,32)
 ,(1,33)
 ,(1,34)
 ,(1,35)
 ,(1,36)
 ,(1,37)
 ,(1,38)
 ,(1,39)
 ,(1,40)
 ,(1,41)
 ,(1,42)
 ,(1,43)
 ,(1,44)
 ,(1,45)
 ,(1,46)
 ,(1,47)
 ,(1,48)
 ,(1,49)
 ,(1,50)
) AS Source ([ProfileID],[OperationID])
ON (Target.[OperationID] = Source.[OperationID] AND Target.[ProfileID] = Source.[ProfileID])
WHEN NOT MATCHED BY TARGET THEN
 INSERT([ProfileID],[OperationID])
 VALUES(Source.[ProfileID],Source.[OperationID])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO

MERGE INTO [dbo].[dUserProfiles] AS Target
USING (VALUES
  (1,1,1)
) AS Source ([UserID],[ProfileID],[AccessTemplateID])
ON (Target.[ProfileID] = Source.[ProfileID] AND Target.[UserID] = Source.[UserID])
WHEN MATCHED AND (
	NULLIF(Source.[AccessTemplateID], Target.[AccessTemplateID]) IS NOT NULL OR NULLIF(Target.[AccessTemplateID], Source.[AccessTemplateID]) IS NOT NULL) THEN
 UPDATE SET
  [AccessTemplateID] = Source.[AccessTemplateID]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([UserID],[ProfileID],[AccessTemplateID])
 VALUES(Source.[UserID],Source.[ProfileID],Source.[AccessTemplateID])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO

