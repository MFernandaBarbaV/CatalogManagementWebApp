CREATE TABLE [dbo].[mAccessTemplates](
	[AccessTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Monday] [varchar](6) NOT NULL,
	[Tuesday] [varchar](6) NOT NULL,
	[Wednesday] [varchar](6) NOT NULL,
	[Thursday] [varchar](6) NOT NULL,
	[Friday] [varchar](6) NOT NULL,
	[Saturday] [varchar](6) NOT NULL,
	[Sunday] [varchar](6) NOT NULL,
	[IsReadOnly] [bit] NOT NULL,
 CONSTRAINT [PK_mHorarios] PRIMARY KEY CLUSTERED 
(
	[AccessTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique auto numeric identifier for this table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessTemplates', @level2type=N'COLUMN',@level2name=N'AccessTemplateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Access Template Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessTemplates', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permissions template for the monday day' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessTemplates', @level2type=N'COLUMN',@level2name=N'Monday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permissions template for the tuesday day' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessTemplates', @level2type=N'COLUMN',@level2name=N'Tuesday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permissions template for the wednesday day' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessTemplates', @level2type=N'COLUMN',@level2name=N'Wednesday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permissions template for the thursday day' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessTemplates', @level2type=N'COLUMN',@level2name=N'Thursday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permissions template for the friday day' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessTemplates', @level2type=N'COLUMN',@level2name=N'Friday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permissions template for the saturday day' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessTemplates', @level2type=N'COLUMN',@level2name=N'Saturday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Permissions template for the sunday day' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessTemplates', @level2type=N'COLUMN',@level2name=N'Sunday'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Value indicating whether this instance is read only.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'mAccessTemplates', @level2type=N'COLUMN',@level2name=N'IsReadOnly'