-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona todos los registros de la tabla mApplications.
-- =============================================
CREATE PROCEDURE [dbo].[spmApplications_GetAll]
AS
BEGIN

	SET NOCOUNT ON

	SELECT App.ApplicationID, App.Name, App.Type, App.Origin, App.Version, App.ReleaseDate, App.IsReadOnly, App.StatusID,
		   Status.Name AS StatusName, Status.Type AS StatusType, COUNT(o.ApplicationID) AS NumOperations
	FROM   mApplications AS App 
	INNER JOIN mStatus AS Status 
		ON App.StatusID = Status.StatusID
	LEFT OUTER JOIN mOperations o 
		ON App.ApplicationID = o.ApplicationID
	GROUP BY App.ApplicationID, App.Name, App.Type, App.Origin, App.Version, App.ReleaseDate, 
			 App.IsReadOnly, App.StatusID, Status.Name , Status.Type
END