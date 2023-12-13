USE [OMSQLDB]
GO

/****** Object:  Table [dbo].[provider]    Script Date: 11/19/2022 11:53:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[provider](
	[provider_no] [int] IDENTITY(1,1) NOT NULL,
	[provider_last_name] [nvarchar](20) NULL,
	[provider_first_name] [nvarchar](20) NULL,
	[provider_middle_initial] [nvarchar](20) NULL,
	[provider_phone] [nvarchar](40) NULL,
	[provider_fax] [nvarchar](20) NULL,
	[provider_license] [nvarchar](255) NULL,
	[provider_tax_id] [nvarchar](255) NULL,
	[provider_UPIN_no] [nvarchar](255) NULL,
	[provider_degrees] [nvarchar](30) NULL,
	[provider_TPA_no] [nvarchar](255) NULL,
	[provider_sub_id] [nvarchar](255) NULL,
	[provider_specialty] [int] NULL,
	[provider_pcid] [nvarchar](20) NULL,
	[provider_password] [nvarchar](255) NULL,
	[provider_business_cd] [int] NULL,
	[provider_business_type] [smallint] NULL,
	[provider_specialty_cd] [int] NULL,
	[provider_tax_type_cd] [int] NULL,
	[provider_type_cd] [int] NULL,
	[provider_signature] [image] NULL,
	[provider_signature_cd] [smallint] NULL,
	[provider_signature_date] [datetime] NULL,
	[provider_code] [nvarchar](3) NULL,
	[provider_reccomm] [bit] NULL,
	[provider_comm_method] [smallint] NULL,
	[provider_comm_rate] [float] NULL,
	[provider_spiff_amt] [money] NULL,
	[provider_active] [bit] NULL,
	[is_provider] [smallint] NULL,
	[access_all] [bit] NULL,
	[delete_patient] [bit] NULL,
	[record_fee_slip] [bit] NULL,
	[patient_creditcard] [bit] NULL,
	[print_reports] [bit] NULL,
	[setup_bus_cust_pref] [bit] NULL,
	[maintain_product] [bit] NULL,
	[record_receipt] [bit] NULL,
	[user_maint] [bit] NULL,
	[electronic_claims] [bit] NULL,
	[commission] [bit] NULL,
	[NPI_Num] [nvarchar](255) NULL,
	[EIN_Num] [nvarchar](255) NULL,
	[HIPAA_PrivacyOfficer] [bit] NULL,
	[HIPAA_PrivacyTrainingDate] [datetime] NULL,
	[Archive_data] [bit] NULL,
	[Inventory] [bit] NULL,
	[FormalSignature] [nvarchar](60) NULL,
	[SignatureGraphicLink] [nvarchar](255) NULL,
	[Patient_EMRExam] [bit] NULL,
	[provider_DEA_no] [nvarchar](255) NULL,
	[med_rx] [bit] NULL,
	[edit_text] [bit] NULL,
	[default_Location] [int] NULL,
	[HL7Provider] [nvarchar](50) NULL,
	[changeTemplates] [bit] NULL,
	[Cat1Security] [smallint] NULL,
	[Cat2Security] [smallint] NULL,
	[Cat3Security] [smallint] NULL,
	[Cat4Security] [smallint] NULL,
	[Cat5Security] [smallint] NULL,
	[Cat6Security] [smallint] NULL,
	[Cat7Security] [smallint] NULL,
	[Cat8Security] [smallint] NULL,
	[Cat9Security] [smallint] NULL,
	[Cat10Security] [smallint] NULL,
	[Cat11Security] [smallint] NULL,
	[CodeExam] [bit] NULL,
	[CloseExam] [bit] NULL,
	[PrintExam] [bit] NULL,
	[PrintAutoLetter] [bit] NULL,
	[AccessEDocs] [bit] NULL,
	[AccessCorresHx] [bit] NULL,
	[MaintainPatDemo] [smallint] NULL,
	[VSP_DocID] [nvarchar](255) NULL,
	[pro_schedule_ind] [bit] NULL,
	[RestrictLocation] [bit] NULL,
	[CloseOpenCharges] [bit] NULL,
	[AccessHomeOffice] [bit] NULL,
	[EndOfDay] [bit] NULL,
	[VoidFeeSlip] [bit] NULL,
	[DeletePayment] [bit] NULL,
	[recorded_by_computer] [nvarchar](255) NULL,
	[recorded_date] [datetime] NULL,
	[ChangeProdFee] [bit] NULL,
	[Redo] [bit] NULL,
	[PasswordedDiscounts] [bit] NULL,
	[Cat12Security] [smallint] NULL,
	[PrintRx] [bit] NULL,
	[Cat13Security] [smallint] NULL,
	[FullAccessTaskMgr] [bit] NULL,
	[OverridePayRestriction] [bit] NULL,
	[EditFeeslip] [bit] NULL,
	[EditBilledOrder] [bit] NULL,
	[AccessReportWriter] [bit] NULL,
	[EmergencyAccess] [bit] NULL,
	[provider_SS_no] [nvarchar](255) NULL,
	[provider_DPS] [nvarchar](255) NULL,
	[provider_EEHR_active] [bit] NOT NULL,
 CONSTRAINT [aaaaaprovider_PK] PRIMARY KEY CLUSTERED 
(
	[provider_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__provid__6442E2C9]  DEFAULT ((0)) FOR [provider_specialty]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__provid__65370702]  DEFAULT ((0)) FOR [provider_business_cd]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__provid__662B2B3B]  DEFAULT ((0)) FOR [provider_business_type]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__provid__671F4F74]  DEFAULT ((0)) FOR [provider_specialty_cd]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__provid__681373AD]  DEFAULT ((0)) FOR [provider_tax_type_cd]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__provid__690797E6]  DEFAULT ((0)) FOR [provider_type_cd]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__provid__69FBBC1F]  DEFAULT ((0)) FOR [provider_reccomm]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__provid__6AEFE058]  DEFAULT ((0)) FOR [provider_active]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__is_pro__6BE40491]  DEFAULT ((0)) FOR [is_provider]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__access__6CD828CA]  DEFAULT ((0)) FOR [access_all]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__delete__6DCC4D03]  DEFAULT ((0)) FOR [delete_patient]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__record__6EC0713C]  DEFAULT ((0)) FOR [record_fee_slip]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__patien__6FB49575]  DEFAULT ((0)) FOR [patient_creditcard]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__print___70A8B9AE]  DEFAULT ((0)) FOR [print_reports]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__setup___719CDDE7]  DEFAULT ((0)) FOR [setup_bus_cust_pref]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__mainta__72910220]  DEFAULT ((0)) FOR [maintain_product]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__record__73852659]  DEFAULT ((0)) FOR [record_receipt]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__user_m__74794A92]  DEFAULT ((0)) FOR [user_maint]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__electr__756D6ECB]  DEFAULT ((0)) FOR [electronic_claims]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__commis__76619304]  DEFAULT ((0)) FOR [commission]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__HIPAA___7755B73D]  DEFAULT ((0)) FOR [HIPAA_PrivacyOfficer]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Archiv__7849DB76]  DEFAULT ((0)) FOR [Archive_data]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Invent__793DFFAF]  DEFAULT ((0)) FOR [Inventory]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Patien__7A3223E8]  DEFAULT ((0)) FOR [Patient_EMRExam]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__med_rx__7B264821]  DEFAULT ((0)) FOR [med_rx]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__edit_t__7C1A6C5A]  DEFAULT ((0)) FOR [edit_text]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__defaul__7D0E9093]  DEFAULT ((0)) FOR [default_Location]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__change__7E02B4CC]  DEFAULT ((0)) FOR [changeTemplates]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat1Se__7EF6D905]  DEFAULT ((0)) FOR [Cat1Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat2Se__7FEAFD3E]  DEFAULT ((0)) FOR [Cat2Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat3Se__00DF2177]  DEFAULT ((0)) FOR [Cat3Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat4Se__01D345B0]  DEFAULT ((0)) FOR [Cat4Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat5Se__02C769E9]  DEFAULT ((0)) FOR [Cat5Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat6Se__03BB8E22]  DEFAULT ((0)) FOR [Cat6Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat7Se__04AFB25B]  DEFAULT ((0)) FOR [Cat7Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat8Se__05A3D694]  DEFAULT ((0)) FOR [Cat8Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat9Se__0697FACD]  DEFAULT ((0)) FOR [Cat9Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat10S__078C1F06]  DEFAULT ((0)) FOR [Cat10Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Cat11S__0880433F]  DEFAULT ((0)) FOR [Cat11Security]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__CodeEx__09746778]  DEFAULT ((0)) FOR [CodeExam]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__CloseE__0A688BB1]  DEFAULT ((0)) FOR [CloseExam]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__PrintE__0B5CAFEA]  DEFAULT ((0)) FOR [PrintExam]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__PrintA__0C50D423]  DEFAULT ((0)) FOR [PrintAutoLetter]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Access__0D44F85C]  DEFAULT ((0)) FOR [AccessEDocs]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Access__0E391C95]  DEFAULT ((0)) FOR [AccessCorresHx]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF__provider__Mainta__0F2D40CE]  DEFAULT ((0)) FOR [MaintainPatDemo]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [DF_provider_pro_schedule_ind]  DEFAULT ((0)) FOR [pro_schedule_ind]
GO

ALTER TABLE [dbo].[provider] ADD  DEFAULT ((1)) FOR [provider_EEHR_active]
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_last_name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_last_name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_last_name'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_first_name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_first_name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_first_name'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_middle_initial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_middle_initial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_middle_initial'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_phone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'40' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_phone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_phone'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_fax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_fax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_fax'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_license' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_license' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_license'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_tax_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_tax_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_id'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_UPIN_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_UPIN_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_UPIN_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_degrees' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_degrees' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_degrees'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_TPA_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_TPA_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_TPA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_sub_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_sub_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_specialty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_specialty' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_pcid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_pcid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_pcid'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_password' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_password' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_password'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_business_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_business_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_business_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_business_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_business_type'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_specialty_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_specialty_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_specialty_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_tax_type_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_tax_type_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_tax_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_type_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_type_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_type_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_signature' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_signature' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_signature_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'21' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_signature_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_signature_date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'22' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_signature_date' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_signature_date'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'23' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_code'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_reccomm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'24' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_reccomm' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_reccomm'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_comm_method' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'25' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_comm_method' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_method'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_comm_rate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'26' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_comm_rate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_comm_rate'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_spiff_amt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_spiff_amt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_spiff_amt'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'28' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_active' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_active'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'is_provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'29' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'is_provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'is_provider'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'access_all' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'access_all' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'access_all'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'delete_patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'31' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'delete_patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'delete_patient'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'record_fee_slip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'32' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'record_fee_slip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_fee_slip'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patient_creditcard' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'33' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'patient_creditcard' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'patient_creditcard'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'print_reports' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'34' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'print_reports' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'print_reports'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'setup_bus_cust_pref' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'35' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'setup_bus_cust_pref' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'setup_bus_cust_pref'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'maintain_product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'36' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'maintain_product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'maintain_product'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'record_receipt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'37' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'record_receipt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'record_receipt'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'user_maint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'38' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'user_maint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'user_maint'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'electronic_claims' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'39' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'electronic_claims' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'electronic_claims'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'commission' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'40' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'commission' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'commission'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'NPI_Num' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'41' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'NPI_Num' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'NPI_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'EIN_Num' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'42' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'EIN_Num' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'EIN_Num'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'HIPAA_PrivacyOfficer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'43' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'HIPAA_PrivacyOfficer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyOfficer'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1024' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'HIPAA_PrivacyTrainingDate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'44' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'HIPAA_PrivacyTrainingDate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HIPAA_PrivacyTrainingDate'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Archive_data' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'45' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Archive_data' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Archive_data'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Inventory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'46' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Inventory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Inventory'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'FormalSignature' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'47' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'60' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'FormalSignature' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'FormalSignature'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'SignatureGraphicLink' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'48' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'SignatureGraphicLink' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'SignatureGraphicLink'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Patient_EMRExam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'49' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Patient_EMRExam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Patient_EMRExam'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider_DEA_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provider_DEA_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'provider_DEA_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'med_rx' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'51' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'med_rx' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'med_rx'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'edit_text' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'52' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'edit_text' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'edit_text'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'default_Location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'53' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'default_Location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'default_Location'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'HL7Provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'54' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'HL7Provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'HL7Provider'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'changeTemplates' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'55' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'changeTemplates' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'changeTemplates'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat1Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'56' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat1Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat1Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat2Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'57' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat2Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat2Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat3Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'58' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat3Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat3Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat4Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'59' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat4Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat4Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat5Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'60' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat5Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat5Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat6Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'61' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat6Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat6Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat7Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'62' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat7Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat7Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat8Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'63' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat8Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat8Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat9Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'64' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat9Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat9Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat10Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'65' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat10Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat10Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Cat11Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'66' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Cat11Security' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'Cat11Security'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CodeExam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'67' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'CodeExam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CodeExam'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'CloseExam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'68' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'CloseExam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'CloseExam'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'PrintExam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'69' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'PrintExam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintExam'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'PrintAutoLetter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'70' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'PrintAutoLetter' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'PrintAutoLetter'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'AccessEDocs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'71' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'AccessEDocs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessEDocs'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'AccessCorresHx' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'72' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'AccessCorresHx' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'AccessCorresHx'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'MaintainPatDemo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'73' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'MaintainPatDemo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider', @level2type=N'COLUMN',@level2name=N'MaintainPatDemo'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider'
GO

EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'08/25/1997 4:57:12 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider'
GO

EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'10/17/2005 9:46:09 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provider' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider'
GO

EXEC sys.sp_addextendedproperty @name=N'OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider'
GO

EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider'
GO

EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'provider'
GO

