-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona de la tabla mApplications el primer registro donde la columna Name coincida con el parámetro @ApplicationName.
-- =============================================
CREATE PROCEDURE [dbo].[spmApplications_GetByName]
(
	@ApplicationName varchar(50) 
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT     TOP (1) App.ApplicationID, App.Name, App.Type, App.Origin, App.Version, App.ReleaseDate, App.IsReadOnly, App.StatusID, 
				Status.Name AS StatusName, Status.Type AS StatusType
	FROM         mApplications AS App 
	INNER JOIN mStatus AS Status 
	ON App.StatusID = Status.StatusID
	WHERE     (App.Name = @ApplicationName)
	ORDER BY App.StatusID

END