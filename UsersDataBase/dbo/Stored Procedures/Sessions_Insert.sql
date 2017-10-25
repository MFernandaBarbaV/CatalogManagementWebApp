-- =============================================
-- Author:		Esteban Cruz
-- Create date: 2011/10/18
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[Sessions_Insert] 
	@id uniqueidentifier,
	@userID int, 
	@ip varchar(20) = '0.0.0.0'
AS
BEGIN
	SET NOCOUNT ON;
	
	declare @timeToExpire int
	set @timeToExpire=15
	
	insert into mSessions(ID, UserID, IPAddress, CreationDate, DeliveryDate)
	values(@id, @userID, @ip, GETDATE(), DATEADD(minute, @timeToExpire, getdate()))
    
END