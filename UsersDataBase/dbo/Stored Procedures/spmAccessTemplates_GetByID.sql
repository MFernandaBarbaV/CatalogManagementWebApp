-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona un registro de la mAccessTemplates por su identificador primario.
-- =============================================
CREATE PROCEDURE [dbo].[spmAccessTemplates_GetByID]
(
	@AccessTemplateID int
)
AS
BEGIN
	SELECT
		[AccessTemplateID],
		[Name],
		[Monday],
		[Tuesday],
		[Wednesday],
		[Thursday],
		[Friday],
		[Saturday],
		[Sunday],
		[IsReadOnly]
	FROM [mAccessTemplates]
	WHERE
		([AccessTemplateID] = @AccessTemplateID)

END