-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona un registro de la tabla mUsers donde el identificador primario coincida con el parámetro @UserID.
-- =============================================
CREATE PROCEDURE [dbo].[spmUser_GetByID]
(
	@UserID int
)
AS
BEGIN

	declare @IdStatusDelete int
	select @IdStatusDelete = StatusID from mStatus where Name = 'Deleted'

	SELECT U.UserID, U.Name, U.LastName, U.Surname, U.Address, U.ZipCode, U.Email, 
			U.Organization, U.Position, U.ShortName, U.Login, U.Password, U.StatusID, 
            U.CreateDate, U.Sex, U.IsReadOnly, U.IsFirstSession, U.IsActiveSession, 
            mStatus.Name AS StatusName, mStatus.Type AS StatusType,1 as WithProfiles
	FROM         mUsers AS U 
	INNER JOIN mStatus 
	ON U.StatusID = mStatus.StatusID
	WHERE (U.[UserID] = @UserID)
	AND U.StatusID <> @IdStatusDelete
END