
CREATE PROCEDURE [dbo].[spUser_Insert]
(
	@UserID int = NULL OUTPUT,
	@Name varchar(25),
	@LastName varchar(50),
	@Surname varchar(50) = NULL,

	@Address varchar(100) = NULL,
	@ZipCode int = NULL,
	@Email varchar(120) = NULL,
	
	@Position varchar(50) = NULL,
	@ShortName varchar(15) = NULL,
	@Login varchar(50),
	@Password varchar(300),
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
	
	--valida que no se repita el login del usuario
	if exists(select * from Users where [Login]=@Login)
	begin
		raiserror('000022',15,1)
		return
	end
	

	INSERT
	INTO [Users]
	(
		[Name],
		[LastName],
		[Surname],
	
		[Address],
		[ZipCode],
		[Email],
	
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
		
		@Address,
		@ZipCode,
		@Email,
		
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