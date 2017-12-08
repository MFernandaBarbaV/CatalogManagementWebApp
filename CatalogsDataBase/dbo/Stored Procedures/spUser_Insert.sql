
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
	
	--valida que no se repita el login del usuario
	if exists(select * from Users where [Login]=@Login)
	begin
		raiserror('Ya existe un usuario con el mismo Login',15,1)
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