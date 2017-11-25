CREATE TABLE [dbo].[UserOperations](
	[UserID] [int] NOT NULL,
	[OperationID] [int] NOT NULL,
 CONSTRAINT [PK_UserOperations] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[OperationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY], 
    CONSTRAINT [FK_UserOperations_Users] FOREIGN KEY ([UserId]) REFERENCES [Users]([UserId])
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserOperations]  WITH CHECK ADD  CONSTRAINT [FK_UserOperations_Operations] FOREIGN KEY([OperationID])
REFERENCES [dbo].[Operations] ([OperationID])
GO

