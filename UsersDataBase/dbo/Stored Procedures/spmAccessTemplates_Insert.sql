-- =============================================
-- Author:		Esteban Cruz
-- Create date: 03/12/2012
-- Description:	Inserta un registro en la tabla mAccessTemplates
-- =============================================
CREATE PROCEDURE [dbo].[spmAccessTemplates_Insert]
(
	@AccessTemplateID int = NULL OUTPUT,
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
	
	if exists(select * from mAccessTemplates where Name=@Name)
	begin
		raiserror('000056', 16, 1)
		return
	end
	
	INSERT INTO [mAccessTemplates]
	(
		[Name],
		[Monday],
		[Tuesday],
		[Wednesday],
		[Thursday],
		[Friday],
		[Saturday],
		[Sunday],
		[IsReadOnly]
	)
	VALUES
	(
		@Name,
		@Monday,
		@Tuesday,
		@Wednesday,
		@Thursday,
		@Friday,
		@Saturday,
		@Sunday,
		'False'
	)
END