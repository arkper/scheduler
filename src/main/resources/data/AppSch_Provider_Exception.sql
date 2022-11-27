USE [OMSQLDB]
GO

/****** Object:  Table [dbo].[AppSch_Provider_Exception]    Script Date: 11/19/2022 12:12:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AppSch_Provider_Exception](
	[pro_exception_no] [int] IDENTITY(1,1) NOT NULL,
	[pro_no] [int] NULL,
	[LocationID] [int] NULL,
	[pro_available_ind] [bit] NULL,
	[pro_start_time] [nvarchar](11) NULL,
	[pro_end_time] [nvarchar](11) NULL,
	[pro_exception_date] [datetime] NULL,
	[pro_notes] [nvarchar](255) NULL,
	[pro_recur_enddate] [datetime] NULL,
	[pro_recur_pattern] [nvarchar](50) NULL,
	[recorded_date] [datetime] NULL,
	[recorded_by_computer] [nvarchar](20) NULL,
	[pro_recur_range] [nvarchar](50) NULL,
	[pro_recur_end_Occurence] [int] NULL,
	[pro_recur_daily_pattern] [nvarchar](50) NULL,
	[pro_recur_weekly_pattern] [nvarchar](50) NULL,
	[pro_recur_monthly_pattern] [nvarchar](50) NULL,
	[pro_recurs_every] [int] NULL,
	[pro_recur_month_day] [int] NULL,
	[pro_recur_day_type] [nvarchar](50) NULL,
	[pro_recur_day_month_type] [nvarchar](50) NULL,
	[pro_recur_weekly_day] [int] NULL,
	[pro_delete_ind] [bit] NULL,
	[exceptionRecurrenceID] [int] NULL,
 CONSTRAINT [PK_AppSch_Provider_Exception] PRIMARY KEY CLUSTERED 
(
	[pro_exception_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AppSch_Provider_Exception] ADD  CONSTRAINT [DF_AppSch_Provider_Exception_pro_available_ind]  DEFAULT ((0)) FOR [pro_available_ind]
GO

ALTER TABLE [dbo].[AppSch_Provider_Exception] ADD  CONSTRAINT [DF_AppSch_Provider_Exception_pro_delete_ind]  DEFAULT ((0)) FOR [pro_delete_ind]
GO

