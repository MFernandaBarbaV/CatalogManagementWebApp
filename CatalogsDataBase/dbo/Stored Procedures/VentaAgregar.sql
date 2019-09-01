
CREATE PROCEDURE [dbo].[VentaAgregar] 
	@IdCliente int = 1, @IdOperador int, @Descuento money = 0, @EsFactura bit = 0, @Total money, @GuardadoTemporal bit = 0,
	@Fecha datetime = null,  @Pagado money, @PagoParcial bit = 0, @IVA money = NULL, @Subtotal money, @PC nvarchar(50), @IdUsuario int
	,@IdAlmacen smallint
	,@IdVenta int output
AS
BEGIN
	
	INSERT INTO [dbo].[Venta]
			([IdCliente]
           ,[IdOperador]
           ,[FechaVenta]
           ,[Descuento]
           ,[EsFactura]
           ,[Total]
           ,[Pagado]
           ,[GuardadoTemporal]
           ,[FechaModificacion] 
		   ,[PagoParcial]
		   ,[IVA]
		   ,[Subtotal], [PC], [IdUsuario],[IdAlmacen])
     VALUES
           (@IdCliente
           ,@IdOperador
           ,isnull(@Fecha, getdate())
           ,@Descuento
           ,@EsFactura
           ,@Total
		   ,@Pagado
           ,@GuardadoTemporal
		   ,getdate()
		   ,@PagoParcial
		   ,@IVA
		   ,@Subtotal, @PC, @IdUsuario ,@IdAlmacen )

	Declare @Id int set @Id = cast(SCOPE_IDENTITY() as int)

	if @IdCliente != 1 
	begin
			
			EXEC ClienteCalcularAdeudo @IdCliente
	end


	--asignar folio
	IF @GuardadoTemporal = 0 or @Pagado > 0
	BEGIN
		
		DECLARE @Folio int
		  
		  SELECT TOP(1) @Folio = ( Folio + 1) FROM [dbo].[Venta] WHERE SERIE = (SELECT TOP(1) SERIE FROM SerieFolio WHERE Activo = 1)  ORDER BY Folio DESC

		  if(@Folio IS null OR @Folio = 0)
		set  @Folio = 1
		
		UPDATE Venta
		  SET Folio = @Folio, Serie =  (SELECT TOP(1) Serie FROM SerieFolio WHERE Activo = 1)
		  WHERE IdVenta = @Id

		  Set @IdVenta = @Folio

	END
	ELSE
		SET @IdVenta = NULL
	
	Select @Id

END
