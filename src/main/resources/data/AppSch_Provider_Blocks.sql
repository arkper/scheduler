USE [OMSQLDB]
GO

/****** Object:  Table [dbo].[AppSch_Provider_Blocks]    Script Date: 11/19/2022 12:09:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AppSch_Provider_Blocks](
	[prb_no] [int] IDENTITY(1,1) NOT NULL,
	[range_no] [int] NOT NULL,
	[pro_no] [int] NULL,
	[LocationID] [int] NULL,
	[prb_description] [nvarchar](30) NULL,
	[prb_block_method] [smallint] NULL,
	[prb_block_type] [smallint] NULL,
	[prb_start_date_time] [nvarchar](11) NULL,
	[prb_end_date_time] [nvarchar](11) NULL,
	[prb_duration] [int] NULL,
	[prb_block_until] [datetime] NULL,
	[prb_day_of_week] [smallint] NULL,
	[prb_specific_day] [datetime] NULL,
	[prb_every] [int] NULL,
	[prb_optsel] [int] NULL,
	[prb_wkmon] [int] NULL,
	[prb_recorded_date] [datetime] NULL,
	[recorded_date] [datetime] NULL,
	[recorded_by_computer] [nvarchar](255) NULL,
 CONSTRAINT [AppSch_Provider_Blocks.PK_AppSch_Provider_Blocks_1] PRIMARY KEY CLUSTERED 
(
	[prb_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AppSch_Provider_Blocks] ADD  CONSTRAINT [DF_AppSch_Provider_Blocks_recorded_date]  DEFAULT (getdate()) FOR [recorded_date]
GO

