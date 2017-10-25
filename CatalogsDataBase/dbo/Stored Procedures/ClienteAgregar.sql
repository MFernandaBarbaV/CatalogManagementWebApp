-- =============================================
-- EXEC [dbo].[ClienteAgregar] 'María Fernanda', 'Barba', 'Velázquez', 'ma.fer.bv23@gmail.com', 'BAVF901023SI3', 'Tierra del fuego', '2703', '8', 'Providencia', '44630', 'Guadalajara', 'Jalisco', '(33)13288968'
-- =============================================
CREATE PROCEDURE [dbo].[ClienteAgregar]
	-- Add the parameters for the stored procedure here
	@NombreCliente nvarchar(100), 
          @ApellidoPaternoCliente nvarchar(100), 
          @ApellidoMaternoCliente nvarchar(100), 
          @Email nvarchar(100), 
          @RFC nvarchar(100), 
          @CalleDomicilioFiscal nvarchar(100), 
          @NumeroInteriorDomicilioFiscal nvarchar(100), 
          @NumeroExteriorDomicilioFiscal nvarchar(100), 
          @ColoniaDomicilioFiscal nvarchar(100), 
          @CodigoPostalDomicilioFiscal nvarchar(100), 
          @CiudadDomicilioFiscal nvarchar(100), 
          @EstadoDomicilioFiscal nvarchar(100), 
          @Telefono nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Clientes]
           ([NombreCliente]
           ,[ApellidoPaternoCliente]
           ,[ApellidoMaternoCliente]         
           ,[Email]
           ,[RFC]
           ,[CalleDomicilioFiscal]
           ,[NumeroInteriorDomicilioFiscal]
           ,[NumeroExteriorDomicilioFiscal]
           ,[ColoniaDomicilioFiscal]
           ,[CodigoPostalDomicilioFiscal]
           ,[CiudadDomicilioFiscal]
           ,[EstadoDomicilioFiscal]
           ,[Telefono])
     VALUES
           (@NombreCliente, 
          @ApellidoPaternoCliente, 
          @ApellidoMaternoCliente, 
       
          @Email, 
          @RFC, 
          @CalleDomicilioFiscal, 
          @NumeroInteriorDomicilioFiscal, 
          @NumeroExteriorDomicilioFiscal, 
          @ColoniaDomicilioFiscal, 
          @CodigoPostalDomicilioFiscal, 
          @CiudadDomicilioFiscal, 
          @EstadoDomicilioFiscal, 
          @Telefono )

		  select cast(SCOPE_IDENTITY() as int) as IdCliente
END


