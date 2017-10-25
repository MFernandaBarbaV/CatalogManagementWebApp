-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Obtiene el listado de todos los registros de la tabla mAccessLog
-- =============================================
CREATE PROCEDURE [dbo].[spmAccessLog_GetAll]
AS
BEGIN

	SET NOCOUNT ON
	
	SELECT [Log].AccessLogID, [Log].UserID, [Log].UserName, [Log].ProfileID, [Log].ProfileName, 
			[Log].OperationID, [Log].CreationDate, [Log].UserLogin, [Log].ApplicationID, 
            App.Name AS ApplicationName, Oper.Name AS OperationName
	FROM mAccessLog AS [Log] 
	INNER JOIN mApplications AS App 
	ON [Log].ApplicationID = App.ApplicationID 
	INNER JOIN mOperations AS Oper 
	ON [Log].OperationID = Oper.OperationID
	order by CreationDate desc, UserID, [Log].ApplicationID
END