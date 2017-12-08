-- exec [dbo].[spUser_DoLogin] 'axel', 'QUJDLzEyMyo0NTZfNzg5LkFCQy8xMjMqNDU2Xzc4OS4iK92+pmReSLUJuXoVylIv'
CREATE PROCEDURE [dbo].[spUser_DoLogin]
(
	@Login varchar(50),
	@Password nvarchar(300)
)
AS
BEGIN

	declare @IdStatusDelete int
	select @IdStatusDelete = 0
	
	SELECT TOP (1) U.UserID, U.Name, U.LastName, U.Surname, U.Address, U.ZipCode, U.Email, 
			 U.Position, U.ShortName, U.Login, U.Password, U.StatusID, 
                U.CreateDate,  U.IsReadOnly, U.IsFirstSession, U.IsActiveSession, 
                Status.Name AS StatusName, NEWID() AS Ticket, u.LastLogin
	FROM Users AS U 
	LEFT JOIN Status 
	ON U.StatusID = Status.StatusID
	WHERE(U.Login = @Login) AND (U.Password = @Password) AND U.StatusID <> @IdStatusDelete
	
	if exists(select * from Users 
				WHERE(Login = @Login) 
				AND (Password = @Password)
				And (IsActiveSession = 0)
				AND StatusID <> @IdStatusDelete)
	begin
		UPDATE Users SET LastLogin = GETDATE()
		WHERE  ([Login] = @Login) and [Password] = @Password
	end
	
	UPDATE Users SET IsActiveSession = 1
	WHERE  ([Login] = @Login) and [Password] = @Password and UserID > 1 AND StatusID <> @IdStatusDelete
END