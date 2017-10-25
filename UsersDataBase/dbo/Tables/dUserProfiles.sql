CREATE TABLE [dbo].[dUserProfiles](
	[UserID] [int] NOT NULL,
	[ProfileID] [int] NOT NULL,
	[AccessTemplateID] [int] NOT NULL,
 CONSTRAINT [PK_dUserProfiles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dUserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_dUserProfiles_mAccessTemplates] FOREIGN KEY([AccessTemplateID])
REFERENCES [dbo].[mAccessTemplates] ([AccessTemplateID])
GO

ALTER TABLE [dbo].[dUserProfiles] CHECK CONSTRAINT [FK_dUserProfiles_mAccessTemplates]
GO
ALTER TABLE [dbo].[dUserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_dUserProfiles_mProfiles] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[mProfiles] ([ProfileID])
GO

ALTER TABLE [dbo].[dUserProfiles] CHECK CONSTRAINT [FK_dUserProfiles_mProfiles]
GO
ALTER TABLE [dbo].[dUserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_dUserProfiles_mUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[mUsers] ([UserID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[dUserProfiles] CHECK CONSTRAINT [FK_dUserProfiles_mUsers]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User ID to which is assigned the user profile' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dUserProfiles', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Profile ID which is assigned the user profile' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dUserProfiles', @level2type=N'COLUMN',@level2name=N'ProfileID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Access Template ID which is assigned the user profile' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dUserProfiles', @level2type=N'COLUMN',@level2name=N'AccessTemplateID'