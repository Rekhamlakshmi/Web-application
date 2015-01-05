USE [University]
GO

/****** Object:  Table [dbo].[Student]    Script Date: 11/17/2012 16:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Student](
	[NetID] [nvarchar](12) NOT NULL,
	[SNo] [int] NULL,
	[Degree] [nvarchar](20) NULL,
	[MajorDNo] [int] NULL,
	CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED
(
[NetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


