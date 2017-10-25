-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona el registro de la tabla donde la columna Name coincida con el parámetro @Name y la columna ApplicationID coincida con el parámetro @ApplicationID.
-- =============================================
CREATE PROCEDURE [dbo].[spmOperations_GetByNameAndApplicationID]
(
	@Name varchar(50),
	@ApplicationID int
)
AS
BEGIN
	SET NOCOUNT ON
	

	SELECT top(1)    O.OperationID, O.Name, O.ApplicationID, O.IsReadOnly, O.SysOperation,
				A.Name AS AppName, A.Type AS AppType, A.Origin AS AppOrigin, A.Version AS AppVersion, 
                A.ReleaseDate AS AppReleaseDate, A.IsReadOnly AS AppIsReadOnly, A.StatusID AS AppStatusID, 
                S.Name AS StatusName, S.Type AS StatusType
	FROM         mOperations AS O 
	INNER JOIN mApplications AS A 
	ON O.ApplicationID = A.ApplicationID 
	INNER JOIN mStatus AS S 
	ON A.StatusID = S.StatusID
	WHERE(O.[Name] = @Name) and O.ApplicationID=@ApplicationID
END