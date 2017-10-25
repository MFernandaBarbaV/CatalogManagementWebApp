-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Elimina un registro de la tabla dUserProfiles
-- =============================================
CREATE PROCEDURE [dbo].[spdUserProfiles_Delete]
(
	@UserID int
)
AS
BEGIN
	SET NOCOUNT ON
	declare @isReadOnly bit
	set @isReadOnly = (Select [isReadOnly] from mUsers where UserID=@UserID)
	
	if @isReadOnly is null
	begin
		set @isReadOnly=0
	end
	
	if @isReadOnly = 1
	begin
		raiserror('000031',15,1)
	end
	else
	begin
		DELETE FROM [dUserProfiles]
		WHERE [UserID] = @UserID 
	end
END