-- =============================================
-- EXEC [dbo].[CompraAgregar] 1, 1, '10-11-2017', 110.10
-- =============================================
CREATE PROCEDURE [dbo].[CompraAgregar]
	@IdProveedor int, @IdOperador int, @FechaCompra datetime2, @Total money,  @IdCompra int output
AS
BEGIN
	INSERT INTO [dbo].[Compra]
           ([IdProveedor]
           ,[IdOperador]
           ,[FechaCompra]
           ,[Total])
     VALUES
           (@IdProveedor
           ,@IdOperador
           ,@FechaCompra
           ,@Total)

   SELECT @IdCompra = cast(SCOPE_IDENTITY() as int)
   SELECT @IdCompra
END
