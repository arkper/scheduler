USE [OMSQLDB]
GO

/****** Object:  Table [dbo].[patient_insurances]    Script Date: 11/24/2022 12:59:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[patient_insurances](
	[PatInsID] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NULL,
	[ins_seq] [smallint] NULL,
	[insurance_no] [int] NULL,
	[ins_group_no] [smallint] NULL,
	[insured_type] [smallint] NULL,
	[insured_no] [int] NULL,
	[ins_copay] [float] NULL,
	[ins_copay_type] [bit] NULL,
	[relation_to_insured] [int] NULL,
	[residence_type] [int] NULL,
	[ppo_hmo] [int] NULL,
	[data_count] [int] NULL,
	[policy_type] [int] NULL,
	[insurance_status] [bit] NULL,
	[Box9OnHCFA] [bit] NULL,
	[deceased] [smallint] NULL,
	[insured_retired] [smallint] NULL,
	[insured_spouse_retired] [smallint] NULL,
	[Inactive] [bit] NULL,
	[Notes] [ntext] NULL,
	[ExtInsID] [nvarchar](20) NULL,
	[Auth_code] [nvarchar](20) NULL,
	[Auth_date] [datetime] NULL,
	[insured_id] [nvarchar](255) NULL,
	[policy_group_no] [nvarchar](29) NULL,
	[ExtInsSetID] [nvarchar](50) NULL,
	[AssumedCareDate] [datetime] NULL,
	[RelinquishedCareDate] [datetime] NULL,
	[Rep_Category1] [nvarchar](2) NULL,
	[Rep_Category2] [nvarchar](2) NULL,
	[Rep_Category3] [nvarchar](2) NULL,
	[Cond_ind1] [nvarchar](2) NULL,
	[Cond_ind2] [nvarchar](2) NULL,
	[Cond_ind3] [nvarchar](2) NULL,
	[Rep_Box32] [bit] NULL,
	[Rep_FacNm] [nvarchar](40) NULL,
	[Rep_Address] [nvarchar](40) NULL,
	[Rep_City] [nvarchar](40) NULL,
	[Rep_State] [smallint] NULL,
	[Rep_Zip] [nvarchar](10) NULL,
	[Rep_NPINum] [nvarchar](17) NULL,
	[Pat_Ref_phy] [int] NULL,
	[SurgeryDate1] [datetime] NULL,
	[SurgeryDate2] [datetime] NULL,
	[Rep_Address2] [nvarchar](40) NULL,
	[Rep_Qualifier] [int] NULL,
	[ref_dt] [datetime] NULL,
	[Rep_FacID] [nvarchar](14) NULL,
	[VisionPlan] [bit] NULL,
	[ConsumerID] [nvarchar](50) NULL,
	[SubscriberConsumerID] [nvarchar](50) NULL,
 CONSTRAINT [PK_patient_insurances] PRIMARY KEY CLUSTERED 
(
	[PatInsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__patie__74AE54BC]  DEFAULT ((0)) FOR [patient_no]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__ins_s__75A278F5]  DEFAULT ((1)) FOR [ins_seq]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__insur__76969D2E]  DEFAULT ((0)) FOR [insurance_no]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__ins_g__778AC167]  DEFAULT ((0)) FOR [ins_group_no]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__insur__787EE5A0]  DEFAULT ((0)) FOR [insured_type]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__insur__797309D9]  DEFAULT ((0)) FOR [insured_no]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__ins_c__7A672E12]  DEFAULT ((0)) FOR [ins_copay]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__ins_c__7B5B524B]  DEFAULT ((0)) FOR [ins_copay_type]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__relat__7C4F7684]  DEFAULT ((0)) FOR [relation_to_insured]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__resid__7D439ABD]  DEFAULT ((0)) FOR [residence_type]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__ppo_h__7F2BE32F]  DEFAULT ((0)) FOR [ppo_hmo]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__data___02084FDA]  DEFAULT ((0)) FOR [data_count]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__insur__02FC7413]  DEFAULT ((0)) FOR [insurance_status]
GO

ALTER TABLE [dbo].[patient_insurances] ADD  CONSTRAINT [DF__patient_i__Box9O__03F0984C]  DEFAULT ((0)) FOR [Box9OnHCFA]
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'patient number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patient_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'patient_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'patient_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=primary, 2=secondary, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ins_seq' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ins_seq' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_seq'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Insurance number (insurance table)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Insurance group number (insurance group table)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ins_group_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ins_group_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_group_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=patient, 1=guarantor, 2=Other (required address Record)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insured_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insured_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_type'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Insurred number when the insurred is other (address table)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insured_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insured_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insured_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Patient''s co payment amount or percent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ins_copay' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ins_copay' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'True=amount, false=percent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ins_copay_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ins_copay_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ins_copay_type'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'what is the patient relation to the insured' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'relation_to_insured' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'relation_to_insured' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'relation_to_insured'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'comes from the code table (category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'residence_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'residence_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'residence_type'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'is this a ppo or hmo?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'ppo_hmo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'ppo_hmo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'ppo_hmo'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Added 3-30-98 because we found this field in some of the client''s 16-bit data files. Adding it here accomodates conversion.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'data_count' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'data_count' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'data_count'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'policy_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'policy_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'policy_type'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'21' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_status' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'insurance_status'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yes= Load insurance as secondary insurance(Box 9)  on the HCFA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Box9OnHCFA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'22' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Box9OnHCFA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances', @level2type=N'COLUMN',@level2name=N'Box9OnHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances'
GO

EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'08/25/1997 4:57:09 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances'
GO

EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'04/21/2005 2:42:04 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patient_insurances' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances'
GO

EXEC sys.sp_addextendedproperty @name=N'OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances'
GO

EXEC sys.sp_addextendedproperty @name=N'Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances'
GO

EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances'
GO

EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient_insurances'
GO

