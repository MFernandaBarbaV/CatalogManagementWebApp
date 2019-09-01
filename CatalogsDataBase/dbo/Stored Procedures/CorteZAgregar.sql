CREATE PROCEDURE [dbo].[CorteZAgregar]
	@IdUsuario int, @IdVentaInicio int, @IdVentaFin int
AS

DECLARE @MONTO money
set @MONTO = (SELECT SUM(Pagado) 
			  FROM[dbo].[Venta]
			  where IdVenta between @IdVentaInicio and @IdVentaFin)

	INSERT INTO [dbo].[CorteZ]
           ([IdUsuario]
           ,[Fecha]
           ,[IdVentaInicio]
           ,[IdVentaFin]
           ,[MontoVenta])
     VALUES
           (@IdUsuario
           ,getdate()
           ,@IdVentaInicio
           ,@IdVentaFin
           ,@MONTO)

RETURN 0
