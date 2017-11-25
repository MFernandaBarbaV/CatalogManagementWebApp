
SET IDENTITY_INSERT [dbo].[Status] ON
GO
MERGE INTO [dbo].[Status] AS Target
USING (VALUES
  (1,N'Activo')
) AS Source ([StatusID],[Name])
ON (Target.[StatusID] = Source.[StatusID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([StatusID],[Name])
 VALUES(Source.[StatusID],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO



SET IDENTITY_INSERT [dbo].[Operations] ON
GO
MERGE INTO [dbo].[Operations] AS Target
USING (VALUES
  (1,N'Inicio de sesión',1,0)
 ,(2,N'Ver Usuarios',2,0)
 ,(3,N'Editar Usuarios',3,0)
 ,(4,N'Crear Usuario',4,0)
 ,(5,N'Eliminar Usuarios',5,0)
 ,(6,N'Ver Aplicaciones',6,0)
 ,(7,N'Nueva Aplicación',7,0)
 ,(8,N'Editar Aplicaciones',8,0)
 ,(9,N'Eliminar Aplicaciones',9,0)
 ,(10,N'Ver Operaciones',10,0)
 ,(11,N'Nueva Operación',11,0)
 ,(12,N'Editar Operaciones',12,0)
 ,(13,N'Eliminar Operaciones',13,0)
 ,(14,N'Ver Perfiles',14,1)
 ,(15,N'Nuevo Perfil',15,0)
 ,(16,N'Editar Perfiles',16,0)
 ,(17,N'Eliminar Perfiles',17,0)
 ,(18,N'Ver Plantillas de Acceso',18,0)
 ,(19,N'Nueva Plantilla de Acceso',19,0)
 ,(20,N'Editar Plantilla de Acceso',20,0)
 ,(21,N'Eliminar Plantilla de Acceso',21,0)
 ,(22,N'Ver Reportes',22,0)
 ,(23,N'Nuevo Reporte',23,0)
 ,(24,N'Editar Reportes',24,0)
 ,(25,N'Eliminar Reportes',25,0)
 ,(26,N'Imprimir Reportes',26,0)
 ,(27,N'Asignar Operacióna Perfil',27,0)
 ,(28,N'Asignar Reporte a Usuario',28,0)
 ,(29,N'Asignar Reporte a Perfil',29,0)
 ,(30,N'Asignar Perfil a Usuario',30,0)
 ,(31,N'Nueva Compra',31,0)
 ,(32,N'Nuevo Gasto',32,0)
 ,(33,N'Ver Compras',33,0)
 ,(34,N'Ver Gastos',34,0)
 ,(35,N'Dashboard',35,0)
 ,(36,N'Editar Gasto',36,0)
 ,(37,N'Eliminar Gasto',37,0)
 ,(38,N'Ver Tipo de Gasto',38,0)
 ,(39,N'Editar Tipo de Gasto',39,0)
 ,(40,N'Nuevo Tipo de Gasto',40,0)
 ,(41,N'Ver Ventas',41,0)
 ,(42,N'Nueva Venta',42,0)
 ,(43,N'Ver Producto',43,0)
 ,(44,N'Nuevo Producto',44,0)
 ,(45,N'Editar Compra',45,0)
 ,(46,N'Eliminar Compra',46,0)
 ,(47,N'Ver Valance',47,0)
 ,(48,N'Ver Reporte Ventas',48,0)
 ,(49,N'Editar Venta',49,0)
,(50,N'Editar Producto',50,0)
,(51,N'VerProveedores',51,0)
,(52,N'VerClientes',52,0)
,(53,N'VerMarcas',53,0)
,(54,N'VerTipoProducto',54,0)
,(55,N'VerTallas',55,0)
,(56,N'EditarProveedor',56,0)
,(57,N'NuevoProveedor',57,0)
,(58,N'EditarCliente',58,0)
,(59,N'NuevoCliente',59,0)
,(60,N'EditarMarca',60,0)
,(61,N'NuevaMarca',61,0)
,(62,N'EditarTipoProducto',62,0)
,(63,N'NuevoTipoProducto',63,0)

,(64,N'VerReporteInventariosSUPERTICKET',64,0)
,(65,N'VerReporteEntradasSUPERTICKET',65,0)
,(66,N'VerReporteVentasSUPERTICKET',66,0)
,(67,N'VerReporteSalidasSUPERTICKET',67,0)


) AS Source ([OperationID],[Name],[SysOperation],[IsReadOnly])
ON (Target.[OperationID] = Source.[OperationID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[SysOperation], Target.[SysOperation]) IS NOT NULL OR NULLIF(Target.[SysOperation], Source.[SysOperation]) IS NOT NULL OR 
	NULLIF(Source.[IsReadOnly], Target.[IsReadOnly]) IS NOT NULL OR NULLIF(Target.[IsReadOnly], Source.[IsReadOnly]) IS NOT NULL) THEN
 UPDATE SET
  [Name] = Source.[Name], 
  [SysOperation] = Source.[SysOperation], 
  [IsReadOnly] = Source.[IsReadOnly]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([OperationID],[Name],[SysOperation],[IsReadOnly])
 VALUES(Source.[OperationID],Source.[Name],Source.[SysOperation],Source.[IsReadOnly])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO
SET IDENTITY_INSERT [dbo].[Operations] OFF
GO





SET IDENTITY_INSERT [dbo].[Users] ON
GO
MERGE INTO [dbo].[Users] AS Target
USING (VALUES
  (1,N'María Fernanda',N'Barba',N'Velázquez',N'Tierra del Fuego',44630,N'ma.fer.bv23@gmail.com',N'Ing. de Software',N'Fer',N'Fer',N'QUJDLzEyMyo0NTZfNzg5LkFCQy8xMjMqNDU2Xzc4OS6TxFB6y2snIZx65+bj58TA',1,'2017-09-11T19:54:40.290',0,0,0,'2017-09-29T19:09:43.923')

) AS Source ([UserID],[Name],[LastName],[Surname],[Address],[ZipCode],[Email],[Position],[ShortName],[Login],[Password],[StatusID],[CreateDate],[IsReadOnly],[IsFirstSession],[IsActiveSession],[LastLogin])
ON (Target.[UserID] = Source.[UserID])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL OR 
	NULLIF(Source.[LastName], Target.[LastName]) IS NOT NULL OR NULLIF(Target.[LastName], Source.[LastName]) IS NOT NULL OR 
	NULLIF(Source.[Surname], Target.[Surname]) IS NOT NULL OR NULLIF(Target.[Surname], Source.[Surname]) IS NOT NULL OR 
	NULLIF(Source.[Address], Target.[Address]) IS NOT NULL OR NULLIF(Target.[Address], Source.[Address]) IS NOT NULL OR 
	NULLIF(Source.[ZipCode], Target.[ZipCode]) IS NOT NULL OR NULLIF(Target.[ZipCode], Source.[ZipCode]) IS NOT NULL OR 
	NULLIF(Source.[Email], Target.[Email]) IS NOT NULL OR NULLIF(Target.[Email], Source.[Email]) IS NOT NULL OR 
	NULLIF(Source.[Position], Target.[Position]) IS NOT NULL OR NULLIF(Target.[Position], Source.[Position]) IS NOT NULL OR 
	NULLIF(Source.[ShortName], Target.[ShortName]) IS NOT NULL OR NULLIF(Target.[ShortName], Source.[ShortName]) IS NOT NULL OR 
	NULLIF(Source.[Login], Target.[Login]) IS NOT NULL OR NULLIF(Target.[Login], Source.[Login]) IS NOT NULL OR 
	NULLIF(Source.[Password], Target.[Password]) IS NOT NULL OR NULLIF(Target.[Password], Source.[Password]) IS NOT NULL OR 
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
  [Position] = Source.[Position], 
  [ShortName] = Source.[ShortName], 
  [Login] = Source.[Login], 
  [Password] = Source.[Password], 
  [StatusID] = Source.[StatusID], 
  [CreateDate] = Source.[CreateDate], 
  [IsReadOnly] = Source.[IsReadOnly], 
  [IsFirstSession] = Source.[IsFirstSession], 
  [IsActiveSession] = Source.[IsActiveSession], 
  [LastLogin] = Source.[LastLogin]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([UserID],[Name],[LastName],[Surname],[Address],[ZipCode],[Email],[Position],[ShortName],[Login],[Password],[StatusID],[CreateDate],[IsReadOnly],[IsFirstSession],[IsActiveSession],[LastLogin])
 VALUES(Source.[UserID],Source.[Name],Source.[LastName],Source.[Surname],Source.[Address],Source.[ZipCode],Source.[Email],Source.[Position],Source.[ShortName],Source.[Login],Source.[Password],Source.[StatusID],Source.[CreateDate],Source.[IsReadOnly],Source.[IsFirstSession],Source.[IsActiveSession],Source.[LastLogin])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO

MERGE INTO [dbo].[UserOperations] AS Target
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
,(1,51)
,(1,52)
,(1,53)
,(1,54)
,(1,55)
,(1,56)
,(1,57)
,(1,58)
,(1,59)
,(1,60),(1,61)
,(1,62),(1,63)
,(1,64),(1,65),(1,66),(1,67)
) AS Source ([UserId],[OperationID])
ON (Target.[OperationID] = Source.[OperationID] AND Target.[UserId] = Source.[UserId])
WHEN NOT MATCHED BY TARGET THEN
 INSERT([UserId],[OperationID])
 VALUES(Source.[UserId],Source.[OperationID])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO

