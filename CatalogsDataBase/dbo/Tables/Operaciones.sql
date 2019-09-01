﻿CREATE TABLE [dbo].[Operaciones](
	[IdOperacion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	
 
    CONSTRAINT [PK_mOperations] PRIMARY KEY CLUSTERED 
(
	[IdOperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

