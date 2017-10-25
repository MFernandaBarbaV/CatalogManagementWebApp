-- =============================================
-- Author:		Esteban Cruz
-- Create date: 03/12/2012
-- Description:	Actualiza un registro de la tabla mAccessTemplate donde el identificador primario coincida con el parámetro @AccessTemplateID.
-- =============================================
CREATE PROCEDURE [dbo].[spmAccessTemplates_Update]
(
	@AccessTemplateID int,
	@Name varchar(50),
	@Monday varchar(6),
	@Tuesday varchar(6),
	@Wednesday varchar(6),
	@Thursday varchar(6),
	@Friday varchar(6),
	@Saturday varchar(6),
	@Sunday varchar(6)
)
AS
BEGIN
	set nocount off;
	DECLARE @IsReadOnly bit
	
	SET @IsReadOnly = (SELECT IsReadOnly 
						FROM mAccessTemplates 
						WHERE AccessTemplateID=@AccessTemplateID
						)
	IF (@IsReadOnly is null)
	BEGIN
		SET @IsReadOnly = 0
	END	
	
	if exists(select * from mAccessTemplates where Name=@Name
				and AccessTemplateID <> @AccessTemplateID)
	begin
		raiserror('000056', 16, 1)
		return
	end
	
	if(@IsReadOnly=1)
	begin
		raiserror('000049', 16, 1)
		return
	end
	
	UPDATE [mAccessTemplates]
	SET
		[Name] = @Name,
		[Monday] = @Monday,
		[Tuesday] = @Tuesday,
		[Wednesday] = @Wednesday,
		[Thursday] = @Thursday,
		[Friday] = @Friday,
		[Saturday] = @Saturday,
		[Sunday] = @Sunday
	WHERE
		[AccessTemplateID] = @AccessTemplateID
	
END