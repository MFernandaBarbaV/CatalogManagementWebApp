-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona de la tabla mProfiles los registros donde la columan Name coincida con el parámetro @ProfileName y 
--		la columna ApplicationID coincida con el parámetro @ApplicationID.
-- =============================================
CREATE PROCEDURE [dbo].[spmProfiles_GetByNameAndApplicationID]
(
	@ProfileName varchar(50),
	@ApplicationID int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT top 1 P.ProfileID, P.Name, P.IsReadOnly, P.ApplicationID, 
				A.Name AS AppName, A.Type AS AppType, A.Origin AS AppOrigin, A.Version AS AppVersion, 
                A.ReleaseDate AS AppReleaseDate, A.IsReadOnly AS AppIsReadOnly, A.StatusID AS AppStatusID, 
                S.Name AS StatusName, S.Type AS StatusType
	FROM         mProfiles AS P 
	INNER JOIN mApplications AS A 
	ON P.ApplicationID = A.ApplicationID 
	INNER JOIN mStatus AS S ON A.StatusID = S.StatusID
	WHERE p.[Name] = @ProfileName and p.ApplicationID=@ApplicationID
END