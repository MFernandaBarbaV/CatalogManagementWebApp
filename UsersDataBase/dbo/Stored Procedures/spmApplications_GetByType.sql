-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona todas los registros de la tabla mApplications donde la columna Type coincida con el parámetro @ApplicationType.
-- =============================================
CREATE PROCEDURE [dbo].[spmApplications_GetByType]
(
	@ApplicationType varchar(25)
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT     App.ApplicationID, App.Name, App.Type, App.Origin, App.Version, App.ReleaseDate, App.IsReadOnly, App.StatusID, 
				Status.Name AS StatusName, Status.Type AS StatusType
	FROM         mApplications AS App 
	INNER JOIN mStatus AS Status 
	ON App.StatusID = Status.StatusID
	WHERE     (App.Type = @ApplicationType)

END