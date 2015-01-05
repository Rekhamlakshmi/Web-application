USE [University]
GO

/****** Object:  Table [dbo].[Department]    Script Date: 11/17/2012 16:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Department](
	[DNo] [int] NOT NULL,
	[DName] [nvarchar](50) NULL,
	[College] [nvarchar](60) NULL,
	CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED
(
[DNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


