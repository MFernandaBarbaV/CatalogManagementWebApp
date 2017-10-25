CREATE TABLE [dbo].[mOperations](
	[OperationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[SysOperation] [int] NOT NULL,
	[IsReadOnly] [bit] NOT NULL,
 CONSTRAINT [PK_mOperations] PRIMARY KEY CLUSTERED 
(
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[mOperations]  WITH CHECK ADD  CONSTRAINT [FK_mOperations_mApplications] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[mApplications] ([ApplicationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[mOperations] CHECK CONSTRAINT [FK_mOperations_mApplications]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique auto numeric identifier for this table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mOperations', @level2type=N'COLUMN',@level2name=N'OperationID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of operation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mOperations', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Application to which the operation belongs.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mOperations', @level2type=N'COLUMN',@level2name=N'ApplicationID'