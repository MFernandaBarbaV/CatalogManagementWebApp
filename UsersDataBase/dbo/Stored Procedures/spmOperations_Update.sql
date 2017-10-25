-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Actualiza un registro en la tabla mOperations donde el identificador primario coincida con el parámetro @OperationId.
-- =============================================
CREATE PROCEDURE [dbo].[spmOperations_Update]
(
	@OperationID int,
	@Name varchar(25) = NULL,
	@ApplicationID int = NULL
)
AS
BEGIN

	SET NOCOUNT OFF;
	declare @currentApp int
	
	select @currentApp=ApplicationID from mOperations
	where OperationID=@OperationID
	
	if exists(select * from dProfileOperations
				where OperationID=@OperationID)
	BEGIN
		if(@currentApp != @ApplicationID)
		begin
			raiserror('000062', 16, 1)
			return
		end
	END

	UPDATE [mOperations]
	SET
		[Name] = @Name,
		[ApplicationID] = @ApplicationID
	WHERE
		[OperationID] = @OperationID
END