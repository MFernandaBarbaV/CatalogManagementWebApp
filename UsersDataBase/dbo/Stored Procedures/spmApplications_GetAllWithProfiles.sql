-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona todos los registro de la tabla mApplications donde el identificador primario de la tabla mApplications este relacionado con un registro de la tabla mProfieles.
-- =============================================
CREATE PROCEDURE [dbo].[spmApplications_GetAllWithProfiles]
AS
BEGIN

	SET NOCOUNT ON

	SELECT DISTINCT 
			App.ApplicationID, App.Name, App.Type, App.Origin, App.Version, App.ReleaseDate, App.IsReadOnly, 
			App.StatusID, 1 AS WithProfiles, Status.Name AS StatusName, Status.Type AS StatusType
	FROM    mApplications AS App 
	INNER JOIN mStatus AS Status 
	ON App.StatusID = Status.StatusID 
	INNER JOIN mProfiles 
	ON App.ApplicationID = mProfiles.ApplicationID 
	INNER JOIN dProfileOperations 
	ON mProfiles.ProfileID = dProfileOperations.ProfileID
END