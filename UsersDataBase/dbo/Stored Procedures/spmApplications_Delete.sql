-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Elimina un registro de la tabla mApplications donde el identificador primario coindida con el parámetro @ApplicationID.
-- =============================================
CREATE PROCEDURE [dbo].[spmApplications_Delete]
(
	@ApplicationID int
)
AS
BEGIN
	set nocount off;
	DECLARE @IsReadOnly bit
	SET @IsReadOnly = (SELECT IsReadOnly FROM mApplications WHERE 
					([ApplicationID] = @ApplicationID))
	IF (@IsReadOnly is null)
	BEGIN
		SET @IsReadOnly = 0
	END
	
	if exists(select * from mAccessLog
			where ApplicationID=@ApplicationID)
	begin
		raiserror('000053', 16, 1)
		return
	end
	
	if exists(select * from dUserProfiles up
			inner join mProfiles p on up.ProfileID=p.ProfileID
			where p.ApplicationID=@ApplicationID)
	begin
		raiserror('000054', 16, 1)
		return
	end
	
	IF (@IsReadOnly = 0)
	BEGIN
		Delete from mApplications
		where [ApplicationID]=@ApplicationID
		
		declare @next int
		set @next=(select ISNULL(MAX(ApplicationID), 0) from mApplications)
		DBCC CHECKIDENT('mApplications', RESEED, @next)
    
	END
	ELSE
	BEGIN
		RAISERROR('000003',18,1)
		return
	END
		
END