USE [University]
GO

/****** Object:  Table [dbo].[Section]    Script Date: 11/17/2012 16:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Section](
	[ClassNumber] [int] NOT NULL,
	[CNo][nvarchar](50) NULL,
	[SectionNo] [int] NULL,
	[Semester] [nvarchar] (20) NULL,
	[Year] [int] NULL,
	[FacultyNetID] [nvarchar] (12) NULL,
	[LectureTime] [nvarchar] (60) NULL,
	[ClassRoom] [nvarchar] (20) NULL,
	[InstructionMode] [nvarchar] (60) NULL,
	[TotalSeats] [int] NULL,
	[AvailSeats] [int] NULL,
	CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED
(
[ClassNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


