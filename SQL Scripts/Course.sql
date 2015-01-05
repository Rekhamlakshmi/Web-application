USE [University]
GO

/****** Object:  Table [dbo].[Course]    Script Date: 11/17/2012 16:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Course](
	[CNo] [nvarchar] (50) NOT NULL,
	[CName] [nvarchar](70) NULL,
	[Description] [nvarchar](400) NULL,
	[Credits] [int] NULL,
	[Level] [nvarchar](15) NULL,
	[OfferingDNo] [int] NULL,
	CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED
(
[CNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


