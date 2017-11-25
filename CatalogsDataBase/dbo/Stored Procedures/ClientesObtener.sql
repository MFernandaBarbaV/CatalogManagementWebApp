-- =============================================
-- EXEC [dbo].[ClientesObtener]
-- =============================================
CREATE PROCEDURE [dbo].[ClientesObtener]
	-- Add the parameters for the stored procedure here
	@IdCliente int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1000 [IdCliente]
      ,[NombreCliente]
      ,[Email]
      ,[RFC]
      ,[CalleDomicilioFiscal]
      ,[NumeroInteriorDomicilioFiscal]
      ,[NumeroExteriorDomicilioFiscal]
      ,[ColoniaDomicilioFiscal]
      ,[CodigoPostalDomicilioFiscal]
      ,[CiudadDomicilioFiscal]
      ,[EstadoDomicilioFiscal]
      ,[Telefono]
  FROM [dbo].[Clientes]
  WHERE [IdCliente] = @IdCliente or @IdCliente = 0
END


