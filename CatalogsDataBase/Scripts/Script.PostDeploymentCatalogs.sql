
SET IDENTITY_INSERT [dbo].[Clientes] ON

MERGE INTO [dbo].[Clientes] AS Target
USING (VALUES
  (1,N'Venta de Mostrador',N'',N'',N'',N'',N'',N'',N'',N'',N'',N'')
 ,(2,N'María Fernanda',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)
) AS Source ([IdCliente],[NombreCliente],[Email],[RFC],[CalleDomicilioFiscal],[NumeroInteriorDomicilioFiscal],[NumeroExteriorDomicilioFiscal],[ColoniaDomicilioFiscal],[CodigoPostalDomicilioFiscal],[CiudadDomicilioFiscal],[EstadoDomicilioFiscal],[Telefono])
ON (Target.[IdCliente] = Source.[IdCliente])
WHEN MATCHED AND (
	NULLIF(Source.[NombreCliente], Target.[NombreCliente]) IS NOT NULL OR NULLIF(Target.[NombreCliente], Source.[NombreCliente]) IS NOT NULL OR 
	NULLIF(Source.[Email], Target.[Email]) IS NOT NULL OR NULLIF(Target.[Email], Source.[Email]) IS NOT NULL OR 
	NULLIF(Source.[RFC], Target.[RFC]) IS NOT NULL OR NULLIF(Target.[RFC], Source.[RFC]) IS NOT NULL OR 
	NULLIF(Source.[CalleDomicilioFiscal], Target.[CalleDomicilioFiscal]) IS NOT NULL OR NULLIF(Target.[CalleDomicilioFiscal], Source.[CalleDomicilioFiscal]) IS NOT NULL OR 
	NULLIF(Source.[NumeroInteriorDomicilioFiscal], Target.[NumeroInteriorDomicilioFiscal]) IS NOT NULL OR NULLIF(Target.[NumeroInteriorDomicilioFiscal], Source.[NumeroInteriorDomicilioFiscal]) IS NOT NULL OR 
	NULLIF(Source.[NumeroExteriorDomicilioFiscal], Target.[NumeroExteriorDomicilioFiscal]) IS NOT NULL OR NULLIF(Target.[NumeroExteriorDomicilioFiscal], Source.[NumeroExteriorDomicilioFiscal]) IS NOT NULL OR 
	NULLIF(Source.[ColoniaDomicilioFiscal], Target.[ColoniaDomicilioFiscal]) IS NOT NULL OR NULLIF(Target.[ColoniaDomicilioFiscal], Source.[ColoniaDomicilioFiscal]) IS NOT NULL OR 
	NULLIF(Source.[CodigoPostalDomicilioFiscal], Target.[CodigoPostalDomicilioFiscal]) IS NOT NULL OR NULLIF(Target.[CodigoPostalDomicilioFiscal], Source.[CodigoPostalDomicilioFiscal]) IS NOT NULL OR 
	NULLIF(Source.[CiudadDomicilioFiscal], Target.[CiudadDomicilioFiscal]) IS NOT NULL OR NULLIF(Target.[CiudadDomicilioFiscal], Source.[CiudadDomicilioFiscal]) IS NOT NULL OR 
	NULLIF(Source.[EstadoDomicilioFiscal], Target.[EstadoDomicilioFiscal]) IS NOT NULL OR NULLIF(Target.[EstadoDomicilioFiscal], Source.[EstadoDomicilioFiscal]) IS NOT NULL OR 
	NULLIF(Source.[Telefono], Target.[Telefono]) IS NOT NULL OR NULLIF(Target.[Telefono], Source.[Telefono]) IS NOT NULL) THEN
 UPDATE SET
  [NombreCliente] = Source.[NombreCliente], 
  [Email] = Source.[Email], 
  [RFC] = Source.[RFC], 
  [CalleDomicilioFiscal] = Source.[CalleDomicilioFiscal], 
  [NumeroInteriorDomicilioFiscal] = Source.[NumeroInteriorDomicilioFiscal], 
  [NumeroExteriorDomicilioFiscal] = Source.[NumeroExteriorDomicilioFiscal], 
  [ColoniaDomicilioFiscal] = Source.[ColoniaDomicilioFiscal], 
  [CodigoPostalDomicilioFiscal] = Source.[CodigoPostalDomicilioFiscal], 
  [CiudadDomicilioFiscal] = Source.[CiudadDomicilioFiscal], 
  [EstadoDomicilioFiscal] = Source.[EstadoDomicilioFiscal], 
  [Telefono] = Source.[Telefono]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdCliente],[NombreCliente],[Email],[RFC],[CalleDomicilioFiscal],[NumeroInteriorDomicilioFiscal],[NumeroExteriorDomicilioFiscal],[ColoniaDomicilioFiscal],[CodigoPostalDomicilioFiscal],[CiudadDomicilioFiscal],[EstadoDomicilioFiscal],[Telefono])
 VALUES(Source.[IdCliente],Source.[NombreCliente],Source.[Email],Source.[RFC],Source.[CalleDomicilioFiscal],Source.[NumeroInteriorDomicilioFiscal],Source.[NumeroExteriorDomicilioFiscal],Source.[ColoniaDomicilioFiscal],Source.[CodigoPostalDomicilioFiscal],Source.[CiudadDomicilioFiscal],Source.[EstadoDomicilioFiscal],Source.[Telefono])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;

SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO


 
 SET IDENTITY_INSERT [dbo].[TipoGasto] ON

MERGE INTO [dbo].[TipoGasto] AS Target
USING (VALUES
  (1,N'Renta')
 ,(2,N'Papelería')
 ,(3,N'Sueldos')
 ,(4,N'Gasolina')
) AS Source ([IdTipoGasto],[Descripcion])
ON (Target.[IdTipoGasto] = Source.[IdTipoGasto])
WHEN MATCHED AND (
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL) THEN
 UPDATE SET
  [Descripcion] = Source.[Descripcion]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdTipoGasto],[Descripcion])
 VALUES(Source.[IdTipoGasto],Source.[Descripcion])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[TipoGasto] OFF
GO

  

SET IDENTITY_INSERT [dbo].[Gastos] ON

MERGE INTO [dbo].[Gastos] AS Target
USING (VALUES
  (1,1,N'Renta Septiembre',4000.0000,'2017-09-11T23:49:05.877')
 ,(4,1,N'renta agosto',5000.0000,'2017-08-19T22:38:23')
 ,(5,3,N'fer',10000.0000,'2017-09-27T21:45:59')
 ,(6,2,N'Cartulina',5.0000,'2017-09-27T21:56:51')
 ,(7,2,N'Globos',400.0000,'2017-10-23T00:00:00')
) AS Source ([IdGasto],[IdTipoGasto],[Descripcion],[Cantidad],[Fecha])
ON (Target.[IdGasto] = Source.[IdGasto])
WHEN MATCHED AND (
	NULLIF(Source.[IdTipoGasto], Target.[IdTipoGasto]) IS NOT NULL OR NULLIF(Target.[IdTipoGasto], Source.[IdTipoGasto]) IS NOT NULL OR 
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL OR 
	NULLIF(Source.[Cantidad], Target.[Cantidad]) IS NOT NULL OR NULLIF(Target.[Cantidad], Source.[Cantidad]) IS NOT NULL OR 
	NULLIF(Source.[Fecha], Target.[Fecha]) IS NOT NULL OR NULLIF(Target.[Fecha], Source.[Fecha]) IS NOT NULL) THEN
 UPDATE SET
  [IdTipoGasto] = Source.[IdTipoGasto], 
  [Descripcion] = Source.[Descripcion], 
  [Cantidad] = Source.[Cantidad], 
  [Fecha] = Source.[Fecha]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdGasto],[IdTipoGasto],[Descripcion],[Cantidad],[Fecha])
 VALUES(Source.[IdGasto],Source.[IdTipoGasto],Source.[Descripcion],Source.[Cantidad],Source.[Fecha])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[Gastos] OFF
GO



SET IDENTITY_INSERT [dbo].[Unidad] ON

MERGE INTO [dbo].[Unidad] AS Target
USING (VALUES
  (1,N'PIEZA',1)
 ,(2,N'DOCENA',12)
) AS Source ([IdUnidad],[Descripcion],[Cantidad])
ON (Target.[IdUnidad] = Source.[IdUnidad])
WHEN MATCHED AND (
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL OR 
	NULLIF(Source.[Cantidad], Target.[Cantidad]) IS NOT NULL OR NULLIF(Target.[Cantidad], Source.[Cantidad]) IS NOT NULL) THEN
 UPDATE SET
  [Descripcion] = Source.[Descripcion], 
  [Cantidad] = Source.[Cantidad]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdUnidad],[Descripcion],[Cantidad])
 VALUES(Source.[IdUnidad],Source.[Descripcion],Source.[Cantidad])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[Unidad] OFF
GO


 

  

SET IDENTITY_INSERT [dbo].[Proveedor] ON

MERGE INTO [dbo].[Proveedor] AS Target
USING (VALUES
  (1,N'LA R COMERCIAL DEL NORTE GARAY                                                                      ',N'36186044',N'AV. REPUBLICA 73 Colonia LA PERLA GUADALAJARA  JAL.',N'',N'',60)
 ,(2,N'LA COMERCIAL                                                                                        ',N'36551420',N'F. MEDRANO 1595   GUADALAJARA  JAL.',N'',N'axelmoy@hotmail.com ',30)
 ,(3,N'GASER                                                                                               ',N'',N'',N'',N'',0)
 ,(4,N'CALCETIN GOLDEN MENS                                                                                ',N'',N'',N'',N'',1)
 ,(5,N'IMPORTACIONES MEISANMEI                                                                             ',N'',N'',N'',N'',1)
 ,(6,N'RIGAMA                                                                                              ',N'',N'',N'CUENTA HSBC 0213200032105295610321052956  ',N'',1)
 ,(7,N'MAMIA                                                                                               ',N'',N'LOS ANGELES',N'',N'',10)
 ,(8,N'FEDERALISMO                                                                                         ',N'',N'',N'',N'',30)
 ,(9,N'DUCK LINE                                                                                           ',N'',N'',N'',N'',1)
 ,(10,N'OMAR                                                                                                ',N'',N'',N'',N'',0)
 ,(11,N'CHACHA                                                                                              ',N'',N'',N'',N'',0)
 ,(12,N'SR. RITO G.                                                                                         ',N'',N'ZAPOPAN',N'',N'',30)
 ,(13,N'LUIS                                                                                                ',N'',N'LOS ANGELES 275  Colonia LAS CONCHAS  GDL  JAL ',N'',N'',0)
 ,(14,N'OLIMPICOS                                                                                           ',N'',N'MUY CERCA DEL NEGOCIO  Colonia ANALCO GUADALAJARA  JALISCO',N'',N'',0)
 ,(15,N'BANCAS COMO LA DEL TREBOL                                                                           ',N'3334934301',N'Colonia LAS CONCHAS',N'',N'',0)
 ,(16,N'WILD BOYS A.C.E.S.A.                                                                                ',N'',N'CDMX',N'',N'',0)
) AS Source ([IdProveedor],[NombreProveedor],[Telefono],[Dirección],[InformacionBancaria],[Email],[DiasCredito])
ON (Target.[IdProveedor] = Source.[IdProveedor])
WHEN MATCHED AND (
	NULLIF(Source.[NombreProveedor], Target.[NombreProveedor]) IS NOT NULL OR NULLIF(Target.[NombreProveedor], Source.[NombreProveedor]) IS NOT NULL OR 
	NULLIF(Source.[Telefono], Target.[Telefono]) IS NOT NULL OR NULLIF(Target.[Telefono], Source.[Telefono]) IS NOT NULL OR 
	NULLIF(Source.[Dirección], Target.[Dirección]) IS NOT NULL OR NULLIF(Target.[Dirección], Source.[Dirección]) IS NOT NULL OR 
	NULLIF(Source.[InformacionBancaria], Target.[InformacionBancaria]) IS NOT NULL OR NULLIF(Target.[InformacionBancaria], Source.[InformacionBancaria]) IS NOT NULL OR 
	NULLIF(Source.[Email], Target.[Email]) IS NOT NULL OR NULLIF(Target.[Email], Source.[Email]) IS NOT NULL OR 
	NULLIF(Source.[DiasCredito], Target.[DiasCredito]) IS NOT NULL OR NULLIF(Target.[DiasCredito], Source.[DiasCredito]) IS NOT NULL) THEN
 UPDATE SET
  [NombreProveedor] = Source.[NombreProveedor], 
  [Telefono] = Source.[Telefono], 
  [Dirección] = Source.[Dirección], 
  [InformacionBancaria] = Source.[InformacionBancaria], 
  [Email] = Source.[Email], 
  [DiasCredito] = Source.[DiasCredito]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdProveedor],[NombreProveedor],[Telefono],[Dirección],[InformacionBancaria],[Email],[DiasCredito])
 VALUES(Source.[IdProveedor],Source.[NombreProveedor],Source.[Telefono],Source.[Dirección],Source.[InformacionBancaria],Source.[Email],Source.[DiasCredito])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO




SET IDENTITY_INSERT [dbo].[Genero] ON

MERGE INTO [dbo].[Genero] AS Target
USING (VALUES
  (1,N'(NO SELECCIONADA) ')
 ,(2,N'Niño')
 ,(3,N'Niña')
 ,(4,N'Caballero')
 ,(5,N'Dama')
 ,(6,N'Unisex')
 ,(7,N'Infantil')
) AS Source ([IdGenero],[Descripcion])
ON (Target.[IdGenero] = Source.[IdGenero])
WHEN MATCHED AND (
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL) THEN
 UPDATE SET
  [Descripcion] = Source.[Descripcion]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdGenero],[Descripcion])
 VALUES(Source.[IdGenero],Source.[Descripcion])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO




SET IDENTITY_INSERT [dbo].[Marca] ON

MERGE INTO [dbo].[Marca] AS Target
USING (VALUES
  (1,N'(NO SELECCIONADA)')
 ,(2,N'GOLDEN MENS')
 ,(3,N'GASER')
 ,(4,N'GALATEX')
 ,(5,N'MSM')
 ,(6,N'ARYEHS')
 ,(7,N'KNOCKER')
 ,(8,N'MAMIA')
 ,(9,N'DUCKLINE')
 ,(10,N'DANIELA')
 ,(11,N'RIGAMA')
 ,(12,N'NATHALIE')
 ,(13,N'MARELY')
 ,(14,N'WILDBOYS')
 ,(15,N'MOPAS')
 ,(16,N'PACO')
 ,(17,N'JOSH')
) AS Source ([IdMarca],[Descripcion])
ON (Target.[IdMarca] = Source.[IdMarca])
WHEN MATCHED AND (
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL) THEN
 UPDATE SET
  [Descripcion] = Source.[Descripcion]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdMarca],[Descripcion])
 VALUES(Source.[IdMarca],Source.[Descripcion])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO




SET IDENTITY_INSERT [dbo].[SubTipoProducto] ON

MERGE INTO [dbo].[SubTipoProducto] AS Target
USING (VALUES
  (1,N'(NO SELECCIONADA)             ',1)
 ,(2,N'BIKINI',2)
 ,(3,N'BIKER',2)
 ,(5,N'BOXER',2)
 ,(6,N'CAMISETA',4)
 ,(7,N'PANTALETA',2)
 ,(8,N'TRUZA',2)
 ,(9,N'CALCETIN',3)
 ,(10,N'TOP',5)
 ,(11,N'TIN',3)
 ,(12,N'TANGA',2)
 ,(13,N'BRASSIERE',5)
 ,(14,N'PAÑALERO',6)
 ,(15,N'PRENDA GENERICA',7)
 ,(16,N'FONDO',12)
 ,(17,N'PANTALON',9)
 ,(18,N'SHORT',11)
 ,(19,N'GUANTE',8)
 ,(20,N'CALCETA',3)
 ,(21,N'MALLA',10)
 ,(22,N'CRUZADITA',6)
 ,(23,N'MANDIL',7)
 ,(24,N'BLUMER',11)
 ,(25,N'FLETE',13)
 ,(26,N'FAJA',14)
 ,(27,N'CINTURILLA',14)
 ,(28,N'BODY',14)
) AS Source ([IdSubTipoProducto],[Descripcion],[IdTipoProducto])
ON (Target.[IdSubTipoProducto] = Source.[IdSubTipoProducto])
WHEN MATCHED AND (
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL OR 
	NULLIF(Source.[IdTipoProducto], Target.[IdTipoProducto]) IS NOT NULL OR NULLIF(Target.[IdTipoProducto], Source.[IdTipoProducto]) IS NOT NULL) THEN
 UPDATE SET
  [Descripcion] = Source.[Descripcion], 
  [IdTipoProducto] = Source.[IdTipoProducto]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdSubTipoProducto],[Descripcion],[IdTipoProducto])
 VALUES(Source.[IdSubTipoProducto],Source.[Descripcion],Source.[IdTipoProducto])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[SubTipoProducto] OFF
GO




SET IDENTITY_INSERT [dbo].[Talla] ON

MERGE INTO [dbo].[Talla] AS Target
USING (VALUES
  (1,N'(NO SELECCIONADA)',NULL)
) AS Source ([IdTalla],[Descripcion],[IdGenero])
ON (Target.[IdTalla] = Source.[IdTalla])
WHEN MATCHED AND (
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL OR 
	NULLIF(Source.[IdGenero], Target.[IdGenero]) IS NOT NULL OR NULLIF(Target.[IdGenero], Source.[IdGenero]) IS NOT NULL) THEN
 UPDATE SET
  [Descripcion] = Source.[Descripcion], 
  [IdGenero] = Source.[IdGenero]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdTalla],[Descripcion],[IdGenero])
 VALUES(Source.[IdTalla],Source.[Descripcion],Source.[IdGenero])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[Talla] OFF
GO



SET IDENTITY_INSERT [dbo].[TipoProducto] ON

MERGE INTO [dbo].[TipoProducto] AS Target
USING (VALUES
  (1,N'(NO SELECCIONADA)             ')
 ,(2,N'CALZÓN')
 ,(3,N'CALCETÍN')
 ,(4,N'CAMISETA')
 ,(5,N'TOP/BRASIER')
 ,(6,N'BEBÉ')
 ,(7,N'PRENDA GENERICA')
 ,(8,N'GUANTE')
 ,(9,N'PANTALON')
 ,(10,N'MALLA')
 ,(11,N'SHORT')
 ,(12,N'FONDO')
 ,(13,N'OTRO')
 ,(14,N'FAJA')
) AS Source ([IdTipoProducto],[Descripcion])
ON (Target.[IdTipoProducto] = Source.[IdTipoProducto])
WHEN MATCHED AND (
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL) THEN
 UPDATE SET
  [Descripcion] = Source.[Descripcion]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdTipoProducto],[Descripcion])
 VALUES(Source.[IdTipoProducto],Source.[Descripcion])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[TipoProducto] OFF
GO


SET IDENTITY_INSERT [dbo].[Producto] ON

MERGE INTO [dbo].[Producto] AS Target
USING (VALUES
  (1,N'GRACIAS POR SU VISITA',N'100',0,1,1,1,1,1,1,1,0.0000)
 ,(17,N'CALCETIN GOLDEN MENS',N'1000',0,3,9,2,4,1,1,4,7.0000)
 ,(18,N'BIKINI GASER T/30',N'1001',0,2,2,3,3,1,1,5,9.5833)
 ,(19,N'BIKINI GASER T/32',N'1002',0,1,1,1,3,1,1,1,10.0000)
 ,(20,N'BIKINI GASER T/34',N'1003',0,1,1,1,3,1,1,1,12.0000)
 ,(21,N'BIKINI GASER UNITALLA',N'1004',0,1,1,1,3,1,1,1,13.0000)
 ,(22,N'BIKINI GASER T/42',N'1005',0,1,1,1,3,1,1,1,15.0000)
 ,(23,N'BIKINI GASER T/44',N'1006',0,1,1,1,3,1,1,1,18.0000)
 ,(24,N'BIKER GASER NIÑO T/6',N'1007',0,1,1,1,3,1,1,1,14.1667)
 ,(25,N'BIKER GASER NIÑO T/8',N'1008',0,1,1,1,3,1,1,1,15.8333)
 ,(26,N'BIKER GASER NIÑO T/10',N'1009',0,1,1,1,3,1,1,1,18.3333)
 ,(27,N'BIKER GASER JUVENIL CH',N'1010',0,1,1,1,3,1,1,1,24.1667)
 ,(28,N'BIKER GASER MEDIANO',N'1011',0,1,1,1,3,1,1,1,26.6667)
 ,(29,N'BIKER GASER UNITALLA',N'1012',0,1,1,1,3,1,1,1,28.3333)
 ,(30,N'BIKER GASER EXT T/42',N'1013',0,1,1,1,3,1,1,1,32.5000)
 ,(31,N'BIKER GASER EXT T/44',N'1014',0,1,1,1,3,1,1,1,32.5000)
 ,(32,N'BIKER LARGO GASER JUV',N'1015',0,1,1,1,3,1,1,1,24.1667)
 ,(33,N'BIKER LARGO GASER MED',N'1016',0,1,1,1,3,1,1,1,26.6667)
 ,(34,N'BIKER LARGO GASER UNI',N'1017',0,1,1,1,3,1,1,1,29.1667)
 ,(35,N'BIKER LARGO GASER T/42',N'1018',0,1,1,1,3,1,1,1,32.5000)
 ,(36,N'BIKER LARGO GASER T/44',N'1019',0,1,1,1,3,1,1,1,34.1667)
 ,(37,N'BIKER CARDIGAN MED',N'1020',0,1,1,1,3,1,1,1,24.1667)
 ,(38,N'BIKER CARDIGAN GRD',N'1021',0,1,1,1,3,1,1,1,25.0000)
 ,(39,N'BIKINI ILUSION DAM CH,M,G',N'1022',0,1,1,1,3,1,1,1,11.6667)
 ,(40,N'BIKINI 3PASOS CH M',N'1023',0,1,1,1,3,1,1,1,7.9167)
 ,(41,N'BIKINI 3PASOS GR EXT',N'1024',0,1,1,1,3,1,1,1,9.5833)
 ,(42,N'BOXER LISO GASER 34',N'1025',0,1,1,1,3,1,1,1,20.0000)
 ,(43,N'BOXER LISO GASER 36',N'1026',0,1,1,1,3,1,1,1,23.3333)
 ,(44,N'BOXER LISO GASER 38',N'1027',0,1,1,1,3,1,1,1,25.8333)
 ,(45,N'BOXER LISO GASER 40',N'1028',0,1,1,1,3,1,1,1,28.3333)
 ,(46,N'BOXER THALIA CH M G',N'1029',0,1,1,1,3,1,1,1,15.4167)
 ,(47,N'BOXER THALIA EX & EXX',N'1030',0,1,1,1,3,1,1,1,19.5833)
 ,(48,N'CAMISETA DAMA 34/36 GASER',N'1031',0,1,1,1,3,1,1,1,22.5000)
 ,(49,N'CAMISETA DAMA 38/40 GASER',N'1032',0,1,1,1,3,1,1,1,27.5000)
 ,(50,N'PANTALETA CHIFON 36-40 GASER',N'1033',0,1,1,1,3,1,1,1,12.0000)
 ,(51,N'PANTALETA CHIFON 42-46 GASER',N'1034',0,1,1,1,3,1,1,1,15.8333)
 ,(52,N'PANTALETA INTER T/2-6 GASER',N'1035',0,1,1,1,3,1,1,1,10.0000)
 ,(53,N'PANTALETA INTER T/8-12GASER',N'1036',0,1,1,1,3,1,1,1,11.6667)
 ,(54,N'PANTALETA INTER T/34-40GASER',N'1037',0,1,1,1,3,1,1,1,19.1667)
 ,(55,N'PANTALETA INTER T/42-46GASER',N'1038',0,1,1,1,3,1,1,1,25.0000)
 ,(56,N'TRUZA ALGODON R/O 34-40',N'1039',0,1,1,1,3,1,1,1,20.0000)
 ,(57,N'TRUZA BOMBAY 26-32',N'1040',0,1,1,1,3,1,1,1,7.5000)
 ,(58,N'TRUZA BOMBAY 34-42',N'1041',0,1,1,1,3,1,1,1,10.4167)
 ,(59,N'TRUZA BOMBAY 44-46',N'1042',0,1,1,1,3,1,1,1,15.0000)
 ,(60,N'BIKINI DANIELA OFERTA',N'1043',0,1,1,1,1,1,1,1,10.4167)
 ,(61,N'BIKINI CHISPA ALGODON CH/M/G',N'1044',0,1,1,1,6,1,1,1,8.4167)
 ,(62,N'BIKINI OFERTA FLORES ALTO',N'1045',0,1,1,1,1,1,1,1,6.6667)
 ,(63,N'PAÑALERO T/1-2-3 M/C GASER',N'1046',0,1,1,1,9,1,1,1,17.5000)
 ,(64,N'BIKINI GALATEX T/G',N'1047',0,1,1,1,2,1,1,1,9.1667)
 ,(65,N'BIKINI GALATEX T/M',N'1048',0,1,1,1,2,1,1,1,9.1667)
 ,(66,N'BIKINI GALATEX T/EX',N'1049',0,1,1,1,2,1,1,1,9.5833)
 ,(67,N'BOXER EST. GALATEX UNI',N'1050',0,1,1,1,2,1,1,1,12.5000)
 ,(68,N'BOXER GALATEX T/EX',N'1051',0,1,1,1,2,1,1,1,12.9167)
 ,(69,N'BOXER MICRO-F MSM',N'1052',0,1,1,1,5,1,1,1,13.5000)
 ,(70,N'BOXER MICRO-F MSM DAMA',N'1053',0,1,1,1,5,1,1,1,13.0000)
 ,(71,N'BIKINI T/TAN UNI GASER',N'1054',0,1,1,1,3,1,1,1,18.0000)
 ,(72,N'CAMISETA OLIMPICA RIGAMA',N'1055',0,1,1,1,6,1,1,1,21.6667)
 ,(73,N'CAJA CALCETIN GOLDEN MENS',N'1000.',0,3,9,2,4,1,1,4,4.5000)
 ,(74,N'CAMISETA TIRANTE RIGAMA 36-42',N'1056',0,1,1,1,6,1,1,1,21.6667)
 ,(75,N'CAM ARYEHS BCA UNI',N'1059',0,1,1,1,2,1,1,1,11.8333)
 ,(76,N'CAM ARYEHS COL UNI',N'1060',0,1,1,1,2,1,1,1,14.0833)
 ,(77,N'CAM ARYEHS BCA EXT',N'1061',0,1,1,1,2,1,1,1,14.0833)
 ,(78,N'CAM ARYEHS COL EXT',N'1062',0,1,1,1,2,1,1,1,15.5833)
 ,(79,N'CAM ARYEHS BCA MINI',N'1063',0,1,1,1,2,1,1,1,6.5833)
 ,(80,N'CAM ARYEHS JUVENIL',N'1064',0,1,1,1,2,1,1,1,9.3333)
 ,(81,N'BOXER KNOCKER UNIT',N'1065',0,1,1,1,7,1,1,1,28.1667)
 ,(82,N'BOXER KNOCKER JUNIOR',N'1066',0,1,1,1,7,1,1,1,23.2500)
 ,(83,N'TOP DE ENCAJE SOFRA P/6',N'1067',0,1,1,1,7,1,1,1,37.5000)
 ,(84,N'BOXER ENCAJE SOFRA P/6',N'1068',0,1,1,1,7,1,1,1,37.5000)
 ,(85,N'BOXER MAMIA T/MEZ UNIT',N'1069',0,1,1,1,7,1,1,1,21.9167)
 ,(86,N'TOP COLORES MICROFIBRA UNI',N'1070',0,1,1,1,7,1,1,1,48.0000)
 ,(87,N'PAÑALERO M/L MARNAT',N'1071',0,1,1,1,2,1,1,1,12.0833)
 ,(88,N'TIN DAMA MEDICAL CORTO',N'1072',0,1,1,1,9,1,1,1,9.5833)
 ,(89,N'TIN DAMA MEDICAL 3/4 DUCKLINE',N'1073',0,1,1,1,9,1,1,1,10.8333)
 ,(90,N'TIN CABALLERO MEDICAL CORTO',N'1074',0,1,1,1,9,1,1,1,9.8333)
 ,(91,N'TIN CABALLERO MEDICAL 3/4',N'1075',0,1,1,1,9,1,1,1,10.8333)
 ,(92,N'TIN EXTRACORTO BCO/COL DUCKLINE',N'1076',0,1,1,1,9,1,1,1,7.6667)
 ,(93,N'TIN PARA NIÑA T/0-2 DUCKLINE',N'1077',0,1,1,1,9,1,1,1,7.1667)
 ,(94,N'TIN NIÑ0 0/2 3/5 6/9 10/13 DUCKLINE',N'1078',0,1,1,1,9,1,1,1,7.3333)
 ,(95,N'TIN SPORT FELPA DAMA DUCKLINE',N'1079',0,1,1,1,9,1,1,1,9.5833)
 ,(96,N'TIN SPORT FELPA CAB DUCKLINE',N'1080',0,1,1,1,9,1,1,1,10.2500)
 ,(97,N'TIN JOMER LINE SPORT 3/4 DUCKLINE',N'1081',0,1,1,1,9,1,1,1,9.5000)
 ,(98,N'TIN JOMER LINE P/T GRIS DUCKLINE',N'1082',0,1,1,1,9,1,1,1,8.4167)
 ,(99,N'TIN JOMERLINE TUBO/CORTO DUCKLINE',N'1083',0,1,1,1,9,1,1,1,8.8333)
 ,(100,N'TANGA OFERTA LYCRA NATHALIE',N'1084',0,1,1,1,1,1,1,1,6.6667)
 ,(101,N'BRASS BELLA PUSH-UP',N'1090',0,1,1,1,2,1,1,1,46.0000)
 ,(102,N'BRASS MOPAS T/32-38B',N'1091',0,1,1,1,2,1,1,1,46.0000)
 ,(103,N'MEDIO FONDO JERSEY UNITALLA',N'1085',0,1,1,1,2,1,1,1,22.1667)
 ,(104,N'MEDIO FONDO JERSEY T/EXTRA',N'1086',0,1,1,1,2,1,1,1,20.9167)
 ,(105,N'BRASS MAMIA T/32-38B',N'1092',0,1,1,1,7,1,1,1,32.0000)
 ,(106,N'MEDIO FONDO ALGODON UNITALLA',N'1087',0,1,1,1,2,1,1,1,19.2500)
 ,(107,N'MEDIO FONDO ALGODON JUVENIL',N'1088',0,1,1,1,2,1,1,1,19.0833)
 ,(108,N'PANTS NIÑO/NIÑA ECONOMICO',N'1089',0,1,1,1,2,1,1,1,15.0000)
 ,(109,N'PAÑALERO JUMBO ESTAMPADO',N'1095',0,1,1,1,2,1,1,1,20.8333)
 ,(110,N'TRUZA RIGAMA ALGODON T/34-44',N'1096',0,1,1,1,6,1,1,1,18.3333)
 ,(111,N'PANTALON T/MALLA VESTIR T/30-38',N'1097',0,1,1,1,10,1,1,1,115.0000)
 ,(112,N'PANTALON 3-B VESTIR T/30-40',N'1098',0,1,1,1,2,1,1,1,105.0000)
 ,(113,N'CALCETIN CAB. EUROPA CAJA',N'1099',0,1,1,1,9,1,1,1,10.8333)
 ,(114,N'CALCETIN CAB. DIAB CAJA LISO DUCKLINE',N'1100',0,1,1,1,9,1,1,1,10.5833)
 ,(115,N'TIN JOMER CAB. LIKRA EST25 DUCKLINE',N'1101',0,1,1,1,9,1,1,1,9.5000)
 ,(116,N'TIN NIÑO JOMER T/3-5 LIKRA DUCKLINE',N'1102',0,1,1,1,9,1,1,1,7.1667)
 ,(117,N'TIN NIÑO JOMER T/6-9 LIKRA DUCKLINE',N'1103',0,1,1,1,9,1,1,1,7.4167)
 ,(118,N'TIN NIÑO JOMER T/9-12 LIKRA DUCKLINE',N'1104',0,1,1,1,9,1,1,1,7.6667)
 ,(119,N'CALCETIN T/CUBANO PABILON',N'1105',0,1,1,1,2,1,1,1,7.3333)
 ,(120,N'OBJETO PRENDARIO GENERICO',N'101',0,1,1,1,1,1,1,1,0.8333)
 ,(121,N'CAM NIÑA T/2 TIRANTE GASER',N'1106',0,1,1,1,3,1,1,1,10.0000)
 ,(122,N'CAM NIÑA T/4 TIRANTE GASER',N'1107',0,1,1,1,3,1,1,1,10.8333)
 ,(123,N'CAM NIÑA T/6 TIRANTE GASER',N'1108',0,1,1,1,3,1,1,1,12.5000)
 ,(124,N'CAM NIÑA T/8 TIRANTE GASER',N'1109',0,1,1,1,3,1,1,1,13.3333)
 ,(125,N'CAM NIÑA T/10 TIRANTE GASER',N'1110',0,1,1,1,3,1,1,1,14.1667)
 ,(126,N'CAM NIÑA T/12 TIRANTE GASER',N'1111',0,1,1,1,3,1,1,1,15.0000)
 ,(127,N'CAM NIÑA T/14 TIRANTE GASER',N'1112',0,1,1,1,3,1,1,1,16.6667)
 ,(128,N'BRASS AFATA T/34-44D',N'1113',0,1,1,1,7,1,1,1,40.0000)
 ,(129,N'BIKINI CATS T/M G',N'1114',0,1,1,1,2,1,1,1,27.8333)
 ,(130,N'BRASS MAMIA T/34-40C',N'1093',0,1,1,1,7,1,1,1,34.3667)
 ,(131,N'BIKIN LYNJEE JUVENIL ALGODON',N'1115',0,1,1,1,1,1,1,1,15.0000)
 ,(132,N'BIKINI DANIELA T/CH-M-G',N'1116',0,1,1,1,1,1,1,1,8.3333)
 ,(133,N'TANGA DANIELA T/CH-M-G',N'1117',0,1,1,1,1,1,1,1,4.1667)
 ,(134,N'TANGA D MEZCLILLA FINESS',N'1118',0,1,1,1,1,1,1,1,7.5000)
 ,(135,N'PATALETA NATHALIE LICRA/ALGODON',N'1119',0,1,1,1,1,1,1,1,19.1667)
 ,(136,N'PANTALETA ENCAJE OFERTA',N'1120',0,1,1,1,1,1,1,1,8.3333)
 ,(137,N'TRUZA INTER RIGAMA T/2-6 NIÑO',N'1121',0,1,1,1,6,1,1,1,11.9583)
 ,(138,N'TRUZA INTER RIGAMA T/8-12 NIÑO',N'1122',0,1,1,1,6,1,1,1,13.7917)
 ,(139,N'CEBILLANA OFERTA',N'1123',0,1,1,1,1,1,1,1,5.0000)
 ,(140,N'BIKINI NATHALIE BCO AZUL NEG',N'1124',0,1,1,1,1,1,1,1,12.0000)
 ,(141,N'CALCETIN EMPERADOR ECO.',N'1125',0,1,1,1,2,1,1,1,2.5000)
 ,(142,N'CAMISETA RIGAMA T/2-6',N'1126',0,1,1,1,6,1,1,1,8.1667)
 ,(143,N'PANTALETA C/REFUERZO T/34-42',N'1127',0,1,1,1,1,1,1,1,8.1667)
 ,(144,N'SHORT DE LICRA UNI',N'1128',0,1,1,1,2,1,1,1,20.0000)
 ,(145,N'NOTAS ANTERIORES',N'102',0,1,1,1,1,1,1,1,1.0000)
 ,(146,N'FLETE',N'103',0,1,1,1,2,1,1,1,1.0000)
 ,(147,N'CALSON T/FAJA NATHALIE NAYLON',N'1129',0,1,1,1,1,1,1,1,33.0000)
 ,(148,N'GUANTE DE NIÑA',N'1130',0,1,1,1,2,1,1,1,8.2500)
 ,(149,N'PANTALETA ENCAJE LISA S/C',N'1131',0,1,1,1,2,1,1,1,18.3333)
 ,(150,N'BIKINI ENCAJE FANTASIA S/C',N'1132',0,1,1,1,2,1,1,1,18.3333)
 ,(151,N'BIKINI ENCAJE FANTASIA S/C',N'1133',0,1,1,1,1,1,1,1,18.5000)
 ,(152,N'CALCETIN CAB. LISO CAJA CON 6',N'1134',0,1,1,1,9,1,1,1,10.8333)
 ,(153,N'CALCETIN CAB. ECONOMICO',N'1135',0,1,1,1,9,1,1,1,7.0000)
 ,(154,N'CALCETA ESCOLAR MARELY 3/5 LISA',N'1136',0,1,1,1,2,1,1,1,8.1667)
 ,(155,N'CALCETA ESCOLAR MARELY 6/8 LISA',N'1137',0,1,1,1,2,1,1,1,8.8500)
 ,(156,N'CALCETA ESCOLAR MARELY 9/12 LISA',N'1138',0,1,1,1,2,1,1,1,8.8500)
 ,(157,N'CALCETA ESCOLAR MARELY 13/18 LISA',N'1139',0,1,1,1,2,1,1,1,8.8500)
 ,(158,N'CALCETA ESCOLAR MARELY 3/5 PERFORADA',N'1140',0,1,1,1,2,1,1,1,6.3333)
 ,(159,N'CALCETA ESCOLAR MARELY 6/8 PERFORADA',N'1141',0,1,1,1,2,1,1,1,7.3000)
 ,(160,N'CALCETA ESCOLAR MARELY 9/12 PERFORADA',N'1142',0,1,1,1,2,1,1,1,8.3000)
 ,(161,N'CALCETA ESCOLAR MARELY 13/18 PERFORADA',N'1143',0,1,1,1,2,1,1,1,9.1500)
 ,(162,N'TRUZA ECONOMICA BOMBAY RUSTIXAL',N'1144',0,1,1,1,1,1,1,1,6.6667)
 ,(163,N'PANTALETA LYNJE GRANDE 100 ALGODON',N'1145',0,1,1,1,1,1,1,1,6.6667)
 ,(164,N'BIKINI NATHALIE LYCRA ALGODON OFERTA',N'1146',0,1,1,1,1,1,1,1,6.6667)
 ,(165,N'BIKINI FINNESS M-233 NEG/BCO',N'1147',0,1,1,1,1,1,1,1,10.0000)
 ,(166,N'LIFTIS MAGIC BRA PARCHE',N'1148',0,1,1,1,1,1,1,1,20.0000)
 ,(167,N'TIN MAMIA 4/6',N'1149',0,1,1,1,7,1,1,1,5.5833)
 ,(168,N'TIN MAMIA 6/8',N'1150',0,1,1,1,7,1,1,1,5.5000)
 ,(169,N'TIN MAMIA 9/11 Y DAMA',N'1151',0,1,1,1,7,1,1,1,5.6667)
 ,(170,N'TIN MAMIA 10/13 Y CAB.',N'1152',0,1,1,1,7,1,1,1,6.3750)
 ,(171,N'TIN ALGODON ECONOMICO JOMER LINE',N'1153',0,1,1,1,9,1,1,1,5.6667)
 ,(172,N'PANTALETA JERSEY ECONOMICAR 34-40',N'1154',0,1,1,1,2,1,1,1,5.3333)
 ,(173,N'CAMISETA WILDBOYS NIÑO T/2-6ROMBOS',N'1155',0,1,1,1,2,1,1,1,6.5000)
 ,(174,N'CAMISETA WILDBOYS NIÑO T/8-12ROMBOS',N'1156',0,1,1,1,2,1,1,1,7.7500)
 ,(175,N'CAMISETA WILDBOYS NIÑO T/2-6INTER',N'1157',0,1,1,1,2,1,1,1,7.7500)
 ,(176,N'CAMISETA WILDBOYS NIÑA T/2-6ROMBOS',N'1158',0,1,1,1,2,1,1,1,6.9167)
 ,(177,N'CAMISETA WILDBOYS NIÑA T/8-12ROMBOS',N'1159',0,1,1,1,2,1,1,1,7.9167)
 ,(178,N'CAMISETA WILDBOYS NIÑA T/2-6INTERBCA',N'1160',0,1,1,1,2,1,1,1,7.7500)
 ,(179,N'GANCHO',N'104',0,1,1,1,2,1,1,1,1.0000)
 ,(180,N'SHORT ALGO/LICRA T/2-4',N'1161',0,1,1,1,2,1,1,1,16.5000)
 ,(181,N'SHORT ALGO/LICRA T/6-8',N'1162',0,1,1,1,2,1,1,1,26.4167)
 ,(182,N'SHORT ALG/LICRA T/8-12',N'1163',0,1,1,1,2,1,1,1,26.4167)
 ,(183,N'SHORT LICRA/ALGODON JUVENIL',N'1164',0,1,1,1,2,1,1,1,32.0000)
 ,(184,N'SHORT LICRA/ALGODON UNITALLA',N'1165',0,1,1,1,2,1,1,1,33.0000)
 ,(185,N'BRASIER S/B ECONOMICO T/T',N'1166',0,1,1,1,2,1,1,1,15.0000)
 ,(186,N'MALLA NIÑA T/XS 0-12 MESES MOPAS',N'1167',0,1,1,1,7,1,1,1,27.5000)
 ,(187,N'MALLA NIÑA T/S 1-3 MOPAS',N'1168',0,1,1,1,7,1,1,1,27.5000)
 ,(188,N'MALLA NIÑA T/M 4-6 MOPAS',N'1169',0,1,1,1,7,1,1,1,27.5000)
 ,(189,N'MALLA NIÑA T/L 7-10 MOPAS',N'1170',0,1,1,1,7,1,1,1,27.5000)
 ,(190,N'MALLA DE DAMA MSM UNITALLA',N'1171',0,1,1,1,7,1,1,1,24.0000)
 ,(191,N'MALLA NIÑA T/XL 11-14',N'1170.',0,1,1,1,7,1,1,1,27.5000)
 ,(192,N'BOXER ENCAJE UNITALLA DAMA',N'1172',0,1,1,1,2,1,1,1,16.0000)
 ,(193,N'BOXER JOSUE CABALLERO ROJO/AMARILLO',N'1173',0,1,1,1,2,1,1,1,15.5000)
 ,(194,N'PANTALETA DAMA M & G ROJA',N'1174',0,1,1,1,2,1,1,1,16.0000)
 ,(195,N'PANTALETA DAMA OROPEZA CH M G',N'1175',0,1,1,1,13,1,1,1,16.5000)
 ,(196,N'CAM ARYEHS CASACA BCA.',N'1064.',0,1,1,1,2,1,1,1,11.3333)
 ,(197,N'MALLA LIKRA DAMA ARUMI UNITALLA',N'1176',0,1,1,1,5,1,1,1,43.0000)
 ,(198,N'BOXER T/32-34-36 ILUSION OFERTA',N'1177',0,1,1,1,1,1,1,1,10.0000)
 ,(199,N'TIN DUCKLINE DEPORTIVO 3/4 109',N'1181.',0,1,1,1,9,1,1,1,11.6667)
 ,(200,N'TIN PARA NIÑO T/0-2 DUCKLINE',N'1078.02',0,1,1,1,9,1,1,1,7.1667)
 ,(201,N'TIN PARA NIÑO T/6-9 DUCKLINE',N'1078.69',0,1,1,1,9,1,1,1,7.8333)
 ,(202,N'TIN PARA NIÑO T/3-5 DUCKLINE',N'1078.35',0,1,1,1,9,1,1,1,7.5000)
 ,(203,N'TIN PARA NIÑO T/9-12 10-13 DUCKLINE',N'1078.912',0,1,1,1,9,1,1,1,8.0833)
 ,(204,N'TIN PARA NIÑA T/3-5 DUCKLINE',N'1077.35',0,1,1,1,9,1,1,1,7.5000)
 ,(205,N'TIN PARA NIÑA T/6-9 DUCKLINE',N'1077.69',0,1,1,1,9,1,1,1,7.8333)
 ,(206,N'TIN PARA NIÑA T/9-12 Y 10-13 DUCKLINE',N'1077.912',0,1,1,1,9,1,1,1,8.0833)
 ,(207,N'CAM ARYEHS BCA INFANTIL',N'1063.',0,1,1,1,2,1,1,1,8.5000)
 ,(208,N'PANTALETA ECONOMICA T/36-38-40-42 OFERTA',N'1178',0,1,1,1,1,1,1,1,6.2500)
 ,(209,N'TIN OLIMPICOS MOD 300 T/G',N'1179',0,1,1,1,14,1,1,1,9.5833)
 ,(210,N'TIN OLIMPICOS MOD 504 T/G',N'1180',0,1,1,1,14,1,1,1,9.5833)
 ,(211,N'TIN OLIMPICOS MOD HMD T/G',N'1181',0,1,1,1,14,1,1,1,9.5833)
 ,(212,N'TIN OLIMPICOS MOD DMD T/G',N'1182',0,1,1,1,14,1,1,1,9.5833)
 ,(213,N'CINTURILLA T/36-38-40 BCA. OFERTA',N'1183',0,1,1,1,1,1,1,1,7.5000)
 ,(214,N'PRENDA DE OFERTA BOT.',N'1184',0,1,1,1,1,1,1,1,10.0000)
 ,(215,N'PANTALETA DANIELA OFERTA',N'1185',0,1,1,1,1,1,1,1,9.0000)
 ,(216,N'FONDO COMPLETO ILUSION OFERTA',N'1186',0,1,1,1,1,1,1,1,50.0000)
 ,(217,N'CAMISETA WILDBOYS NIÑO T/8-12INTERBCO',N'1157.',0,1,1,1,2,1,1,1,8.5000)
 ,(218,N'CAMISETA WILDBOYS NIÑA T/8-12INTERBCA',N'1160.',0,1,1,1,2,1,1,1,9.0000)
 ,(219,N'PANTALON P/BEBE 1-2-3 ALGODON PACO',N'1187',0,1,1,1,1,1,1,1,10.5000)
 ,(220,N'CRUZADITA P/BEBE 1-2-3 ALGODON PACO',N'1188',0,1,1,1,1,1,1,1,10.5000)
 ,(221,N'MANDIL BCO. T/TAQUERO UNIT.',N'1189',0,1,1,1,1,1,1,1,32.0000)
 ,(222,N'MANDIL NIÑO-NIÑA T/KINDER',N'1190',0,1,1,1,1,1,1,1,15.0000)
 ,(223,N'TRUZA ROM NIÑO T/2-6 WILDBOYS',N'1191',0,1,1,1,16,1,1,1,5.6667)
 ,(224,N'TRUZA ROM NIÑO T/8-12WILDBOYS',N'1192',0,1,1,1,16,1,1,1,6.4167)
 ,(225,N'PANTALETA ROM T/2-6 WILDBOYS BCA',N'1193',0,1,1,1,16,1,1,1,5.1667)
 ,(226,N'PANTALETA ROM T/8-12WILDBOYS BCA',N'1194',0,1,1,1,16,1,1,1,6.0000)
 ,(227,N'BLUMER ROMBO T/2-6 NIÑA WILDBOYS BCO',N'1195',0,1,1,1,16,1,1,1,6.5000)
 ,(228,N'BLUMER ROMBO T/8-12NIÑA WILDBOYS BCO',N'1196',0,1,1,1,16,1,1,1,7.3333)
 ,(229,N'BIKER JOSH MENS LISO ALGODON',N'1197',0,1,1,1,2,1,1,1,13.2500)
 ,(230,N'BIKER JOSH T/4-6 LISO ALGODON',N'1198',0,1,1,1,2,1,1,1,9.9167)
 ,(231,N'BIKER JOSH T/8-12LISO ALGODON',N'1199',0,1,1,1,2,1,1,1,10.2500)
 ,(232,N'SHORT FLORES DARONG UNITALLA',N'1200',0,1,1,1,2,1,1,1,50.0000)
) AS Source ([IdProducto],[Descripcion],[Codigo],[Cantidad],[IdTipoProducto],[IdSubTipoProducto],[IdMarca],[IdProveedor],[IdTalla],[IdUnidad],[IdGenero],[PrecioVenta])
ON (Target.[IdProducto] = Source.[IdProducto])
WHEN MATCHED AND (
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL OR 
	NULLIF(Source.[Codigo], Target.[Codigo]) IS NOT NULL OR NULLIF(Target.[Codigo], Source.[Codigo]) IS NOT NULL OR 
	NULLIF(Source.[Cantidad], Target.[Cantidad]) IS NOT NULL OR NULLIF(Target.[Cantidad], Source.[Cantidad]) IS NOT NULL OR 
	NULLIF(Source.[IdTipoProducto], Target.[IdTipoProducto]) IS NOT NULL OR NULLIF(Target.[IdTipoProducto], Source.[IdTipoProducto]) IS NOT NULL OR 
	NULLIF(Source.[IdSubTipoProducto], Target.[IdSubTipoProducto]) IS NOT NULL OR NULLIF(Target.[IdSubTipoProducto], Source.[IdSubTipoProducto]) IS NOT NULL OR 
	NULLIF(Source.[IdMarca], Target.[IdMarca]) IS NOT NULL OR NULLIF(Target.[IdMarca], Source.[IdMarca]) IS NOT NULL OR 
	NULLIF(Source.[IdProveedor], Target.[IdProveedor]) IS NOT NULL OR NULLIF(Target.[IdProveedor], Source.[IdProveedor]) IS NOT NULL OR 
	NULLIF(Source.[IdTalla], Target.[IdTalla]) IS NOT NULL OR NULLIF(Target.[IdTalla], Source.[IdTalla]) IS NOT NULL OR 
	NULLIF(Source.[IdUnidad], Target.[IdUnidad]) IS NOT NULL OR NULLIF(Target.[IdUnidad], Source.[IdUnidad]) IS NOT NULL OR 
	NULLIF(Source.[IdGenero], Target.[IdGenero]) IS NOT NULL OR NULLIF(Target.[IdGenero], Source.[IdGenero]) IS NOT NULL OR 
	NULLIF(Source.[PrecioVenta], Target.[PrecioVenta]) IS NOT NULL OR NULLIF(Target.[PrecioVenta], Source.[PrecioVenta]) IS NOT NULL) THEN
 UPDATE SET
  [Descripcion] = Source.[Descripcion], 
  [Codigo] = Source.[Codigo], 
  [Cantidad] = Source.[Cantidad], 
  [IdTipoProducto] = Source.[IdTipoProducto], 
  [IdSubTipoProducto] = Source.[IdSubTipoProducto], 
  [IdMarca] = Source.[IdMarca], 
  [IdProveedor] = Source.[IdProveedor], 
  [IdTalla] = Source.[IdTalla], 
  [IdUnidad] = Source.[IdUnidad], 
  [IdGenero] = Source.[IdGenero], 
  [PrecioVenta] = Source.[PrecioVenta]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdProducto],[Descripcion],[Codigo],[Cantidad],[IdTipoProducto],[IdSubTipoProducto],[IdMarca],[IdProveedor],[IdTalla],[IdUnidad],[IdGenero],[PrecioVenta])
 VALUES(Source.[IdProducto],Source.[Descripcion],Source.[Codigo],Source.[Cantidad],Source.[IdTipoProducto],Source.[IdSubTipoProducto],Source.[IdMarca],Source.[IdProveedor],Source.[IdTalla],Source.[IdUnidad],Source.[IdGenero],Source.[PrecioVenta])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO




MERGE INTO [dbo].[TipoPrecio] AS Target
USING (VALUES
  (1,N'MENUDEO',1.5700,1)
 ,(2,N'MEDIO MAYOREO',1.3500,3)
 ,(3,N'MAYOREO',1.1667,9)
 ,(4,N'SUPER MAYOREO',1.1000,13)
 ,(5,N'ESPECIAL',1.0800,144)
) AS Source ([IdTipoPrecio],[Descripcion],[Multiplicador],[CantidadPiezas])
ON (Target.[IdTipoPrecio] = Source.[IdTipoPrecio])
WHEN MATCHED AND (
	NULLIF(Source.[Descripcion], Target.[Descripcion]) IS NOT NULL OR NULLIF(Target.[Descripcion], Source.[Descripcion]) IS NOT NULL OR 
	NULLIF(Source.[Multiplicador], Target.[Multiplicador]) IS NOT NULL OR NULLIF(Target.[Multiplicador], Source.[Multiplicador]) IS NOT NULL OR 
	NULLIF(Source.[CantidadPiezas], Target.[CantidadPiezas]) IS NOT NULL OR NULLIF(Target.[CantidadPiezas], Source.[CantidadPiezas]) IS NOT NULL) THEN
 UPDATE SET
  [Descripcion] = Source.[Descripcion], 
  [Multiplicador] = Source.[Multiplicador], 
  [CantidadPiezas] = Source.[CantidadPiezas]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdTipoPrecio],[Descripcion],[Multiplicador],[CantidadPiezas])
 VALUES(Source.[IdTipoPrecio],Source.[Descripcion],Source.[Multiplicador],Source.[CantidadPiezas])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO






SET IDENTITY_INSERT [dbo].[Configuracion] ON

MERGE INTO [dbo].[Configuracion] AS Target
USING (VALUES
	(1,'Test',1)
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
SET IDENTITY_INSERT [dbo].[Configuracion] OFF
GO




SET IDENTITY_INSERT [dbo].[Operador] ON

MERGE INTO [dbo].[Operador] AS Target
USING (VALUES
  (1,N'Axel',N'Murguia',N'Castañeda',N'3313325731',N'Los Angeles 283',NULL,NULL,N'321321321',N'Axel')
) AS Source ([IdOperador],[Nombre],[ApellidoPaterno],[ApellidoMaterno],[Telefono],[Direccion],[HoraInicio],[HoraFinal],[Contraseña],[Usuario])
ON (Target.[IdOperador] = Source.[IdOperador])
WHEN MATCHED AND (
	NULLIF(Source.[Nombre], Target.[Nombre]) IS NOT NULL OR NULLIF(Target.[Nombre], Source.[Nombre]) IS NOT NULL OR 
	NULLIF(Source.[ApellidoPaterno], Target.[ApellidoPaterno]) IS NOT NULL OR NULLIF(Target.[ApellidoPaterno], Source.[ApellidoPaterno]) IS NOT NULL OR 
	NULLIF(Source.[ApellidoMaterno], Target.[ApellidoMaterno]) IS NOT NULL OR NULLIF(Target.[ApellidoMaterno], Source.[ApellidoMaterno]) IS NOT NULL OR 
	NULLIF(Source.[Telefono], Target.[Telefono]) IS NOT NULL OR NULLIF(Target.[Telefono], Source.[Telefono]) IS NOT NULL OR 
	NULLIF(Source.[Direccion], Target.[Direccion]) IS NOT NULL OR NULLIF(Target.[Direccion], Source.[Direccion]) IS NOT NULL OR 
	NULLIF(Source.[HoraInicio], Target.[HoraInicio]) IS NOT NULL OR NULLIF(Target.[HoraInicio], Source.[HoraInicio]) IS NOT NULL OR 
	NULLIF(Source.[HoraFinal], Target.[HoraFinal]) IS NOT NULL OR NULLIF(Target.[HoraFinal], Source.[HoraFinal]) IS NOT NULL OR 
	NULLIF(Source.[Contraseña], Target.[Contraseña]) IS NOT NULL OR NULLIF(Target.[Contraseña], Source.[Contraseña]) IS NOT NULL OR 
	NULLIF(Source.[Usuario], Target.[Usuario]) IS NOT NULL OR NULLIF(Target.[Usuario], Source.[Usuario]) IS NOT NULL) THEN
 UPDATE SET
  [Nombre] = Source.[Nombre], 
  [ApellidoPaterno] = Source.[ApellidoPaterno], 
  [ApellidoMaterno] = Source.[ApellidoMaterno], 
  [Telefono] = Source.[Telefono], 
  [Direccion] = Source.[Direccion], 
  [HoraInicio] = Source.[HoraInicio], 
  [HoraFinal] = Source.[HoraFinal], 
  [Contraseña] = Source.[Contraseña], 
  [Usuario] = Source.[Usuario]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([IdOperador],[Nombre],[ApellidoPaterno],[ApellidoMaterno],[Telefono],[Direccion],[HoraInicio],[HoraFinal],[Contraseña],[Usuario])
 VALUES(Source.[IdOperador],Source.[Nombre],Source.[ApellidoPaterno],Source.[ApellidoMaterno],Source.[Telefono],Source.[Direccion],Source.[HoraInicio],Source.[HoraFinal],Source.[Contraseña],Source.[Usuario])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO 
SET IDENTITY_INSERT [dbo].[Operador] OFF
GO


 




