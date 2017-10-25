-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona el primer registro que coincida con el parámetro @AccessTemplateName.
-- =============================================
CREATE PROCEDURE [dbo].[spmAccessTemplates_GetByName]
(
	@AccessTemplateName varchar(50)
)
AS
BEGIN
	SELECT TOP 1
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
		([Name] = @AccessTemplateName)
END