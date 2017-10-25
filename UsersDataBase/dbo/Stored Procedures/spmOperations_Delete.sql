-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Elimina un registro de la tabla mOperations donde el identificador primario coincida con el parámetro @OperationID.
-- =============================================
CREATE PROCEDURE [dbo].[spmOperations_Delete]
(
	@OperationID int
)
AS
BEGIN

	DECLARE @IsReadOnly bit
	SET @IsReadOnly = (SELECT IsReadOnly FROM mOperations WHERE 
					([OperationID] = @OperationID))
	IF (@IsReadOnly is null)
	BEGIN
		SET @IsReadOnly = 0
	END
	
	if exists(select * from dProfileOperations
				where OperationID=@OperationID)
	begin
		raiserror('000055', 16, 1)
		return
	end
	
	IF (@IsReadOnly = 0)
	BEGIN
		DELETE FROM mOperations
		WHERE [OperationID]=@OperationID
		
		declare @next int
		set @next=(select ISNULL(MAX(OperationID), 0) from mOperations)
		DBCC CHECKIDENT('mOperations', RESEED, @next)
	END
	ELSE
	BEGIN
		RAISERROR('000003',16,1)
	END

	IF( @@ROWCOUNT = 0)
	BEGIN
	  SELECT 0 as Success
	END
	ELSE
	BEGIN
	  SELECT 1 as Success
	END		
		
END