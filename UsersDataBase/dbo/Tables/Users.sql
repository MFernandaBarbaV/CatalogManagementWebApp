CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[ZipCode] [int] NULL,
	[Email] [varchar](120) NOT NULL,
	[Position] [varchar](50) NULL,
	[ShortName] [varchar](15) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](300) NOT NULL,
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
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_mUsers_mStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[mUsers] CHECK CONSTRAINT [FK_mUsers_mStatus]
GO
