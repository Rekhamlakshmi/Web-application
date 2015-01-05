USE [University]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 11/17/2012 16:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Employee](
	[NetID] [nvarchar](12) NOT NULL,
	[Salary] [float] NULL,
	[Emp_type] [nvarchar](20) NULL,
	CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED
(
[NetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


