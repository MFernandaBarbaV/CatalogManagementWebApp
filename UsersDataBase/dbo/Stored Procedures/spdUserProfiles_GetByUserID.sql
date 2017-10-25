-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Obtiene un listado de los perfiles asigando al usuario.
-- Updated:		2014-07-29 Esteban Cruz
--				Se agregó la columna ManagesDelegations para las aplicaciones que manejan delegaciones u oficinas
-- =============================================
CREATE PROCEDURE [dbo].[spdUserProfiles_GetByUserID]
(
	@UserID int
)AS
BEGIN
	SELECT UP.ProfileID, P.Name, P.IsReadOnly, P.ApplicationID, A.Name AS AppName, A.Type AS AppType, A.Origin AS AppOrigin, A.Version AS AppVersion, 
		A.ReleaseDate AS AppReleaseDate, A.IsReadOnly AS AppIsReadOnly, A.StatusID AS AppStatusID, S.Name AS StatusName, S.Type AS StatusType, 
		UP.AccessTemplateID, AT.Name AS TemplateName, AT.Monday, AT.Tuesday, AT.Wednesday, AT.Thursday, AT.Friday, AT.Saturday, AT.Sunday, 
		AT.IsReadOnly AS TemplateIsReadOnly, A.ManagesDelagations
	FROM dUserProfiles AS UP INNER JOIN
		mAccessTemplates AS AT ON UP.AccessTemplateID = AT.AccessTemplateID INNER JOIN
		mProfiles AS P ON UP.ProfileID = P.ProfileID INNER JOIN
		mApplications AS A ON P.ApplicationID = A.ApplicationID INNER JOIN
		mStatus AS S ON A.StatusID = S.StatusID INNER JOIN
		mUsers AS U ON UP.UserID = U.UserID
	WHERE(UP.UserID = @UserID)
END