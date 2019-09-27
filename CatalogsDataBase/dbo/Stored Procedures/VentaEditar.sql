CREATE PROCEDURE [dbo].[VentaEditar]
@IdCliente int, @IdVendedor int,
	@Descuento money = 0, 
	@EsFactura bit = 0, 
	@Total money, 
	@GuardadoTemporal bit = 0,
	@Fecha datetime = null, 
	@Pagado money, 
	@PagoParcial bit = 0,
	@IVA money = null, @Subtotal money
	,@IdVenta int output
AS
	

	UPDATE [dbo].[Venta]
	SET  IdCliente = @IdCliente, IdOperador = @IdVendedor,
	
	[Descuento] = @Descuento
      ,[EsFactura] = @EsFactura
      ,[Total] = @Total
      ,[Pagado] = @Pagado
      ,[GuardadoTemporal] = @GuardadoTemporal
      ,[FechaModificacion] = getdate()
      ,[PagoParcial] = @PagoParcial
	  ,[IVA] = @IVA
	  ,[Subtotal] = @Subtotal
	WHERE IdVenta = @IdVenta

	IF ( @Pagado > 0 or @GuardadoTemporal = 0 ) AND (SELECT Folio FROM dbo.Venta WHERE IdVenta = @IdVenta) IS NULL
	BEGIN
		
		DECLARE @Folio int
		  
		SELECT TOP(1) @Folio = ( Folio + 1) FROM [dbo].[Venta]  ORDER BY Folio DESC

		if(@Folio is null)
			SET  @Folio = 1
		
		UPDATE Venta
		  SET Folio = @Folio, Serie =  (SELECT TOP(1) Serie FROM SerieFolio WHERE Activo = 1), GuardadoTemporal = 0
		  WHERE IdVenta = @IdVenta

		Set @IdVenta = @Folio
	END
	

RETURN 0
