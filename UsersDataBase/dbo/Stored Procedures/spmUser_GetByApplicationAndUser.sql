-- =============================================
-- Author:		Esteban Cruz
-- Create date: 2011/11/09
-- Description:	Selecciona todos los registro de la tabla mUsers donde el identificador primario este relacionado con otro de la tabla dUserProfile
--		y la columna ProfileID este relacionado con un registro de la tabla mProfile y la columna ApplicationID coincida con el parámetro @ApplicationId.
-- =============================================
CREATE PROCEDURE [dbo].[spmUser_GetByApplicationAndUser] 
	@ApplicationID int ,
	@UserID int
	
AS
BEGIN
	SET NOCOUNT ON;
		SELECT usr.UserID, usr.Name, usr.LastName, usr.Surname, usr.Address, usr.ZipCode, usr.Email, 
				usr.Organization, usr.Position, usr.ShortName, usr.Login, usr.Password, usr.Sex, 
				usr.StatusID, usr.CreateDate, usr.IsReadOnly, usr.IsFirstSession, usr.IsActiveSession, 
				st.Name AS StatusName, st.Type AS StatusType
		FROM dUserProfiles AS up 
		INNER JOIN mUsers AS usr 
		ON up.UserID = usr.UserID 
		INNER JOIN mStatus AS st 
		ON usr.StatusID = st.StatusID 
		INNER JOIN mProfiles AS p 
		ON up.ProfileID = p.ProfileID
		WHERE(p.ApplicationID = @ApplicationID AND usr.UserID = @UserID)
END