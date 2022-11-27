USE [OMSQLDB]
GO

/****** Object:  Table [dbo].[AppSch_Appointment]    Script Date: 11/19/2022 11:39:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AppSch_Appointment](
	[appt_no] [int] IDENTITY(1,1) NOT NULL,
	[serv_no] [int] NULL,
	[pro_no] [int] NULL,
	[LocationID] [int] NULL,
	[ins_no] [int] NULL,
	[appt_name] [nvarchar](80) NULL,
	[appt_phone] [nvarchar](30) NULL,
	[appt_address] [nvarchar](255) NULL,
	[appt_notes] [nvarchar](255) NULL,
	[appt_date] [datetime] NULL,
	[appt_start_time] [nvarchar](11) NULL,
	[appt_end_time] [nvarchar](11) NULL,
	[appt_dayofweek] [smallint] NULL,
	[appt_color] [int] NULL,
	[appt_cancel_ind] [bit] NULL,
	[appt_confirmed_ind] [bit] NULL,
	[appt_left_msg_ind] [bit] NULL,
	[appt_no_answer_ind] [bit] NULL,
	[appt_show_ind] [smallint] NULL,
	[appt_new_pat_ind] [bit] NULL,
	[appt_pre_appointment] [bit] NULL,
	[appt_conf_inits] [nvarchar](3) NULL,
	[appt_resched_count] [int] NULL,
	[appt_Om_no] [int] NULL,
	[appt_Other_Ins_Name] [nvarchar](255) NULL,
	[appt_Workphone] [nvarchar](30) NULL,
	[recorded_by] [int] NULL,
	[recorded_date] [datetime] NULL,
	[recorded_by_computer] [nvarchar](255) NULL,
	[created_by] [int] NULL,
	[created_date] [datetime] NULL,
	[created_by_computer] [nvarchar](255) NULL,
	[EligibilityFileName] [nvarchar](100) NULL,
	[AuthFileName] [nvarchar](255) NULL,
	[appt_CellNumber] [nvarchar](15) NULL,
	[app_icon_1] [int] NULL,
	[app_icon_2] [int] NULL,
	[app_icon_3] [int] NULL,
	[app_recur_pattern] [nvarchar](50) NULL,
	[app_recur_enddate] [datetime] NULL,
	[appt_deleted_ind] [bit] NULL,
	[appt_recur_range] [nvarchar](50) NULL,
	[appt_recur_end_Occurence] [int] NULL,
	[appt_recur_daily_pattern] [nvarchar](50) NULL,
	[appt_recur_weekly_pattern] [nvarchar](50) NULL,
	[appt_recur_monthly_pattern] [nvarchar](50) NULL,
	[appt_recurs_every] [int] NULL,
	[appt_recur_month_day] [int] NULL,
	[appt_recur_day_type] [nvarchar](50) NULL,
	[appt_recur_day_month_type] [nvarchar](50) NULL,
	[appt_recur_weekly_day] [int] NULL,
	[app_icon_4] [int] NULL,
	[isRecurrenceVariance] [bit] NULL,
	[recurringAppointmentID] [int] NULL,
 CONSTRAINT [aaaaaAppSch_Appointment_PK] PRIMARY KEY NONCLUSTERED 
(
	[appt_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AppSch_Appointment] ADD  CONSTRAINT [DF__AppSch_Ap__appt___59063A47]  DEFAULT ((0)) FOR [appt_cancel_ind]
GO

ALTER TABLE [dbo].[AppSch_Appointment] ADD  CONSTRAINT [DF__AppSch_Ap__appt___59FA5E80]  DEFAULT ((0)) FOR [appt_confirmed_ind]
GO

ALTER TABLE [dbo].[AppSch_Appointment] ADD  CONSTRAINT [DF__AppSch_Ap__appt___5AEE82B9]  DEFAULT ((0)) FOR [appt_left_msg_ind]
GO

ALTER TABLE [dbo].[AppSch_Appointment] ADD  CONSTRAINT [DF__AppSch_Ap__appt___5BE2A6F2]  DEFAULT ((0)) FOR [appt_no_answer_ind]
GO

ALTER TABLE [dbo].[AppSch_Appointment] ADD  CONSTRAINT [DF__AppSch_Ap__appt___5CD6CB2B]  DEFAULT ((0)) FOR [appt_show_ind]
GO

ALTER TABLE [dbo].[AppSch_Appointment] ADD  CONSTRAINT [DF__AppSch_Ap__appt___5DCAEF64]  DEFAULT ((0)) FOR [appt_new_pat_ind]
GO

ALTER TABLE [dbo].[AppSch_Appointment] ADD  CONSTRAINT [DF__AppSch_Ap__appt___5EBF139D]  DEFAULT ((0)) FOR [appt_pre_appointment]
GO

ALTER TABLE [dbo].[AppSch_Appointment] ADD  CONSTRAINT [DF__AppSch_Ap__creat__5FB337D6]  DEFAULT ((0)) FOR [created_by]
GO

ALTER TABLE [dbo].[AppSch_Appointment] ADD  CONSTRAINT [DF_AppSch_Appointment_appt_deleted_ind]  DEFAULT ((0)) FOR [appt_deleted_ind]
GO

