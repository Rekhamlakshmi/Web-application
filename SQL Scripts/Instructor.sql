USE [University]
GO

/****** Object:  Table [dbo].[Instructor]    Script Date: 11/17/2012 16:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Instructor](
	[NetID] [nvarchar](12) NOT NULL,
	[Rank] [nvarchar](30) NULL,
	[Office] [nvarchar](20) NULL,
	[Officehrs] [nvarchar] (200) NULL,
	CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED
(
[NetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


