/***************   Script Date: 2/06/2013   *********/
USE [Z_UR_Expose]

/****************************************************/
/****************************************************/
/****** Object:  Table [dbo].[VALID_VALUES]    ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VALID_VALUES]') AND type in (N'U'))
DROP TABLE [dbo].[VALID_VALUES]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO


CREATE TABLE [dbo].[VALID_VALUES](
	[TABLE_NAME] [varchar](100) NOT NULL,
	[COLUMN_NAME] [varchar](100) NOT NULL,
	[VALUE] [varchar](500) NOT NULL,
	[DESCRIPTION] [varchar](2000) NOT NULL,
        [VALID_USE_BEGIN_DATE] [date] NOT NULL,
        [VALID_USE_END_DATE] [date] NULL,
	[LAST_UPDATE] [datetime] NOT NULL,
 CONSTRAINT [PK_VALID_VALUES] PRIMARY KEY CLUSTERED 
(
	[TABLE_NAME] ASC,
	[COLUMN_NAME] ASC,
	[VALUE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****************************************************/
/****************************************************/
/****** Object:  Table [dbo].[TABLE_METADATA]  ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TABLE_METADATA]') AND type in (N'U'))
DROP TABLE [dbo].[TABLE_METADATA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TABLE_METADATA](
	[TABLE_NAME] [varchar](45) NOT NULL,
	[FRIENDLY_NAME] [varchar](45) NOT NULL,
	[MS_DESCRIPTION] [varchar](2000) NOT NULL,
	[CRITICAL_CHANGES] [varchar](4000) NOT NULL,
	[LAST_UPDATE] [datetime] NOT NULL,
 CONSTRAINT [PK_TABLE_METADATA] PRIMARY KEY CLUSTERED 
(
	[TABLE_NAME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[COLUMN_METADATA_CK1]') AND parent_object_id = OBJECT_ID(N'[dbo].[COLUMN_METADATA]'))
ALTER TABLE [dbo].[COLUMN_METADATA] DROP CONSTRAINT [COLUMN_METADATA_CK1]
GO


/****************************************************/
/****************************************************/
/****** Object:  Table [dbo].[COLUMN_METADATA] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[COLUMN_METADATA]') AND type in (N'U'))
DROP TABLE [dbo].[COLUMN_METADATA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[COLUMN_METADATA](
	[TABLE_NAME] [varchar](45) NOT NULL,
	[COLUMN_NAME] [varchar](45) NOT NULL,
	[FRIENDLY_NAME] [varchar](45) NOT NULL,
	[MS_DESCRIPTION] [varchar](2000) NOT NULL,
	[CRITICAL_CHANGES] [varchar](4000) NULL,
	[DATA_DOMAIN] [varchar](200) NULL,
	[JOIN_ONLY] [char](5) NOT NULL,
	[VALID_USE_BEGIN_DATE] [date] NOT NULL,
	[VALID_USE_END_DATE] [date] NULL,
	[LAST_UPDATE] [datetime] NOT NULL,
 CONSTRAINT [PK_COLUMN_METADATA] PRIMARY KEY CLUSTERED 
(
	[TABLE_NAME] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[COLUMN_METADATA]  WITH CHECK ADD  CONSTRAINT [COLUMN_METADATA_CK1] CHECK  (([JOIN_ONLY]='false' OR [JOIN_ONLY]='true'))
GO

ALTER TABLE [dbo].[COLUMN_METADATA] CHECK CONSTRAINT [COLUMN_METADATA_CK1]
GO



/****************************************************/
/****************************************************/
/****** Object:  Table [dbo].[DEMOGRAPHIC_LOG] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DEMOGRAPHIC_LOG]') AND type in (N'U'))
DROP TABLE [dbo].[DEMOGRAPHIC_LOG]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DEMOGRAPHIC_LOG](
        [INTERNAL_ID] [varchar](50) NOT NULL,
        [FIRST_NAME] [varchar](50) NULL,
        [MIDDLE_NAMES] [varchar](255) NULL,
        [LAST_NAME] [varchar](50) NOT NULL,
        [GENDER] [char](1) NULL,
        [DOB_MONTH] [char](2) NULL,
        [DOB_DAY] [char](2) NULL,
        [DOB_YEAR] [char](4) NULL,
        [FIPS_STATE] [char](2) NULL,
        [FIPS_COUNTY] [char](3) NULL,
        [ZIP_5] [char](5) NULL,
        [RECORD_DATE] [datetime] NULL,
        [MATCH_ID_1] [varchar](50) NULL,
        [MATCH_ID_2] [varchar](50) NULL,
        [MATCH_ID_3] [varchar](50) NULL,
        ) ON [PRIMARY]
GO

CREATE CLUSTERED INDEX [NDX_INTERNAL_ID] ON [dbo].[DEMOGRAPHIC_LOG] ([INTERNAL_ID] ASC)
   WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
        



SET ANSI_PADDING OFF
GO


/****************************************************/
/****************************************************/
/****** Object:  Table [dbo].[REDUCED_DGL1] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REDUCED_DGL1]') AND type in (N'U'))
DROP TABLE [dbo].[REREDUCED_DGL1]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [DATAADAPTER].[REDUCED_DGL1](
        [INTERNAL_ID] [varchar](100)  NOT NULL,
		[UEID] INTEGER                NULL,
        [FIRST_NAME] [varchar](100)   NULL,
        [MIDDLE_NAMES] [varchar](255) NULL,
        [LAST_NAME] [varchar](100)    NOT NULL,
        [GENDER] [varchar](100)       NULL,
        [DOB_MONTH] [varchar](100)    NULL,
        [DOB_DAY] [varchar](100)      NULL,
        [DOB_YEAR] [varchar](100)     NULL,
		[DOB_MONTH_YEAR] [varchar](100) null,
        [FIPS_STATE] [varchar](100)   NULL,
        [FIPS_COUNTY] [varchar](100)  NULL,
		[FIPS_5] [varchar](100)       NULL,
        [ZIP_5] [varchar](100)        NULL,
        [RECORD_DATE] [datetime]      NULL,
        [MATCH_ID_1] [varchar](100)   NULL,
        [MATCH_ID_2] [varchar](100)   NULL,
        [MATCH_ID_3] [varchar](100)   NULL,
        ) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****************************************************/
/****************************************************/
/****** Object:  Table [dbo].[REDUCED_DGL2] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REDUCED_DGL2]') AND type in (N'U'))
DROP TABLE [dbo].[REREDUCED_DGL2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [DATAADAPTER].[REDUCED_DGL2](
        [INTERNAL_ID] [varchar](100)  NOT NULL,
		[UEID] INTEGER            NULL,
        [FIRST_NAME] [varchar](100)   NULL,
        [MIDDLE_NAMES] [varchar](255) NULL,
        [LAST_NAME] [varchar](100)    NOT NULL,
        [GENDER] [varchar](100)       NULL,
        [DOB_MONTH] [varchar](100)    NULL,
        [DOB_DAY] [varchar](100)      NULL,
        [DOB_YEAR] [varchar](100)     NULL,
		[DOB_MONTH_YEAR] [varchar](100) null,
        [FIPS_STATE] [varchar](100)   NULL,
        [FIPS_COUNTY] [varchar](100)  NULL,
		[FIPS_5] [varchar](100)       NULL,
        [ZIP_5] [varchar](100)        NULL,
        [RECORD_DATE] [datetime]      NULL,
        [MATCH_ID_1] [varchar](100)   NULL,
        [MATCH_ID_2] [varchar](100)   NULL,
        [MATCH_ID_3] [varchar](100)   NULL,
        ) ON [PRIMARY]
GO

SET ANSI_PADDING OFF
GO

	