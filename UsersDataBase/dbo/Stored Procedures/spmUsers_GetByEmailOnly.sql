-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona de la tabla mUsers el registro donde la columna Email coincida con el parámetro @Email.
-- =============================================
CREATE PROCEDURE [dbo].[spmUsers_GetByEmailOnly]
(
	@Email varchar(40)
)
AS
BEGIN
	SET NOCOUNT ON
	
	declare @IdStatusDelete int
	select @IdStatusDelete = StatusID from mStatus where Name = 'Deleted'

	SELECT
		m.[UserID],
		m.[Name],
		m.[LastName],
		m.[Surname],
		m.[Address],
		m.[ZipCode],
		m.[Email],
		m.[Organization],
		m.[Position],
		m.[ShortName],
		m.[Login],
		m.[Password],
		m.[StatusID],
		m.[CreateDate],
		m.[Sex],
		m.[IsReadOnly],
		m.IsActiveSession,
		m.IsFirstSession
	FROM [mUsers] m
	WHERE ([Email] = @Email)
	AND m.StatusID <> @IdStatusDelete
END