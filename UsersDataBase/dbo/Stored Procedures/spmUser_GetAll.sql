-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona todos los registros de la tabla mUsers.
-- =============================================
CREATE PROCEDURE [dbo].[spmUser_GetAll]
AS
BEGIN

	declare @IdStatusDelete int
	select @IdStatusDelete = StatusID from mStatus where Name = 'Deleted'

	Select U.UserID, U.Name, U.LastName, U.Surname, U.Address, U.ZipCode, U.Email, 
			U.Organization, U.Position, U.ShortName, U.Login, U.Password, U.StatusID, 
            U.CreateDate, U.Sex, U.IsReadOnly, U.IsFirstSession, U.IsActiveSession, 
            mStatus.Name AS StatusName, mStatus.Type AS StatusType
	FROM         mUsers AS U 	
	INNER JOIN mStatus 
	ON U.StatusID = mStatus.StatusID
	WHERE U.StatusID <> @IdStatusDelete
	order by u.UserID
END