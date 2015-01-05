USE [University]
GO

/****** Object:  Table [dbo].[StudentCourse]    Script Date: 11/17/2012 16:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StudentCourse](
	[NetID] [nvarchar](12) NOT NULL,
	[ClassNumber] [int] NOT NULL,
	[Grade] [nvarchar] (10) NULL
	CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED
(
[NetID],[ClassNumber] 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


