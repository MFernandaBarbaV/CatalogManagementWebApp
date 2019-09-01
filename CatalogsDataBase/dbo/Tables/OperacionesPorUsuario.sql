CREATE TABLE [dbo].[OperacionesPorUsuario](
	[IdUsuario] [int] NOT NULL,
	[IdOperacion] [int] NOT NULL,
 CONSTRAINT [PK_UserOperations] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdOperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY], 
    CONSTRAINT [FK_UserOperations_Users] FOREIGN KEY ([IdUsuario]) REFERENCES  [Usuario]([IdUsuario])
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OperacionesPorUsuario]  ADD  CONSTRAINT [FK_UserOperations_Operations] FOREIGN KEY([IdOperacion])
REFERENCES [dbo].[Operaciones] ([IdOperacion])
GO

