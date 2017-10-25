CREATE TABLE [dbo].[mAccessLog](
	[AccessLogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [varchar](127) NULL,
	[ProfileID] [int] NOT NULL,
	[ProfileName] [varchar](50) NULL,
	[OperationID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[UserLogin] [varchar](50) NULL,
	[ApplicationID] [int] NOT NULL,
 CONSTRAINT [PK_mAccessLog] PRIMARY KEY CLUSTERED 
(
	[AccessLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mAccessLog]  WITH CHECK ADD  CONSTRAINT [FK_mAccessLog_mApplications] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[mApplications] ([ApplicationID])
GO

ALTER TABLE [dbo].[mAccessLog] CHECK CONSTRAINT [FK_mAccessLog_mApplications]
GO
ALTER TABLE [dbo].[mAccessLog]  WITH CHECK ADD  CONSTRAINT [FK_mAccessLog_mOperations] FOREIGN KEY([OperationID])
REFERENCES [dbo].[mOperations] ([OperationID])
GO

ALTER TABLE [dbo].[mAccessLog] CHECK CONSTRAINT [FK_mAccessLog_mOperations]
GO
ALTER TABLE [dbo].[mAccessLog]  WITH CHECK ADD  CONSTRAINT [FK_mAccessLog_mProfiles] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[mProfiles] ([ProfileID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[mAccessLog] CHECK CONSTRAINT [FK_mAccessLog_mProfiles]
GO
ALTER TABLE [dbo].[mAccessLog]  WITH CHECK ADD  CONSTRAINT [FK_mAccessLog_mUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[mUsers] ([UserID])
GO

ALTER TABLE [dbo].[mAccessLog] CHECK CONSTRAINT [FK_mAccessLog_mUsers]
GO
ALTER TABLE [dbo].[mAccessLog] ADD  CONSTRAINT [DF_mGeneralLog_OperationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier log for general operations' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessLog', @level2type=N'COLUMN',@level2name=N'AccessLogID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User id who makes the operation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessLog', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User name who makes the operation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessLog', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User profile ID that was the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessLog', @level2type=N'COLUMN',@level2name=N'ProfileID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User profile name that was the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessLog', @level2type=N'COLUMN',@level2name=N'ProfileName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier of the operation made by the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessLog', @level2type=N'COLUMN',@level2name=N'OperationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date when the operation was made.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessLog', @level2type=N'COLUMN',@level2name=N'CreationDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User Login used when the operation was made.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessLog', @level2type=N'COLUMN',@level2name=N'UserLogin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Application that belong the user.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessLog', @level2type=N'COLUMN',@level2name=N'ApplicationID'