-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona de la tabla mProfiles los registros donde la columna Name coincida con el parámetro @ProfileName.
-- =============================================
CREATE PROCEDURE [dbo].[spmProfiles_GetByName]
(
	@ProfileName varchar(50)
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT		P.ProfileID, P.Name, P.IsReadOnly, P.ApplicationID, 
				A.Name AS AppName, A.Type AS AppType, A.Origin AS AppOrigin, A.Version AS AppVersion, 
                A.ReleaseDate AS AppReleaseDate, A.IsReadOnly AS AppIsReadOnly, A.StatusID AS AppStatusID, 
                S.Name AS StatusName, S.Type AS StatusType
	FROM         mProfiles AS P 
	INNER JOIN mApplications AS A 
	ON P.ApplicationID = A.ApplicationID 
	INNER JOIN mStatus AS S ON A.StatusID = S.StatusID
	WHERE P.[Name] = @ProfileName
END