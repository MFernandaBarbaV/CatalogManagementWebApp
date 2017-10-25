-- =============================================
-- Author:		Esteban Cruz
-- Create date: 2011/09/09
-- Description:	Selecciona un registro de la tabla mStatusType donde el identificador primario coincida con el parámetro @type.
-- =============================================
CREATE PROCEDURE [dbo].[spmStatusType_GetByID] 
	@type int
AS
BEGIN
	SET NOCOUNT ON;

    SELECT * from mStatusTypes
	Where TypeID=@type
END