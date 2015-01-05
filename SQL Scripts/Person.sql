USE [University]
GO

/****** Object:  Table [dbo].[Person]    Script Date: 11/17/2012 16:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Person](
	[NetID] [nvarchar](12) NOT NULL,
	[SSN] [int] NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[Sex] [nchar](1) NULL,
	[Phone] [bigint] NULL,
	CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED
(
[NetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


