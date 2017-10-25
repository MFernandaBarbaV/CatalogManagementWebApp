-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Insert un registro en la tabla mUsers.
-- =============================================
CREATE PROCEDURE [dbo].[spmUser_Insert]
(
	@UserID int = NULL OUTPUT,
	@Name varchar(25),
	@LastName varchar(50),
	@Surname varchar(50) = NULL,
	@SexID int = NULL,
	@Address varchar(100) = NULL,
	@ZipCode int = NULL,
	@Email varchar(120) = NULL,
	@Organization varchar(50) = NULL,
	@Position varchar(50) = NULL,
	@ShortName varchar(15) = NULL,
	@Login varchar(50),
	@Password varchar(50),
	@Status int = null
)
AS
BEGIN

	SET NOCOUNT OFF
	--Valida que el nombre del usuario no este vacio o nulo
	if @Name = '' or @Name is null
	begin
		raiserror('000024',15,1)
		return
	end
	--Valida que el login del usuario no este vacio o nulo
	if @Login = '' or @Login is null
	begin
		raiserror('000023',15,1)
		return
	end

	--valida que el password no este vacio o nulo
	if @Password = '' or @Password is null
	begin
		raiserror('000026',15,1)
		return
	end
	--valida que no se repita el email del usuario
	If exists(select * from mUsers where [Email]=@Email)
	begin
		raiserror('000021',15,1)
		return
	end
	--valida que no se repita el login del usuario
	if exists(select * from mUsers where [Login]=@Login)
	begin
		raiserror('000022',15,1)
		return
	end
	--valida que sea un sexo valido 1=Hombre 2=Mujer
	if not(@SexID>0 and @SexID<3)
	begin
		raiserror('000027',15,1)
		return
	end

	INSERT
	INTO [mUsers]
	(
		[Name],
		[LastName],
		[Surname],
		[Sex],
		[Address],
		[ZipCode],
		[Email],
		[Organization],
		[Position],
		[ShortName],
		[Login],
		[Password],
		[StatusID],
		[CreateDate],
		[IsReadOnly],
		[IsFirstSession],
		[IsActiveSession]
	)
	VALUES
	(
		@Name,
		@LastName,
		@Surname,
		@SexID,
		@Address,
		@ZipCode,
		@Email,
		@Organization,
		@Position,
		@ShortName,
		@Login,
		@Password,
		@Status,
		GETDATE(),
		0,
		1,
		0
	)
	
	set @UserID =SCOPE_IDENTITY()
	
END