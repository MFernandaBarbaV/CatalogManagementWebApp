CREATE TABLE [dbo].[dProfileOperations](
	[ProfileID] [int] NOT NULL,
	[OperationID] [int] NOT NULL,
 CONSTRAINT [PK_dProfileOperations] PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC,
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dProfileOperations]  WITH CHECK ADD  CONSTRAINT [FK_dProfileOperations_mOperations] FOREIGN KEY([OperationID])
REFERENCES [dbo].[mOperations] ([OperationID])
GO

ALTER TABLE [dbo].[dProfileOperations] CHECK CONSTRAINT [FK_dProfileOperations_mOperations]
GO
ALTER TABLE [dbo].[dProfileOperations]  WITH CHECK ADD  CONSTRAINT [FK_dProfileOperations_mProfiles] FOREIGN KEY([ProfileID])
REFERENCES [dbo].[mProfiles] ([ProfileID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[dProfileOperations] CHECK CONSTRAINT [FK_dProfileOperations_mProfiles]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Profile ID to which is assigned the profile.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dProfileOperations', @level2type=N'COLUMN',@level2name=N'ProfileID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Operation ID that is assigned to the profile' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dProfileOperations', @level2type=N'COLUMN',@level2name=N'OperationID'