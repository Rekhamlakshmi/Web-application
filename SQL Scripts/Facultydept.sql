USE [University]
GO

/****** Object:  Table [dbo].[Facultydept]    Script Date: 11/17/2012 16:04:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Facultydept](
	[NetID] [nvarchar](12) NOT NULL,
	[DNo] [int] NOT NULL,
	CONSTRAINT [PK_Facultydept] PRIMARY KEY CLUSTERED
(
[NetID],[DNo] 
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


