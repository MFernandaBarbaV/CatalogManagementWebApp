CREATE PROCEDURE [dbo].[InsertarImagen]

AS
	

	update  dbo.Informacion 
	set LogoTicket = ( (SELECT * FROM OPENROWSET(BULK N'C:\Users\ferna\OneDrive\Documentos\Boneta web\logos\logo para ticket.jpg', SINGLE_BLOB) as T1))

	where Id = 1
RETURN 0
