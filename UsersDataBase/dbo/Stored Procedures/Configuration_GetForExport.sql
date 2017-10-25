-- =============================================
-- Author:		Esteban Cruz
-- Create date: 2011/11/08
-- Description:	Obtiene las sentencias de insert para exportar la configuración a otra base de datos
-- =============================================
CREATE PROCEDURE [dbo].[Configuration_GetForExport] 
	@whereClause varchar(2000),
	@TableName varchar(30)
AS
BEGIN
	declare @ColumnName sysname, 
			@TrimFlag bit = 1, 
			@Identity_Handle bit = 1, 
			@ColumnType int, 
			@ColOrder int, 
			@TableID int, 
			@ExecStr varchar(4000), 
			@HeadStr varchar(4000), 
			@MaxCol int, 
			@ColList bit

	declare @TrimHeader varchar(12), 
			@TrimTail varchar(2), 
			@colstat smallint, 
			@identity bit
		--, @identity_insert_on varchar(100)
		--, @identity_insert_off varchar(100)

--We should find out whether the result need to be trimmed.
	if @TrimFlag = 1
	begin
		set @TrimHeader = 'LTRIM(RTRIM('
		set @TrimTail = '))'
	end
	else
	begin
		set @TrimHeader = ''
		set @TrimTail = ''
	end

	set @ColList = 1
	set @identity = 0

	set @TableID = object_id(@TableName)
	set @HeadStr = '('
	--set @identity_insert_on = 'SET IDENTITY_INSERT ' + @TableName + ' ON'
	--set @identity_insert_off = 'SET IDENTITY_INSERT ' + @TableName + ' OFF'

	select @MaxCol = max(colorder)
	from syscolumns
	where id = @TableID

	declare ColumnList cursor scroll for 
			select name, xtype, colorder, colstat
			from syscolumns
			where id = @TableID
			order by colorder
		open ColumnList
			fetch first from ColumnList 
						into @ColumnName, @ColumnType, @ColOrder, @colstat
			while @@fetch_status <> -1
			begin

				--if @colstat = 1 and @Identity_Handle = 1
				--set @identity = 1

				if not(@colstat = 1 and @Identity_Handle = 0)
				begin
					set @HeadStr = @HeadStr + case 
										when @ColOrder < @MaxCol 
											then @ColumnName + ', '
										else @ColumnName + ')'
										end
				end

			fetch next from ColumnList 
						into @ColumnName, @ColumnType, @ColOrder, @colstat
			end

			if @ColList = 1 
				set @ExecStr = 'SELECT ''INSERT INTO ' + @TableName + ' ' + @HeadStr + ' VALUES ('' + '
			else
				set @ExecStr = 'SELECT ''INSERT INTO ' + @TableName + ' VALUES ('' + '

			fetch first from ColumnList 
						into @ColumnName, @ColumnType, @ColOrder, @colstat

			while @@fetch_status <> -1
			begin

				if not(@colstat = 1 and @Identity_Handle = 0)
				begin
					set @ExecStr = @ExecStr + case 
									when @ColumnType in (48,52,56,59,62,104,106,108,127) 
										then 'convert(varchar, ' + @ColumnName + ')' 
									when @ColumnType in (61) 
										then ''''''''' + replace(convert(varchar, ' + @ColumnName + ', 120), ''.'', '''') + ''''''''' 
									else '''N'' + '''''''' + ' + @TrimHeader + 'replace(' + @ColumnName + ', '''''''', '''''''''''')' + @TrimTail + ' + '''''''''
									end + case 
											when @ColOrder < @MaxCol 
												then ','+ ''','' as Splittor'+', '
											else ',' + ''')'' as Tail'+' FROM ' + @TableName + ' ' + @whereClause --' WHERE userID = ' + convert(varchar, @user) 
											end
				end

			fetch next from ColumnList 
						into @ColumnName, @ColumnType, @ColOrder, @colstat
			end

		close ColumnList
	deallocate ColumnList

--if @identity = 1
--select @identity_insert_on

exec (@Execstr)
--print @Execstr

--if @identity = 1
--select @identity_insert_off

--select @IdIni = (Select Min(idembarque) from LibrosMontenegro.dbo.Embarque where idStatus = 31 AND Ready = 0)
--select @IdFin = (Select Max(idembarque) from LibrosMontenegro.dbo.Embarque where idStatus = 31 AND Ready = 0)

return
END