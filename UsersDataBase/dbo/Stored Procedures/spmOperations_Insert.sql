-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Inserta un registro en la tabla mOperations.
-- =============================================
CREATE PROCEDURE [dbo].[spmOperations_Insert]
(
	@OperationID int = NULL OUTPUT,
	@Name varchar(25) = NULL,
	@ApplicationID int
)
AS
BEGIN

	SET NOCOUNT OFF
	declare @sysOperation int
	set @sysOperation=(select ISNULL(MAX(SysOperation), 0) + 1 
						from mOperations
						where ApplicationID=@ApplicationID)
						
	INSERT INTO [mOperations]
	(
		[Name],
		[ApplicationID],
		[IsReadOnly],
		[SysOperation]
	)
	VALUES
	(
		@Name,
		@applicationID,
		0,
		@sysOperation
	)

	set @applicationID = (SELECT @@IDENTITY)
	
END