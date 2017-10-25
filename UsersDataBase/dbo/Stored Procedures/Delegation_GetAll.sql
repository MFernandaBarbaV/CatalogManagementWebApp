-- =============================================
-- Author:		Francisco Pérez Sarabia
-- Create date: 02-Abril-2013
-- Description:	Obtiene la lista de delegaciones existentes
-- =============================================
CREATE PROCEDURE [dbo].[Delegation_GetAll] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DelegationID, Name FROM Delegation

END