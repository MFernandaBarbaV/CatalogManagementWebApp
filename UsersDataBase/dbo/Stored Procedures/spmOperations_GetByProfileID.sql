-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona de la tabla mOperations los registros donde el identificador primario este relacionado con algún registro 
--	de la tabla dProfileOperations y el la columna ProfileID coincida con el parámetro @ProfileID.
-- =============================================
CREATE PROCEDURE [dbo].[spmOperations_GetByProfileID]
(
	@ProfileID int
) AS
BEGIN
	SELECT     O.OperationID, O.Name, O.ApplicationID, O.IsReadOnly, O.SysOperation,
				A.Name AS AppName, A.Type AS AppType, A.Origin AS AppOrigin, A.Version AS AppVersion, 
                A.ReleaseDate AS AppReleaseDate, A.IsReadOnly AS AppIsReadOnly, A.StatusID AS AppStatusID, 
                S.Name AS StatusName, S.Type AS StatusType
	FROM         mOperations AS O 
	INNER JOIN dProfileOperations AS PO 
	ON PO.OperationID = O.OperationID 
	INNER JOIN mProfiles AS P 
	ON PO.ProfileID = P.ProfileID 
	INNER JOIN mApplications AS A 
	ON O.ApplicationID = A.ApplicationID 
	INNER JOIN mStatus AS S ON A.StatusID = S.StatusID
	WHERE     (PO.ProfileID = @ProfileID)
END