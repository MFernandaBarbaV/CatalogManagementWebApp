CREATE PROCEDURE [dbo].[MoverExistenciaAlmacen]
	@IdAlmacenOrigen smallint, @IdAlmacenDestino smallint, @IdProducto int, @Cantidad int
AS
	
	IF NOT EXISTS (SELECT * FROM ExistenciaPorAlmacen WHERE IdAlmacen = @IdAlmacenDestino AND IdProducto = @IdProducto)
	BEGIN
		INSERT INTO ExistenciaPorAlmacen (IdAlmacen, IdProducto, Existencia) VALUES (@IdAlmacenDestino, @IdProducto, 0)
	END

	 if @IdAlmacenOrigen > 0
	 BEGIN

	 IF (SELECT Existencia FROM ExistenciaPorAlmacen  WHERE IdAlmacen = @IdAlmacenOrigen AND IdProducto = @IdProducto) < @Cantidad
	 BEGIN
		raiserror('No hay suficientes productos para mover.',13,0)
		RETURN
	 END

		 UPDATE ExistenciaPorAlmacen
		 set Existencia = Existencia - @Cantidad
		 WHERE IdAlmacen = @IdAlmacenOrigen AND IdProducto = @IdProducto		 

	 END

	  UPDATE ExistenciaPorAlmacen
		set Existencia = Existencia + @Cantidad
		WHERE IdAlmacen = @IdAlmacenDestino AND IdProducto = @IdProducto

	SELECT @Cantidad


RETURN 0
