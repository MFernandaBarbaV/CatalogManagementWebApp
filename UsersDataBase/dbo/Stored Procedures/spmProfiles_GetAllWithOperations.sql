-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona todos los registros de la tabla mProfiles.
-- =============================================
CREATE PROCEDURE [dbo].[spmProfiles_GetAllWithOperations]
AS
BEGIN

	SET NOCOUNT ON

	SELECT P.ProfileID, P.Name, P.IsReadOnly, P.ApplicationID, 
				A.Name AS AppName, A.Type AS AppType, A.Origin AS AppOrigin, A.Version AS AppVersion, 
                A.ReleaseDate AS AppReleaseDate, A.IsReadOnly AS AppIsReadOnly, A.StatusID AS AppStatusID, 
                S.Name AS StatusName, S.Type AS StatusType,
                1 AS WithOperations
	FROM         mProfiles AS P 
	INNER JOIN mApplications AS A 
	ON P.ApplicationID = A.ApplicationID 
	INNER JOIN mStatus AS S ON A.StatusID = S.StatusID
	ORDER BY P.ProfileID
END