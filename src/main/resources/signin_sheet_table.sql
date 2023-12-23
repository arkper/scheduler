Use omsqldb
go

/****** Object:  Table [dbo].[SigninSheet]    Script Date: 12/23/2023 11:55:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SigninSheet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VisitorName] [varchar](100) NOT NULL,
	[DateTimeIn] [datetime] NOT NULL,
	[DateTimeOut] [datetime] NULL,
	[SigninImage] [nvarchar](max) NULL,
	[ToBeSeenBy] [varchar](100) NULL,
PRIMARY KEY CLUSTERED
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

