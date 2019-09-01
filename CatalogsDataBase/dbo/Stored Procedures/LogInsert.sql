CREATE PROCEDURE [dbo].[LogInsert]
	@IdOperacion int,
	@IdObject int,
	@IdUsuario int
AS
	INSERT INTO [dbo].[Log]
           ([IdOperacion]
           ,[IdUsuario]
           ,[IdObject]
           ,[Fecha])
     VALUES
           (@IdOperacion
           ,@IdUsuario
           ,@IdObject
           ,GETDATE())
RETURN 0
