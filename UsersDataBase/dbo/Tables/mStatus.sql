CREATE TABLE [dbo].[mStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_mStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mStatus]  WITH CHECK ADD  CONSTRAINT [FK_mStatus_mStatusTypes] FOREIGN KEY([Type])
REFERENCES [dbo].[mStatusTypes] ([TypeID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[mStatus] CHECK CONSTRAINT [FK_mStatus_mStatusTypes]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique auto numeric identifier for this table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mStatus', @level2type=N'COLUMN',@level2name=N'StatusID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mStatus', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status type identifier ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mStatus', @level2type=N'COLUMN',@level2name=N'Type'