-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Elimina un registro de la tabla mProfiles donde el identificador primario coincida con el parámetro @ProfileID.
-- =============================================
CREATE PROCEDURE [dbo].[spmProfiles_Delete]
(
	@ProfileID int
)
AS
BEGIN

	SET NOCOUNT Off;

	DECLARE @IsReadOnly bit
	declare @IdStatusDelete int

	set @IdStatusDelete = NULL 
	SET @IsReadOnly = (SELECT IsReadOnly FROM mProfiles WHERE 
					([ProfileID] = @ProfileID))
	IF (@IsReadOnly is null)
	BEGIN
		SET @IsReadOnly = 0
	END
	
	if exists(select * from mProfiles
		inner join dUserProfiles
		on mProfiles.ProfileID=dUserProfiles.ProfileID
		where mProfiles.ProfileID=@ProfileID)
	begin
		raiserror('000061', 16, 1)
		return
	end

	select @IdStatusDelete = StatusID from mStatus where Name = 'Deleted'

	if @IdStatusDelete IS NULL
	begin
		raiserror('000052', 16, 1)
		return
	end
	
	IF (@IsReadOnly = 0)
	BEGIN
		UPDATE mProfiles
		SET StatusID = @IdStatusDelete
		WHERE ProfileID = @ProfileID
		
		declare @next int
		set @next=(select ISNULL(MAX(ProfileID), 0) from mProfiles)
		DBCC CHECKIDENT('mProfiles', RESEED, @next)
	END
	ELSE
	BEGIN
		RAISERROR('000003',18,1)
	END	
END