-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Elimina un registro de la tabla mAccessTemplates
-- =============================================
CREATE PROCEDURE [dbo].[spmAccessTemplates_Delete]
(
	@AccessTemplateID int
)
AS
BEGIN
	set nocount off;
	DECLARE @IsReadOnly bit
	SET @IsReadOnly = (SELECT IsReadOnly 
						FROM mAccessTemplates 
						WHERE AccessTemplateID = @AccessTemplateID
						)
	IF (@IsReadOnly is null)
	BEGIN
		SET @IsReadOnly = 0
	END
	
	if(@IsReadOnly=1)
	begin
		raiserror('000048', 16, 1)
		return
	end
	
	IF NOT @AccessTemplateID IN (Select distinct up.AccessTemplateID 
								 from dUserProfiles up
								 inner join mUsers u 
								 on u.UserID = up.UserID
								 )
	BEGIN
		DELETE FROM [mAccessTemplates]
		WHERE
			[AccessTemplateID] = @AccessTemplateID
			
		IF( @@ROWCOUNT = 0)
		BEGIN
		  SELECT 0 as Success
		END
		ELSE
		BEGIN
		  SELECT 1 as Success
		END
	END
	ELSE
	BEGIN
		RAISERROR ('000050', 18, 1)
		return
	END
END