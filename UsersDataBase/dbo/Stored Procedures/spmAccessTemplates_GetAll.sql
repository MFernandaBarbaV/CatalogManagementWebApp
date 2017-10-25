-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona todos los registros de la tabla mAccessTemplates.
-- =============================================
CREATE PROCEDURE [dbo].[spmAccessTemplates_GetAll]
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

END