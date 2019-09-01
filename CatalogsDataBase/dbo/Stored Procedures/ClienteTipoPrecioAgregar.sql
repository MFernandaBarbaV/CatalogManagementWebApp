CREATE PROCEDURE [dbo].[ClienteTipoPrecioAgregar]
	@IdCliente int,
	@IdTipoPrecio smallint,
	@SeUsa bit
AS
	IF @SeUsa = 1 and not exists (select * from ClienteTipoPrecio where IdCliente = @IdCliente and IdTipoPrecio = @IdTipoPrecio)
		INSERT INTO [dbo].[ClienteTipoPrecio]
			   ([IdCliente]
			   ,[IdTipoPrecio])
		 VALUES
			   (@IdCliente
			   ,@IdTipoPrecio)
	
	ELSE IF @SeUsa = 0
		DELETE FROM [dbo].[ClienteTipoPrecio]
		WHERE IdCliente = @IdCliente AND IdTipoPrecio = @IdTipoPrecio


RETURN 0
