-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona un registro de la tabla mApplications donde el identficador primario coincida con el parámetro mApplicationID y se encuentre relacionado con un registro de la tabla mProfiles.
-- =============================================
CREATE PROCEDURE [dbo].[spmApplications_GetByIDWithProfiles]
(
	@ApplicationID int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT     App.ApplicationID, App.Name, App.Type, App.Origin, App.Version, App.ReleaseDate, App.IsReadOnly, App.StatusID, 
				Status.Name AS StatusName, Status.Type AS StatusType, 
				1 AS WithProfiles
	FROM         mApplications AS App 
	INNER JOIN mStatus AS Status 
	ON App.StatusID = Status.StatusID
	WHERE     (App.ApplicationID = @ApplicationID)

END