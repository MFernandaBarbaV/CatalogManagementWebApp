-- =============================================
-- [dbo].[VentaAgregar] 1, 2, 0, 0, 100, 0
-- =============================================
CREATE PROCEDURE [dbo].[VentaAgregar] 
	@IdCliente int = 1, @IdOperador int, @Descuento money = 0, @EsFactura bit = 0, @Total money, @GuardadoTemporal bit = 0
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
           ,[GuardadoTemporal])
     VALUES
           (@IdCliente
           ,@IdOperador
           ,getdate()
           ,@Descuento
           ,@EsFactura
           ,@Total
           ,@GuardadoTemporal)

	SELECT @IdVenta = cast(SCOPE_IDENTITY() as int)
	Select @IdVenta

END
