CREATE TABLE [dbo].[mUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[ZipCode] [int] NULL,
	[Email] [varchar](120) NOT NULL,
	[Organization] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[ShortName] [varchar](15) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[Sex] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsReadOnly] [bit] NOT NULL,
	[IsFirstSession] [bit] NOT NULL,
	[IsActiveSession] [bit] NOT NULL,
	[LastLogin] [datetime] NOT NULL DEFAULT (getdate()),
 CONSTRAINT [PK_mUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mUsers]  WITH CHECK ADD  CONSTRAINT [FK_mUsers_mStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[mStatus] ([StatusID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[mUsers] CHECK CONSTRAINT [FK_mUsers_mStatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique auto numeric identifier for this table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last name of the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'LastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Surname of the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'Surname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Address of the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of zipcode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Email of the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the company where user works' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'Organization'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Position that has the user in the company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'Position'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User shortname' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'ShortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User login for the access to the application' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'Login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User password for the access to the application' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier of the sex' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'Sex'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current status of the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'StatusID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date of user creation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value indicating whether this instance is read only.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mUsers', @level2type=N'COLUMN',@level2name=N'IsReadOnly'