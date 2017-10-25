create PROCEDURE [dbo].[spmApplications_GetAllWithOperations]
AS
BEGIN

	SET NOCOUNT ON

	SELECT     App.ApplicationID, App.Name, App.Type, App.Origin, App.Version, App.ReleaseDate, App.IsReadOnly, App.StatusID, 
				1 AS WithOperations, 
				Status.Name AS StatusName, Status.Type AS StatusType
	FROM         mApplications AS App 
	INNER JOIN mStatus AS Status 
	ON App.StatusID = Status.StatusID
END