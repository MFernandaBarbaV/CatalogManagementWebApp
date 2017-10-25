-- =============================================
-- Author:		Esteban Cruz
-- Create date: 
-- Description:	Selecciona un registro de la tabla mUsers donde la columna Login concida con el parámetro @Login y la columna Password
--		coincida con el parámetro @Password.
-- =============================================
CREATE PROCEDURE [dbo].[spmUser_DoLogin]
(
	@Login varchar(50),
	@Password nvarchar(64)
)
AS
BEGIN

	declare @IdStatusDelete int
	select @IdStatusDelete = 0
	
	SELECT TOP (1) U.UserID, U.Name, U.LastName, U.Surname, U.Address, U.ZipCode, U.Email, 
				U.Organization, U.Position, U.ShortName, U.Login, U.Password, U.StatusID, 
                U.CreateDate, U.Sex, U.IsReadOnly, U.IsFirstSession, U.IsActiveSession, 
                mStatus.Name AS StatusName, mStatus.Type AS StatusType, NEWID() AS Ticket, u.LastLogin
	FROM mUsers AS U 
	INNER JOIN mStatus 
	ON U.StatusID = mStatus.StatusID
	WHERE(U.Login = @Login) AND (U.Password = @Password) AND U.StatusID <> @IdStatusDelete
	
	if exists(select * from mUsers 
				WHERE(Login = @Login) 
				AND (Password = @Password)
				And (IsActiveSession = 0)
				AND StatusID <> @IdStatusDelete)
	begin
		UPDATE mUsers SET LastLogin = GETDATE()
		WHERE  ([Login] = @Login) and [Password] = @Password
	end
	
	UPDATE mUsers SET IsActiveSession = 1
	WHERE  ([Login] = @Login) and [Password] = @Password and UserID > 1 AND StatusID <> @IdStatusDelete
END