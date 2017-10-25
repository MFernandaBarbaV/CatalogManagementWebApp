-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona un registro de la tabla mApplications donde el identificador primario coincida con el parámetro @ApplicationID.
-- =============================================
CREATE PROCEDURE [dbo].[spmApplications_GetByID]
(
	@ApplicationID int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT     App.ApplicationID, App.Name, App.Type, App.Origin, App.Version, App.ReleaseDate, App.IsReadOnly, App.StatusID, 
				Status.Name AS StatusName, Status.Type AS StatusType, COUNT(o.ApplicationID) AS NumOperations
	FROM         mApplications AS App 
	INNER JOIN mStatus AS Status 
	ON App.StatusID = Status.StatusID
	LEFT OUTER JOIN mOperations o 
		ON App.ApplicationID = o.ApplicationID

	WHERE     (App.ApplicationID = @ApplicationID)
	GROUP BY App.ApplicationID, App.Name, App.Type, App.Origin, App.Version, App.ReleaseDate, 
			 App.IsReadOnly, App.StatusID, Status.Name , Status.Type

END