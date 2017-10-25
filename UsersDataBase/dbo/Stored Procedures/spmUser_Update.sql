-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Actualiza un registro de la tabla mUsers donde el identificador primario coincida con el parámetro @UserID.
-- =============================================
CREATE PROCEDURE [dbo].[spmUser_Update]
(
	@UserID int,
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
	@Status int = NULL
)
AS
BEGIN
	
	SET NOCOUNT OFF
	declare @IsReadOnly bit
	declare @IsActive bit
	
	select @IsReadOnly=[IsReadOnly]
		from mUsers where [UserID]=@UserID
		
	if @IsReadOnly = 1
	begin
		raiserror('000038',16,1)
		return
	end
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
	--Valida que el email del usuario no este vacio o nulo
	if @Email = '' or @Email is null
	begin
		raiserror('000025',15,1)
		return
	end
	--valida que el password no este vacio o nulo
	if @Password = '' or @Password is null
	begin
		raiserror('000026',15,1)
		return
	end
	--valida que no se repita el email del usuario
	If exists(select * from mUsers where [Email]=@Email and UserID<>@UserID)
	begin
		raiserror('000021',15,1)
		return
	end
	--valida que no se repita el login del usuario
	if exists(select * from mUsers where [Login]=@Login and UserID<>@UserID)
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
    
	UPDATE [mUsers]
	SET
		[Name] = @Name,
		[LastName] = @LastName,
		[Surname] = @Surname,
		[Sex] = @SexID,
		[Address] = @Address,
		[ZipCode] = @ZipCode,
		[Email] = @Email,
		[Organization] = @Organization,
		[Position] = @Position,
		[ShortName] = @ShortName,
		[Login] = @Login,
		[Password] = @Password,
		[StatusID] = @Status
	WHERE
		[UserID] = @UserID
		
	IF( @@ROWCOUNT = 0)
	BEGIN
	  SELECT 0 as Success
	END
	ELSE
	BEGIN
	  SELECT 1 as Success
	END		

END