-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona todos los registros de la tabla nProfiles.
-- =============================================
CREATE PROCEDURE [dbo].[spmProfiles_GetAll]
AS
BEGIN

	SET NOCOUNT ON

	declare @IdStatusDelete int
	select @IdStatusDelete = StatusID from mStatus where Name = 'Deleted'

	SELECT     P.ProfileID, P.Name, P.IsReadOnly, P.ApplicationID, 
				A.Name AS AppName, A.Type AS AppType, A.Origin AS AppOrigin, A.Version AS AppVersion, 
                A.ReleaseDate AS AppReleaseDate, A.IsReadOnly AS AppIsReadOnly, A.StatusID AS AppStatusID, 
                S.Name AS StatusName, S.Type AS StatusType
	FROM         mProfiles AS P 
	INNER JOIN mApplications AS A 
	ON P.ApplicationID = A.ApplicationID 
	INNER JOIN mStatus AS S ON A.StatusID = S.StatusID
	WHERE P.StatusID <> @IdStatusDelete
	ORDER BY P.ProfileID
END