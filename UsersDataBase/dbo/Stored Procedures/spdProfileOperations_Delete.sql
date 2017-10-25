-- =============================================
-- Author:		Esteban Cruz
-- Create date: 2011/11/08
-- Description:	Elimina de la base de datos la configuración de asiganción de operaciones a un perfil especifico.
-- =============================================
CREATE PROCEDURE [dbo].[spdProfileOperations_Delete]
(
	@ProfileID int
)
AS
BEGIN
	set nocount off
	declare @isReadOnly bit
	
	select @isReadOnly = ISNULL(isReadOnly, 0)
	from mProfiles 
	where ProfileID=@ProfileID
	
	if(@isReadOnly=1)
	begin
		raiserror('000045', 16, 1)
		return
	end
	
	DELETE FROM [dProfileOperations] 
	WHERE [ProfileID] = @ProfileID
END