-- =============================================
-- Author:		Francisco Pérez Sarabia
-- Create date: 01-Abril-2013
-- Description:	Obtiene un listado de las delegaciones asignadas al usuario.
-- =============================================
CREATE PROCEDURE [dbo].[spdUserDelegations_GetByUserID]
(
	@UserID int
)
AS
BEGIN
	SELECT     UD.UserID, D.DelegationID, D.Name
	FROM         UserDelegations AS UD INNER JOIN
                      Delegation AS D ON UD.DelegationID = D.DelegationID
	WHERE     (UD.UserID = @UserID)
END