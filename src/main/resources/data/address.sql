USE [OMSQLDB]
GO

/****** Object:  Table [dbo].[address]    Script Date: 11/23/2022 9:07:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[address](
	[address_no] [int] IDENTITY(1,1) NOT NULL,
	[address1] [nvarchar](255) NULL,
	[address2] [nvarchar](255) NULL,
	[city] [nvarchar](40) NULL,
	[state] [smallint] NULL,
	[zip] [nvarchar](10) NULL,
	[phone1] [nvarchar](255) NULL,
	[phone2] [nvarchar](255) NULL,
	[fax] [nvarchar](255) NULL,
	[wrong_address_flg] [bit] NULL,
	[previous_address1] [nvarchar](255) NULL,
	[previous_address2] [nvarchar](255) NULL,
	[previous_city] [nvarchar](40) NULL,
	[previous_state] [smallint] NULL,
	[previous_zip] [nvarchar](10) NULL,
	[update_dt] [datetime] NULL,
	[pa_update_dt] [datetime] NULL,
 CONSTRAINT [aaaaaaddress_PK] PRIMARY KEY CLUSTERED 
(
	[address_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[address] ADD  DEFAULT ((0)) FOR [state]
GO

ALTER TABLE [dbo].[address] ADD  DEFAULT ((0)) FOR [wrong_address_flg]
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'address code, from patient #, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'address_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'address_no' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address_no'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'address 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'address1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'40' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'address1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address1'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'address 2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'address2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'40' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'address2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'address2'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'city - BRING IN AUTOMATICALLY WHEN ZIPCODE ENTERED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'40' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'city'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'state_cd - BRING IN AUTOMATICALLY WHEN ZIPCODE ENTERED' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'state' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'state' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'state'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'zip / postal code - READ TABLE OF CITIES AND MOVE CITY AND STATE FROM ZIPCODE' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'zip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'zip' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'zip'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'phone number - BRING IN AREA CODE FROM TABLE OF CITIES' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'phone1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'phone1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone1'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Second phone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'phone2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'phone2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'phone2'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'fax number - BRING IN AREA CODE FROM TABLE OF CITIES' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'fax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'fax' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'fax'
GO

EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'true=address is worng, false=good current address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'True/False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'wrong_address_flg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'wrong_address_flg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address', @level2type=N'COLUMN',@level2name=N'wrong_address_flg'
GO

EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address'
GO

EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'08/25/1997 4:57:02 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address'
GO

EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'11/23/2004 11:49:05 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address'
GO

EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address'
GO

EXEC sys.sp_addextendedproperty @name=N'OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address'
GO

EXEC sys.sp_addextendedproperty @name=N'Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address'
GO

EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address'
GO

EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'address'
GO

