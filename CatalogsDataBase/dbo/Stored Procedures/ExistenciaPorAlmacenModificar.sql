CREATE PROCEDURE [dbo].[ExistenciaPorAlmacenModificar]
	@IdProducto int, @CantidadASumar int, @EsSalida bit = 1, @IdAlmacen int, @ConteoInventarioFisico bit = 0
AS

if not exists (select * from ExistenciaPorAlmacen where  IdAlmacen = @IdAlmacen AND IdProducto = @IdProducto)
	BEGIN
		insert into ExistenciaPorAlmacen (IdAlmacen, IdProducto, Existencia) values (@IdAlmacen, @IdProducto,0)
	END

	if @EsSalida = 1
	BEGIN
		--UPDATE [dbo].[Producto]
		--SET Cantidad = Cantidad - @CantidadASumar
		--where IdProducto = @IdProducto

		UPDATE ExistenciaPorAlmacen
		set Existencia = Existencia - @CantidadASumar
		WHERE IdAlmacen = @IdAlmacen AND IdProducto = @IdProducto
			   		 
	END
	ELSE --compra
	BEGIN
		--UPDATE [dbo].[Producto]
		--SET Cantidad = Cantidad + @CantidadASumar
		--where IdProducto = @IdProducto
		
		UPDATE ExistenciaPorAlmacen
		set Existencia = Existencia + @CantidadASumar
		WHERE IdAlmacen = @IdAlmacen AND IdProducto = @IdProducto
	END

	if @ConteoInventarioFisico = 1
	begin
		UPDATE ExistenciaPorAlmacen
		set Existencia =  @CantidadASumar
		WHERE IdAlmacen = @IdAlmacen AND IdProducto = @IdProducto
	end

	update Producto
	set Cantidad = (  select sum(existencia) from ExistenciaPorAlmacen where IdProducto = @IdProducto group by idproducto)
	where IdProducto = @IdProducto

RETURN 0
