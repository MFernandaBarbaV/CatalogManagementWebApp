CREATE PROCEDURE [dbo].[spmAccessLog_GetAccessReportN]
(
	@ApplicationID int = -1,           
	@UsersIDs nvarchar(4000) = null,     
	@OperationsIDs nvarchar(4000) = null,
	@ProfilesIDs nvarchar(4000) = null, 
	@CreationDateStart smalldatetime = null,   
	@CreationDateEnd smalldatetime = null,
	@PageNum int,
	@sortExp varchar(15) = 'AccessLogID',
	@sortDir varchar(5) = 'd'
)
AS
BEGIN

--DECLARE @PageNum int
--SET @PageNum = 1
DECLARE @PageSize int
SET @PageSize = 10

;WITH access_log_limit AS
(
	SELECT *
	FROM mAccessLog
	WHERE (@CreationDateStart is null or ( @creationDateStart <= CreationDate and @creationDateEnd >= CreationDate ) ) and
			( @UsersIDs is null or ( @UsersIDs like '%,' + convert(nvarchar(10), UserID) + ',%' ) ) and
			( @OperationsIDs is null or ( @OperationsIDs like '%,' + convert(nvarchar(10), OperationID) + ',%' ) ) and
			( @ProfilesIDs is null or ( @ProfilesIDs like '%,' + convert(nvarchar(10), ProfileID) + ',%' ) ) and
			( ApplicationID = -1 or (ApplicationID = @ApplicationID) )
),
access_log AS
(
	SELECT
		ROW_NUMBER() OVER (
			ORDER BY 
					CASE WHEN @sortExp = 'AccessLogID'
					AND @sortDir = 'd'
					THEN AccessLogID END DESC,
					CASE WHEN @sortExp = 'AccessLogID'
					AND @sortDir != 'd'
					THEN AccessLogID END,
					CASE WHEN @sortExp = 'CreationDate'
					AND @sortDir = 'd'
					THEN CreationDate END DESC,
					CASE WHEN @sortExp = 'CreationDate'
					AND @sortDir != 'd'
					THEN CreationDate END,
					CASE WHEN @sortExp = 'UserLogin'
					AND @sortDir = 'd'
					THEN UserLogin END DESC,
					CASE WHEN @sortExp = 'UserLogin'
					AND @sortDir != 'd'
					THEN UserLogin END,
					CASE WHEN @sortExp = 'ProfileName'
					AND @sortDir = 'd'
					THEN ProfileName END DESC,
					CASE WHEN @sortExp = 'ProfileName'
					AND @sortDir != 'd'
					THEN ProfileName END,
					CASE WHEN @sortExp = 'UserName'
					AND @sortDir = 'd'
					THEN UserName END DESC,
					CASE WHEN @sortExp = 'UserName'
					AND @sortDir != 'd'
					THEN UserName END,
					CASE WHEN @sortExp = 'OperationID'
					AND @sortDir = 'd'
					THEN OperationID END DESC,
					CASE WHEN @sortExp = 'OperationID'
					AND @sortDir != 'd'
					THEN OperationID END
  		) AS [row_num],
		COUNT(*) OVER() AS [total_rows],
		*
		FROM access_log_limit
)
SELECT TOP(@PageSize) * FROM access_log  where row_num >= (((@PageNum - 1) * @PageSize) + 1)
--SELECT * FROM access_log 
--WHERE row_num BETWEEN (((@PageNum - 1) * @PageSize) + 1)
--				AND (@PageNum * @PageSize)

END
				--CASE @sortDir
				--  WHEN 'desc' THEN
				--	CASE @sortExp
				--	  WHEN 'AccessLogID' THEN AccessLogID
				--	  WHEN 'CreationDate' THEN CreationDate 
				--	  WHEN 'UserLogin' THEN UserLogin 
				--	  WHEN 'ProfileName' THEN ProfileName 
				--	  WHEN 'UserName' THEN UserName 
				--	  WHEN 'OperationID' THEN OperationID 
				--	  END
				--	END
				--	desc,
				--CASE @sortDir
				--  WHEN 'asc' THEN
				--	CASE @sortExp
				--	  WHEN 'AccessLogID' THEN AccessLogID
				--	  WHEN 'CreationDate' THEN CreationDate 
				--	  WHEN 'UserLogin' THEN UserLogin 
				--	  WHEN 'ProfileName' THEN ProfileName 
				--	  WHEN 'UserName' THEN UserName 
				--	  WHEN 'OperationID' THEN OperationID 
				--	END
				--  END
				--  ASC