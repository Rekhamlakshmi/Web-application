USE [University]
GO

/****** Object:  Table [dbo].[StudentWorker]    Script Date: 11/17/2012 16:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StudentWorker](
	[NetID] [nvarchar](12) NOT NULL,
	[Hours] [float] NULL,
	[RAflag] [nvarchar](10) NULL,
	[ResearchTopic] [nvarchar] (100) NULL,
	[TAflag] [nvarchar] (10) NULL,
	[CourseNo] [nvarchar] (50) NULL,
	CONSTRAINT [PK_StudentWorker] PRIMARY KEY CLUSTERED
(
[NetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


