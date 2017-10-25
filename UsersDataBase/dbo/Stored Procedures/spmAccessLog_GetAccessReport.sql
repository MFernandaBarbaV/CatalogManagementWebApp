CREATE PROCEDURE [dbo].[spmAccessLog_GetAccessReport]
(
	@ApplicationID int = null,           
	@UsersIDs nvarchar(4000) = null,     
	@OperationsIDs nvarchar(4000) = null,
	@ProfilesIDs nvarchar(4000) = null, 
	@CreationDateStart smalldatetime = null,   
	@CreationDateEnd smalldatetime = null  
)
AS
BEGIN
	--declare @ApplicationID int           --
	--declare @UsersIDs nvarchar(4000)     --
	--declare @OperationsIDs nvarchar(4000)
	--declare @ProfilesIDs nvarchar(4000) --
	--declare	@CreationDateStart smalldatetime   --
	--declare	@CreationDateEnd smalldatetime   --

	--set @OperationsIDs = '5'
	--set @ApplicationID = 1
	--set @OperationsIDs = ',9,'
	select * from dbo.mAccessLog al
	where (((CONVERT(varchar(10),CONVERT(varchar(10),@CreationDateStart,111),111) <= CONVERT(varchar(10),CONVERT(varchar(10), al.CreationDate,111),111)) and (CONVERT(varchar(10),@CreationDateEnd,111) >= CONVERT(varchar(10),CONVERT(varchar(10),al.CreationDate,111),111))) or (@CreationDateStart is null))
	and ((@UsersIDs like '%,' + convert(nvarchar(10), al.UserID ) + ',%')  or @UsersIDs is null)
	and ((@OperationsIDs like '%,' + convert(nvarchar(10), al.OperationID) + ',%')  or @OperationsIDs is null)
	and ((@ProfilesIDs like '%,' + convert(nvarchar(10), al.ProfileID ) + ',%')  or @ProfilesIDs is null)
	and (al.ApplicationID = @ApplicationID or @ApplicationID is null)
	order by al.CreationDate desc
END