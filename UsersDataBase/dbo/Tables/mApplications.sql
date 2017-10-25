CREATE TABLE [dbo].[mApplications](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [varchar](25) NOT NULL,
	[Origin] [varchar](255) NULL,
	[Version] [varchar](30) NULL,
	[ReleaseDate] [datetime] NULL,
	[IsReadOnly] [bit] NOT NULL,
	[ManagesDelagations] [bit] NOT NULL CONSTRAINT [DF_mApplications_ManagesDelagations]  DEFAULT ((0)),
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_mApplications] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mApplications]  WITH CHECK ADD  CONSTRAINT [FK_mApplications_mStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[mStatus] ([StatusID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[mApplications] CHECK CONSTRAINT [FK_mApplications_mStatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique auto numeric identifier for this table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mApplications', @level2type=N'COLUMN',@level2name=N'ApplicationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Application Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mApplications', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifier for the type application' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mApplications', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Origin of the application' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mApplications', @level2type=N'COLUMN',@level2name=N'Origin'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Version of the application' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mApplications', @level2type=N'COLUMN',@level2name=N'Version'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date of release of the version application' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mApplications', @level2type=N'COLUMN',@level2name=N'ReleaseDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value indicating whether this instance is read only.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mApplications', @level2type=N'COLUMN',@level2name=N'IsReadOnly'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current status of the application' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mApplications', @level2type=N'COLUMN',@level2name=N'StatusID'