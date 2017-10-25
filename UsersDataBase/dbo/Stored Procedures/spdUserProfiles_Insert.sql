-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Inserta un registro en la tabla spdUserProfiles
-- =============================================
CREATE PROCEDURE [dbo].[spdUserProfiles_Insert]
(
	@UserID int,
	@ProfileID int,
	@AccessTemplateID int
)
AS
BEGIN
	if not exists(select * from mUsers where UserID=@UserID)
	begin
		raiserror('000010',15,1)
	end
	
	if not exists(select * from mProfiles where ProfileID=@ProfileID)
	begin
		raiserror('000030',15,1)
	end
	
	if not exists(select * from mAccessTemplates where AccessTemplateID=@AccessTemplateID)
	begin
		raiserror('000016',15,1)
	end
	
	Insert dUserProfiles values(@UserID, @ProfileID, @AccessTemplateID)
	
	IF( @@ROWCOUNT = 0)
	BEGIN
	  SELECT 0 as Success
	END
	ELSE
	BEGIN
	  SELECT 1 as Success
	END		
	
END