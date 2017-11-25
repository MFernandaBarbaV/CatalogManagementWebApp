
CREATE PROCEDURE [dbo].[spUser_Delete]
(
	@UserID int
)
AS
BEGIN 
	set nocount off;
	declare @IsReadOnly bit
	declare @IsActive bit
	declare @IdStatusDelete int
	
	set @IdStatusDelete = NULL

	select @IsActive=[IsActiveSession], @IsReadOnly=[IsReadOnly]
		from Users where [UserID]=@UserID
		
	if @IsReadOnly = 1
	begin
		raiserror('000036',16,1)
		return
	end
	
	if @IsActive = 1
	begin
		raiserror('000035',16,1)
		return
	end
	
	if exists(select * from Log where UserID=@UserID)
	begin
		raiserror('000051', 16, 1)
		return
	end

	
	
	select @IdStatusDelete = StatusID from Status where Name = 'Deleted'

	if @IdStatusDelete IS NULL
	begin
		raiserror('000052', 16, 1)
		return
	end

	UPDATE Users
	SET StatusID = @IdStatusDelete
	Where [UserID] = @UserID and 
		  [IsActiveSession] = 0 and 
		  [IsReadOnly] = 0
	
	IF( @@ROWCOUNT = 0)
	BEGIN
	  SELECT 0 as Success
	END
	ELSE
	BEGIN
	  SELECT 1 as Success
	END

END