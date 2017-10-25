CREATE PROCEDURE [dbo].[spdUserProfiles_GetAll]
AS
BEGIN

	SET NOCOUNT ON
	

	SELECT
		[UserID],
		[ProfileID],
		[AccessTemplateID]
	FROM [dUserProfiles]
END