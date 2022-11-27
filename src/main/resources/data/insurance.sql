USE [OMSQLDB]
GO

/****** Object:  Table [dbo].[insurance]    Script Date: 11/19/2022 11:57:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[insurance](
	[insurance_no] [int] IDENTITY(1,1) NOT NULL,
	[insurance_name] [nvarchar](40) NULL,
	[insurance_address1] [nvarchar](40) NULL,
	[insurance_address2] [nvarchar](40) NULL,
	[insurance_city] [nvarchar](30) NULL,
	[state_cd] [smallint] NULL,
	[insurance_zip_cd] [nvarchar](10) NULL,
	[insurance_phone_no] [nvarchar](20) NULL,
	[insurance_fax_no] [nvarchar](20) NULL,
	[insurance_contact] [nvarchar](30) NULL,
	[insurance_account_no] [nvarchar](10) NULL,
	[signature_onfile_allowed] [bit] NULL,
	[print_address_on_form] [bit] NULL,
	[payer_id] [nvarchar](15) NULL,
	[receiver_id] [smallint] NULL,
	[payer_sub_id] [nvarchar](20) NULL,
	[claim_receiver_type] [int] NULL,
	[print_diag_or_ref] [bit] NULL,
	[print_date_service_from_to] [bit] NULL,
	[claim_form_use] [nvarchar](50) NULL,
	[pay_sales_tax] [bit] NULL,
	[insurance_type] [smallint] NULL,
	[payment_policy] [nvarchar](30) NULL,
	[insurance_coverage] [real] NULL,
	[supper_box10] [nvarchar](1) NULL,
	[supper_box9c] [bit] NULL,
	[supper_box11] [bit] NULL,
	[supper_box14] [bit] NULL,
	[supper_box24c] [bit] NULL,
	[supper_box24k] [bit] NULL,
	[recall_month] [smallint] NULL,
	[benefit_reserve] [real] NULL,
	[case_allowance] [real] NULL,
	[sales_tax_reimberse] [real] NULL,
	[rounding] [bit] NULL,
	[carrier_no] [int] NULL,
	[HCFA_Template] [nvarchar](10) NULL,
	[accept_elect_claim] [bit] NULL,
	[HCFA_PrintAddr] [bit] NULL,
	[payor_commid] [nvarchar](5) NULL,
	[payor_commsub] [nvarchar](4) NULL,
	[LoadBox32onHCFA] [bit] NULL,
	[Load4Modifiers] [bit] NULL,
	[ExtInsID] [nvarchar](20) NULL,
	[useCMS1500Only] [bit] NULL,
	[AcceptAssign] [bit] NULL,
	[HL7HoldForDelivery] [bit] NULL,
	[Combine_CPT] [bit] NULL,
	[Box25_Type] [int] NULL,
	[TaxCopay] [bit] NULL,
	[ElgWebAddress] [nvarchar](150) NULL,
	[Acc_Mod_CB] [bit] NULL,
	[Acc_Mod_Other] [bit] NULL,
	[Other_Mod_CB] [bit] NULL,
	[Other_Mod_Other] [bit] NULL,
	[CL_Mod_CB] [bit] NULL,
	[CL_Mod_Type] [bit] NULL,
	[CL_Mod_Other] [bit] NULL,
	[Frame_Mod_CB] [bit] NULL,
	[Frame_Mod_Option] [bit] NULL,
	[Opt_Mod_CB] [bit] NULL,
	[Opt_Mod_LT] [bit] NULL,
	[Opt_Mod_Material] [bit] NULL,
	[Opt_Mod_Color] [bit] NULL,
	[Opt_Mod_Other] [bit] NULL,
	[Opt_Mod_CB_UseRTLT] [bit] NULL,
	[LensTreat_Mod_CB] [bit] NULL,
	[LensTreat_Mod_Other] [bit] NULL,
	[Ready_Mod_CB] [bit] NULL,
	[Ready_Mod_Other] [bit] NULL,
	[Service_Mod_CB] [bit] NULL,
	[Service_Mod_Type] [bit] NULL,
	[Service_Mod_Other] [bit] NULL,
	[Plano_Mod_CB] [bit] NULL,
	[Plano_Mod_Option] [bit] NULL,
	[Attn] [nvarchar](30) NULL,
	[Job_Title] [nvarchar](30) NULL,
	[Contact_Phone] [nvarchar](20) NULL,
	[Contact_Email] [nvarchar](50) NULL,
	[PopulateBox9D] [bit] NULL,
	[AutoPopulateBox17] [bit] NULL,
	[TransAmtOnHCFA] [bit] NULL,
	[ActivationDate] [datetime] NULL,
	[RevisionDate] [datetime] NULL,
	[TerminationDate] [datetime] NULL,
	[BillSTtoPatient] [bit] NULL,
	[DisplaySTonHCFA] [bit] NULL,
	[HCFAOptForST] [int] NULL,
	[TaxOnlyPatient] [bit] NULL,
	[InsNotes] [ntext] NULL,
	[OutputFormat] [int] NULL,
	[Opt_Mod_LT_UseRTLT] [bit] NULL,
	[Opt_Mod_Material_UseRTLT] [bit] NULL,
	[Opt_Mod_Color_UseRTLT] [bit] NULL,
	[Opt_Mod_Other_UseRTLT] [bit] NULL,
	[Ins_PPO_HMO] [int] NULL,
	[Ins_Policy_Type] [int] NULL,
	[PatientPaymentOnClaim] [bit] NULL,
	[PatientPrimaryPaymentOnClaim] [bit] NULL,
	[PopulateBox17BillProvider] [bit] NULL,
	[TaxMinusWO] [bit] NULL,
	[applyPQRI] [bit] NULL,
	[brief_name] [nvarchar](10) NULL,
	[DefaultValueFromVSPAssistant] [bit] NULL,
	[OriginalVSP] [bit] NULL,
	[ICD10_Start_Date] [datetime] NULL,
	[TaxIDOnStatement] [bit] NULL,
 CONSTRAINT [aaaaainsurance_PK] PRIMARY KEY CLUSTERED 
(
	[insurance_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__state__4A38F803]  DEFAULT ((0)) FOR [state_cd]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__signa__4B2D1C3C]  DEFAULT ((0)) FOR [signature_onfile_allowed]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__print__4C214075]  DEFAULT ((0)) FOR [print_address_on_form]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__recei__4D1564AE]  DEFAULT ((0)) FOR [receiver_id]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__claim__4E0988E7]  DEFAULT ((0)) FOR [claim_receiver_type]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__print__4EFDAD20]  DEFAULT ((0)) FOR [print_diag_or_ref]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__print__4FF1D159]  DEFAULT ((0)) FOR [print_date_service_from_to]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__pay_s__50E5F592]  DEFAULT ((0)) FOR [pay_sales_tax]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__insur__51DA19CB]  DEFAULT ((0)) FOR [insurance_type]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__insur__52CE3E04]  DEFAULT ((0)) FOR [insurance_coverage]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__suppe__53C2623D]  DEFAULT ((0)) FOR [supper_box9c]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__suppe__54B68676]  DEFAULT ((0)) FOR [supper_box11]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__suppe__55AAAAAF]  DEFAULT ((0)) FOR [supper_box14]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__suppe__569ECEE8]  DEFAULT ((0)) FOR [supper_box24c]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__suppe__5792F321]  DEFAULT ((0)) FOR [supper_box24k]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__recal__5887175A]  DEFAULT ((0)) FOR [recall_month]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__benef__597B3B93]  DEFAULT ((0)) FOR [benefit_reserve]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__case___5A6F5FCC]  DEFAULT ((0)) FOR [case_allowance]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__sales__5B638405]  DEFAULT ((0)) FOR [sales_tax_reimberse]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__round__5C57A83E]  DEFAULT ((0)) FOR [rounding]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__accep__5D4BCC77]  DEFAULT ((0)) FOR [accept_elect_claim]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__HCFA___5E3FF0B0]  DEFAULT ((0)) FOR [HCFA_PrintAddr]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__LoadB__5F3414E9]  DEFAULT ((0)) FOR [LoadBox32onHCFA]
GO

ALTER TABLE [dbo].[insurance] ADD  CONSTRAINT [DF__insurance__Load4__60283922]  DEFAULT ((0)) FOR [Load4Modifiers]
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'40' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_name'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_address1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'40' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_address1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address1'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_address2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'40' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_address2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_address2'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_city'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'state_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'state_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'state_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_zip_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_zip_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_zip_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_phone_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_phone_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_phone_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_fax_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_fax_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_fax_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_contact' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_contact' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_contact'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_account_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_account_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_account_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'signature_onfile_allowed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'signature_onfile_allowed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'signature_onfile_allowed'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'print_address_on_form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'print_address_on_form' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_address_on_form'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'payer_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'payer_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_id'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'receiver_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'receiver_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'receiver_id'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'payer_sub_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'payer_sub_id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payer_sub_id'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'claim_receiver_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'16' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'claim_receiver_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_receiver_type'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'print_diag_or_ref' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'print_diag_or_ref' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_diag_or_ref'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'print_date_service_from_to' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'18' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'print_date_service_from_to' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'print_date_service_from_to'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'claim_form_use' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'19' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'claim_form_use' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'claim_form_use'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'pay_sales_tax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'pay_sales_tax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'pay_sales_tax'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'21' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_type'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'payment_policy' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'22' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'payment_policy' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payment_policy'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance_coverage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'23' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'insurance_coverage' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'insurance_coverage'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'supper_box10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'24' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'supper_box10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box10'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'supper_box9c' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'25' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'supper_box9c' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box9c'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'supper_box11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'26' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'supper_box11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box11'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'supper_box14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'27' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'supper_box14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box14'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'supper_box24c' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'28' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'supper_box24c' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24c'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'supper_box24k' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'29' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'supper_box24k' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'supper_box24k'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'recall_month' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'recall_month' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'recall_month'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'benefit_reserve' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'31' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'benefit_reserve' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'benefit_reserve'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'case_allowance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'32' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'case_allowance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'case_allowance'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'sales_tax_reimberse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'33' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'sales_tax_reimberse' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'sales_tax_reimberse'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'rounding' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'34' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'rounding' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'rounding'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'carrier_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'35' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'carrier_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'carrier_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'HCFA_Template' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'36' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'HCFA_Template' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_Template'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'accept_elect_claim' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'37' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'accept_elect_claim' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'accept_elect_claim'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'HCFA_PrintAddr' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'38' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'HCFA_PrintAddr' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'HCFA_PrintAddr'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insurance commercial Payor Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'payor_commid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'39' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'payor_commid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commid'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'insurance commercial Payor sub id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'payor_commsub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'40' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'payor_commsub' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'payor_commsub'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Load box 32 on HCFA with the business address.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'LoadBox32onHCFA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'41' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'LoadBox32onHCFA' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'LoadBox32onHCFA'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Load 4 modifiers on HCFA Box 24D' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'Load4Modifiers' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'42' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'Load4Modifiers' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance', @level2type=N'COLUMN',@level2name=N'Load4Modifiers'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance'
GO

EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'08/25/1997 4:57:06 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance'
GO

EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'04/12/2006 10:21:23 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'insurance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance'
GO

EXEC sys.sp_addextendedproperty @name=N'OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance'
GO

EXEC sys.sp_addextendedproperty @name=N'Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance'
GO

EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance'
GO

EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'insurance'
GO

