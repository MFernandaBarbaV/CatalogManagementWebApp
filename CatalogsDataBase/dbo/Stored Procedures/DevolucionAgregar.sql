CREATE PROCEDURE [dbo].[DevolucionAgregar]
	@IdOperador int ,
	@IdVenta int
AS
BEGIN
	
	if not exists (select * from dbo.Venta where IdVenta = @IdVenta)
	BEGIN
	raiserror('Ocurrió un error al realizar la devolución, no se encontró el id de venta.',16,1)

	END
	ELSE 
	if exists (select * from dbo.Venta where IdVenta = @IdVenta AND IdEstatus = 2)
	BEGIN
	raiserror('Ocurrió un error al realizar la devolución, la venta seleccionada fue cancelada anteriormente.',16,1)

	END

	declare @Folio int
	set @Folio =isnull( (SELECT TOP(1) FolioDevolucion + 1 FROM DBO.Devolucion ORDER BY FolioDevolucion DESC),1)



	INSERT INTO [dbo].[Devolucion]
           ([FechaDevolucion]
           ,[FolioDevolucion]
           ,[IdOperador]
           ,[IdVenta]
           ,[ImporteDevolucion])
     VALUES
           (getdate()
           ,@Folio
           ,@IdOperador
           ,@IdVenta
           ,0)

		   select IdDevolucion from dbo.Devolucion where FolioDevolucion = @Folio
		  --  select cast(SCOPE_IDENTITY() as int) as IdDevolucion


END
