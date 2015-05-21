/***************** Add new reduced/hashed tables REDUCED_DGL1 ****************/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATAADAPTER].[REDUCED_DGL1]') AND type in (N'U'))
BEGIN
DROP TABLE [DATAADAPTER].[REDUCED_DGL1]
END
GO
CREATE TABLE [DATAADAPTER].[REDUCED_DGL1](
        [PK_DGL] BIGINT identity(1,1),
        [INTERNAL_ID] [varchar](100)  NOT NULL,
        [FIRST_NAME] [varchar](100)   NULL,
        [MIDDLE_NAMES] [varchar](255) NULL,
        [LAST_NAME] [varchar](100)    NOT NULL,
        [GENDER] [varchar](100)       NULL,
        [DOB_MONTH] [varchar](100)    NULL,
        [DOB_DAY] [varchar](100)      NULL,
        [DOB_YEAR] [varchar](100)     NULL,
        [FIPS_STATE] [varchar](100)   NULL,
        [FIPS_COUNTY] [varchar](100)  NULL,
        [ZIP_5] [varchar](100)        NULL,
        [RECORD_DATE] [datetime]      NULL,
        [MATCH_ID_1] [varchar](100)   NULL,
        [MATCH_ID_2] [varchar](100)   NULL,
        [MATCH_ID_3] [varchar](100)   NULL,
        ) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [NDX_DGL1_INTERNAL_ID] ON [DATAADAPTER].[REDUCED_DGL1] ([INTERNAL_ID] ASC)
   WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO    
ALTER TABLE [DATAADAPTER].[REDUCED_DGL1] ADD CONSTRAINT PK_DGL1 PRIMARY KEY(PK_DGL)
GO

/***************** Add new reduced/hashed tables REDUCED_DGL2 ****************/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATAADAPTER].[REDUCED_DGL2]') AND type in (N'U'))
BEGIN
DROP TABLE [DATAADAPTER].[REDUCED_DGL2]
END
GO
CREATE TABLE [DATAADAPTER].[REDUCED_DGL2](
        [PK_DGL] BIGINT identity(1,1),
        [INTERNAL_ID] [varchar](100)  NOT NULL,
        [FIRST_NAME] [varchar](100)   NULL,
        [MIDDLE_NAMES] [varchar](255) NULL,
        [LAST_NAME] [varchar](100)    NOT NULL,
        [GENDER] [varchar](100)       NULL,
        [DOB_MONTH] [varchar](100)    NULL,
        [DOB_DAY] [varchar](100)      NULL,
        [DOB_YEAR] [varchar](100)     NULL,
        [FIPS_STATE] [varchar](100)   NULL,
        [FIPS_COUNTY] [varchar](100)  NULL,
        [ZIP_5] [varchar](100)        NULL,
        [RECORD_DATE] [datetime]      NULL,
        [MATCH_ID_1] [varchar](100)   NULL,
        [MATCH_ID_2] [varchar](100)   NULL,
        [MATCH_ID_3] [varchar](100)   NULL,
        ) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [NDX_DGL2_INTERNAL_ID] ON [DATAADAPTER].[REDUCED_DGL2] ([INTERNAL_ID] ASC)
   WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO    
ALTER TABLE [DATAADAPTER].[REDUCED_DGL2] ADD CONSTRAINT PK_DGL2 PRIMARY KEY(PK_DGL)
GO