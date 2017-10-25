-- =============================================
-- Author:		Esteban Cruz
-- Create date: 2012/02/11
-- Description:	Obtiene el Login del usuario por el ID de SmartCard asignado.
-- Updated:		2014/01/02 Esteban Cruz
--				Expiration was added to query.
-- =============================================
CREATE PROCEDURE [dbo].[spmUser_GetNameBySmartCardID] 
	@SmartCardID int = 0
AS
BEGIN
	SET NOCOUNT ON;

	Select Top(1) usr.Login, sc.RoleID, CONVERT(varchar(10), sc.Expiration, 103) Expiration
	From mSmartCards sc 
	Inner Join mUsers usr 
	ON sc.UserID = usr.UserID
	Where sc.SmartCardID = @SmartCardID
END