CREATE TABLE [dbo].[mProfiles](
	[ProfileID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[IsReadOnly] [bit] NOT NULL,
	[StatusID] [int] NOT NULL CONSTRAINT [DF_mProfiles_StatusID]  DEFAULT ((1)),
 CONSTRAINT [PK_mProfiles] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mProfiles]  WITH CHECK ADD  CONSTRAINT [FK_mProfiles_mApplications] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[mApplications] ([ApplicationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[mProfiles] CHECK CONSTRAINT [FK_mProfiles_mApplications]
GO
ALTER TABLE [dbo].[mProfiles]  WITH CHECK ADD  CONSTRAINT [FK_mProfiles_mStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[mStatus] ([StatusID])
GO

ALTER TABLE [dbo].[mProfiles] CHECK CONSTRAINT [FK_mProfiles_mStatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique auto numeric identifier for this table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mProfiles', @level2type=N'COLUMN',@level2name=N'ProfileID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of profile' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mProfiles', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Application to which the profile belongs.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mProfiles', @level2type=N'COLUMN',@level2name=N'ApplicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value indicating whether this instance is read only.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mProfiles', @level2type=N'COLUMN',@level2name=N'IsReadOnly'