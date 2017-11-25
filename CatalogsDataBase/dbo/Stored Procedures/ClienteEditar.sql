-- =============================================
-- EXEC [dbo].[ClienteEditar] 'María Fernanda', 'Barba', 'Velázquez', 'ma.fer.bv23@gmail.com', 'BAVF901023SI3', 'Tierra del fuego', '2703', '8', 'Providencia', '44630', 'Guadalajara', 'Jalisco', '(33)13288968'
-- =============================================
CREATE PROCEDURE [dbo].[ClienteEditar]
	-- Add the parameters for the stored procedure here
	@NombreCliente nvarchar(300), 
          @Email nvarchar(100), 
          @RFC nvarchar(100), 
          @CalleDomicilioFiscal nvarchar(100), 
          @NumeroInteriorDomicilioFiscal nvarchar(100), 
          @NumeroExteriorDomicilioFiscal nvarchar(100), 
          @ColoniaDomicilioFiscal nvarchar(100), 
          @CodigoPostalDomicilioFiscal nvarchar(100), 
          @CiudadDomicilioFiscal nvarchar(100), 
          @EstadoDomicilioFiscal nvarchar(100), 
          @Telefono nvarchar(100),
		  @IdCliente int
AS
BEGIN

	SET NOCOUNT ON;

	
	UPDATE [dbo].[Clientes]
	SET NombreCliente = @NombreCliente,
		Email = @Email,
		RFC = @RFC,
		CalleDomicilioFiscal = @CalleDomicilioFiscal,
		NumeroInteriorDomicilioFiscal = @NumeroInteriorDomicilioFiscal,
		NumeroExteriorDomicilioFiscal = @NumeroExteriorDomicilioFiscal,
		ColoniaDomicilioFiscal = @ColoniaDomicilioFiscal,
		CodigoPostalDomicilioFiscal = @CodigoPostalDomicilioFiscal,
		CiudadDomicilioFiscal = @CiudadDomicilioFiscal,
		EstadoDomicilioFiscal = @EstadoDomicilioFiscal,
		Telefono = @Telefono
	WHERE IdCliente = @IdCliente 


END