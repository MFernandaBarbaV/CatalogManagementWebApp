-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Agrega un nuevo registro en la dProfileOperations
-- =============================================
CREATE PROCEDURE [dbo].[spdProfileOperations_Insert]
(
	@ProfileID int,
	@OperationID int
)
AS
BEGIN
	set nocount off
	insert into dProfileOperations 
	values(@ProfileID, @OperationID)
END