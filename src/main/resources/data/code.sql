USE [OMSQLDB]
GO

/****** Object:  Table [dbo].[code]    Script Date: 11/27/2022 11:32:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[code](
	[code_category_cd] [smallint] NULL,
	[code] [int] IDENTITY(1,1) NOT NULL,
	[user_code] [nvarchar](15) NULL,
	[code_removed] [bit] NULL,
	[code_default] [bit] NULL,
	[code_calc] [smallint] NULL,
	[system_code] [bit] NULL,
	[code_dev] [int] NULL,
	[rje_code] [nvarchar](10) NULL,
	[VSP_Code] [nvarchar](50) NULL,
	[VSP_CODE_Category] [int] NULL,
	[VSP_Code_desc] [nvarchar](100) NULL,
	[Warntime1] [int] NULL,
	[Warntime2] [int] NULL,
	[CDA_Code] [nvarchar](255) NULL,
	[CDA_Code_Description] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[DoNotShow] [bit] NULL,
 CONSTRAINT [aaaaacode_PK] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[code] ADD  CONSTRAINT [DF__code__code_categ__3AD6B8E2]  DEFAULT ((0)) FOR [code_category_cd]
GO

ALTER TABLE [dbo].[code] ADD  CONSTRAINT [DF__code__code_remov__3BCADD1B]  DEFAULT ((0)) FOR [code_removed]
GO

ALTER TABLE [dbo].[code] ADD  CONSTRAINT [DF__code__code_defau__3CBF0154]  DEFAULT ((0)) FOR [code_default]
GO

ALTER TABLE [dbo].[code] ADD  CONSTRAINT [DF__code__code_calc__3DB3258D]  DEFAULT ((0)) FOR [code_calc]
GO

ALTER TABLE [dbo].[code] ADD  CONSTRAINT [DF__code__system_cod__3EA749C6]  DEFAULT ((0)) FOR [system_code]
GO

ALTER TABLE [dbo].[code] ADD  CONSTRAINT [DF__code__code_dev__3F9B6DFF]  DEFAULT ((0)) FOR [code_dev]
GO

ALTER TABLE [dbo].[code] ADD  CONSTRAINT [DF__code__VSP_CODE_C__408F9238]  DEFAULT ((0)) FOR [VSP_CODE_Category]
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1920' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'code category code (from the category table)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'code_category_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'code_category_cd' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_category_cd'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'780' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'code abbreviation' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'user_code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'user_code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'user_code'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1950' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yes = Removed, No = not removed  display on the list' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'code_removed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'code_removed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_removed'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1680' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Yes = default the code to the combo boxes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'code_default' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'code_default' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_default'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1755' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code calculation flag (defined by the developer as needed) (# 55, -1=months, 0=Weeks)(#56, -1=After, 0=Before)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'code_calc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'code_calc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_calc'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if true then this code can''t be edited or deleted ever by the user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'system_code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'system_code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'system_code'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1410' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Same number as the code. Insure that we can add more codes after the user add new at his location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'code_dev' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'code_dev' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'code_dev'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'RJE code for use as cross reference between the OfficeMate codes and RJE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'rje_code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'rje_code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'rje_code'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VSP Codes  - Cross Reference between Officemate and VSP catalog' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'VSP_Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'VSP_Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'vsp_catalog Sequence Number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'VSP_CODE_Category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'VSP_CODE_Category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_CODE_Category'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VSP catalog description (from the vsp Catalog table)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'VSP_Code_desc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'100' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'VSP_Code_desc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code', @level2type=N'COLUMN',@level2name=N'VSP_Code_desc'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'04/02/2001 11:20:05 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'04/25/2006 3:06:17 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Filter', @value=N'((code.code_category_cd=81))' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'OrderByOn', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'820' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code'
GO

EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'code'
GO

