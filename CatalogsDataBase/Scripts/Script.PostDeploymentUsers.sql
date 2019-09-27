
SET IDENTITY_INSERT [dbo].[Estatus] ON
GO
MERGE INTO [dbo].[Estatus] AS Target
USING (VALUES
  (1,N'Activo'),
  (2,N'Cancelado')
) AS Source ([IdEstatus],[Descripcion])
ON (Target.[IdEstatus] = Source.[IdEstatus])
WHEN MATCHED AND (
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL) THEN
 UPDATE SET
  [Descripcion] = Source.[Descripcion]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdEstatus],[Descripcion])
 VALUES(Source.[IdEstatus],Source.[Descripcion])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;
GO
SET IDENTITY_INSERT [dbo].[Estatus] OFF
GO



SET IDENTITY_INSERT operaciones ON
go
MERGE INTO operaciones AS Target
	USING (VALUES
	(0, 'IniciarSesion'),
	(1, 'HacerVenta'),
(2, 'EliminarVenta'),
(3, 'DarDescuentoEnVenta'),
(4, 'EliminarPagoEnVenta'),
(5, 'VerProductos'),
(6, 'NuevoProducto'),
(7, 'EditarProducto'),
(8, 'EliminarProducto'),
(9, 'VerCostoProducto'),
(10, 'VerClientes'),
(11, 'NuevoCliente'),
(12, 'EditarCliente'),
(13, 'EliminarCliente'),
(14, 'VerProveedores'),
(15, 'NuevoProveedor'),
(16, 'EditarProveedores'),
(17, 'EliminarProveedor'),
(18, 'VerVentasDiarias'),
(19, 'VerCostosEnReportes'),
(20, 'HacerCorteX'),
(21, 'HacerCorteY'),
(22, 'VerCompras'),
(23, 'NuevaCompra'),
(24, 'EditarCompra'),
(25, 'EliminarCompra'),
(26, 'EliminarPagoEnCompra'),
(27, 'MovimientosDeInventario'),
(28, 'HacerDevolucion'),
(29, 'VerUsuarios'),
(30, 'NuevoUsuario'),
(31, 'EditarUsuarios'),
(32, 'VerOperaciones'),
(33, 'AsignarOperaciónaUsuario'),
(34, 'VerMarcas'),
(35, 'NuevaMarca'),
(36, 'EditarMarcas'),
(37, 'EliminarMarcas'),
(38, 'VerTipoProducto'),
(39, 'NuevoTipoProducto'),
(40, 'EditarTipoProducto'),
(41, 'EliminarTipoProducto'),
(42, 'VerTallas'),
(43, 'NuevaTalla'),
(44, 'EditarTalla'),
(45, 'EliminarTalla'),
(46, 'VerInventarioFisico'),
(47, 'NuevoInventarioFisico'),
(48, 'EditarInventarioFisico'),
(49, 'EliminarInventarioFisico'),
(50, 'VerReporteDeVentasPrincipal'),
(51, 'ConfigurarTicket'),
(52, 'ConfigurarEmpresa'),
(53, 'ConfigurarImpresoras')
) AS Source (idoperacion,descripcion)
ON (Target.[IdOperacion] = Source.idoperacion)
WHEN MATCHED AND (
	NULLIF(Source.descripcion, Target.descripcion) IS NOT NULL OR NULLIF(Target.descripcion, Source.descripcion) IS NOT NULL)  THEN
 UPDATE SET
  descripcion = Source.descripcion
WHEN NOT MATCHED BY TARGET THEN
 INSERT(idoperacion, descripcion)
 VALUES(Source.idoperacion,Source.descripcion)
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
SET IDENTITY_INSERT operaciones OFF
GO





SET IDENTITY_INSERT [dbo].[usuario] ON
go
MERGE INTO [dbo].[usuario] AS Target
USING (VALUES
  (1,N'AXEL MURGUIA',NULL,N'axelboneteria@gmail.com ',N'1723',1,N'36503725',N'3313379454',0.0000,'1988-05-23T00:00:00','2017-03-08T00:00:00',NULL)
 ,(2,N'MOISES MURGUIA',NULL,NULL,N'1212',1,NULL,NULL,0.0000,'1990-09-01T00:00:00','2018-11-09T00:00:00',NULL)
 ,(3,N'FERNANDA BARBA',N'LA MISMA DE SU ESPOSO ',NULL,N'0323',1,NULL,NULL,0.0000,'1990-10-23T00:00:00','2018-08-20T00:00:00',NULL)
 ,(4,N'MARIANA LIZETH HUERECA PONCE',N'OASIS 155-B ',N'8 - junio - 2001',N'1234',1,NULL,N'3314169546',0.0000,'2019-01-01T00:00:00','2018-11-08T00:00:00',NULL)
 ,(5,N'JOSELYN MARTINEZ',NULL,NULL,N'1203',2,NULL,NULL,0.0000,'2019-01-01T00:00:00','2017-02-06T00:00:00',NULL)
 ,(6,N'KEYLA PALOMAR VILLASEÑOR',N'ZAPOPAN ',N'13 - noviembre - 2001 ',N'1311',1,NULL,N'3338747991',0.0000,'2001-11-13T00:00:00','2017-08-29T00:00:00',NULL)
 ,(7,N'LITZY DEMY MAGAÑA ',NULL,NULL,N'',2,N'3322016810',NULL,0.0000,'2019-01-01T00:00:00','2018-02-27T00:00:00',NULL)
 ,(8,N'JOANNA JANETH OLIVA RIOS',N'PRIVADA AEROMEXICO #12',NULL,N'1478',2,NULL,N'3326049415',0.0000,'2019-01-01T00:00:00','2018-11-16T00:00:00',NULL)
) AS Source ([IdUsuario],[Nombre],[Direccion],[Email],[Contraseña],[IdEstatus],[Telefono],[Celular],[SueldoBase],[FechaNacimiento],[FechaContratacion],[FechaBaja])
ON (Target.[IdUsuario] = Source.[IdUsuario])
WHEN MATCHED AND (
	NULLIF(Source.[Nombre], Target.[Nombre]) IS NOT NULL OR NULLIF(Target.[Nombre], Source.[Nombre]) IS NOT NULL OR 
	NULLIF(Source.[Direccion], Target.[Direccion]) IS NOT NULL OR NULLIF(Target.[Direccion], Source.[Direccion]) IS NOT NULL OR 
	NULLIF(Source.[Email], Target.[Email]) IS NOT NULL OR NULLIF(Target.[Email], Source.[Email]) IS NOT NULL OR 
	NULLIF(Source.[Contraseña], Target.[Contraseña]) IS NOT NULL OR NULLIF(Target.[Contraseña], Source.[Contraseña]) IS NOT NULL OR 
	NULLIF(Source.[IdEstatus], Target.[IdEstatus]) IS NOT NULL OR NULLIF(Target.[IdEstatus], Source.[IdEstatus]) IS NOT NULL OR 
	NULLIF(Source.[Telefono], Target.[Telefono]) IS NOT NULL OR NULLIF(Target.[Telefono], Source.[Telefono]) IS NOT NULL OR 
	NULLIF(Source.[Celular], Target.[Celular]) IS NOT NULL OR NULLIF(Target.[Celular], Source.[Celular]) IS NOT NULL OR 
	NULLIF(Source.[SueldoBase], Target.[SueldoBase]) IS NOT NULL OR NULLIF(Target.[SueldoBase], Source.[SueldoBase]) IS NOT NULL OR 
	NULLIF(Source.[FechaNacimiento], Target.[FechaNacimiento]) IS NOT NULL OR NULLIF(Target.[FechaNacimiento], Source.[FechaNacimiento]) IS NOT NULL OR 
	NULLIF(Source.[FechaContratacion], Target.[FechaContratacion]) IS NOT NULL OR NULLIF(Target.[FechaContratacion], Source.[FechaContratacion]) IS NOT NULL OR 
	NULLIF(Source.[FechaBaja], Target.[FechaBaja]) IS NOT NULL OR NULLIF(Target.[FechaBaja], Source.[FechaBaja]) IS NOT NULL) THEN
 UPDATE SET
  [Nombre] = Source.[Nombre], 
  [Direccion] = Source.[Direccion], 
  [Email] = Source.[Email], 
  [Contraseña] = Source.[Contraseña], 
  [IdEstatus] = Source.[IdEstatus], 
  [Telefono] = Source.[Telefono], 
  [Celular] = Source.[Celular], 
  [SueldoBase] = Source.[SueldoBase], 
  [FechaNacimiento] = Source.[FechaNacimiento], 
  [FechaContratacion] = Source.[FechaContratacion], 
  [FechaBaja] = Source.[FechaBaja]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdUsuario],[Nombre],[Direccion],[Email],[Contraseña],[IdEstatus],[Telefono],[Celular],[SueldoBase],[FechaNacimiento],[FechaContratacion],[FechaBaja])
 VALUES(Source.[IdUsuario],Source.[Nombre],Source.[Direccion],Source.[Email],Source.[Contraseña],Source.[IdEstatus],Source.[Telefono],Source.[Celular],Source.[SueldoBase],Source.[FechaNacimiento],Source.[FechaContratacion],Source.[FechaBaja])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO


SET IDENTITY_INSERT [AdministracionSistema] ON
GO
MERGE INTO [AdministracionSistema] AS Target
USING (VALUES
  (1,N'YG56fomko48IgD3V0u9gMg==',N'GRWQA5RjlCGi8fUJs/VjeQ==',N'udMkyNr2VJEeXK+RPaBlGw==',N'qx3OwVXypno=')
) AS Source ([Id],[Dato1],[Dato2],[Dato3],[Dato4])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Dato1], Target.[Dato1]) IS NOT NULL OR NULLIF(Target.[Dato1], Source.[Dato1]) IS NOT NULL OR 
	NULLIF(Source.[Dato2], Target.[Dato2]) IS NOT NULL OR NULLIF(Target.[Dato2], Source.[Dato2]) IS NOT NULL OR 
	NULLIF(Source.[Dato3], Target.[Dato3]) IS NOT NULL OR NULLIF(Target.[Dato3], Source.[Dato3]) IS NOT NULL OR 
	NULLIF(Source.[Dato4], Target.[Dato4]) IS NOT NULL OR NULLIF(Target.[Dato4], Source.[Dato4]) IS NOT NULL) THEN
 UPDATE SET
  [Dato1] = Source.[Dato1], 
  [Dato2] = Source.[Dato2], 
  [Dato3] = Source.[Dato3], 
  [Dato4] = Source.[Dato4]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Dato1],[Dato2],[Dato3],[Dato4])
 VALUES(Source.[Id],Source.[Dato1],Source.[Dato2],Source.[Dato3],Source.[Dato4])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
SET IDENTITY_INSERT [AdministracionSistema] OFF
GO

SET IDENTITY_INSERT [CONFIGURACION] ON

MERGE INTO [CONFIGURACION] AS Target
USING (VALUES
  (1,N'NombreEmpresa',N'Bonetería La Comercial')
 ,(2,N'RutaBackup',N'')
) AS Source ([IdConfiguracion],[Nombre],[Valor])
ON (Target.[IdConfiguracion] = Source.[IdConfiguracion])
WHEN MATCHED AND (
	NULLIF(Source.[Nombre], Target.[Nombre]) IS NOT NULL OR NULLIF(Target.[Nombre], Source.[Nombre]) IS NOT NULL OR 
	NULLIF(Source.[Valor], Target.[Valor]) IS NOT NULL OR NULLIF(Target.[Valor], Source.[Valor]) IS NOT NULL) THEN
 UPDATE SET
  [Nombre] = Source.[Nombre], 
  [Valor] = Source.[Valor]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdConfiguracion],[Nombre],[Valor])
 VALUES(Source.[IdConfiguracion],Source.[Nombre],Source.[Valor])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
SET IDENTITY_INSERT [CONFIGURACION] OFF
GO
