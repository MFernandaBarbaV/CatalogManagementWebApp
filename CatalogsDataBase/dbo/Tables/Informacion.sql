CREATE TABLE [dbo].[Informacion]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [LogoTicket] VARBINARY(MAX) NULL, 
	  [AnchoMaxLogo] SMALLINT NOT NULL DEFAULT 250,
    [LeyendaSuperiorTicket] NVARCHAR(550) NULL, 
    [LeyendaInferiorTicket] NVARCHAR(550) NULL, 
    [TamañoFuenteLeyenda] TINYINT NOT NULL DEFAULT 11, 
    [TamañoFuenteTicket] TINYINT NOT NULL DEFAULT 10, 
    [TamañoFuenteEncabezados] TINYINT NOT NULL DEFAULT 8, 
    [TamañoFuenteTotales] TINYINT NOT NULL DEFAULT 10, 
    [AnchoTicket] SMALLINT NOT NULL DEFAULT 314, 
  
  
)
