USE [Z_UR_Expose_VEC]
GO
/****** Object:  Table [dbo].[VLDS_ID_MAPPER]    Script Date: 11/04/2012 10:34:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VLDS_ID_MAPPER]') AND type in (N'U'))
DROP TABLE [dbo].[VLDS_ID_MAPPER]
GO
/****** Object:  Table [dbo].[VLDS_PERFORMANCE_JOIN]    Script Date: 11/04/2012 10:34:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VLDS_PERFORMANCE_JOIN]') AND type in (N'U'))
DROP TABLE [dbo].[VLDS_PERFORMANCE_JOIN]
GO

/****** Object:  Table [DATAADAPTER].[VLDS_ID_MAPPER]    Script Date: 11/04/2012 10:34:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATAADAPTER].[VLDS_ID_MAPPER]') AND type in (N'U'))
DROP TABLE [DATAADAPTER].[VLDS_ID_MAPPER]
GO
/****** Object:  Table [DATAADAPTER].[VLDS_PERFORMANCE_JOIN]    Script Date: 11/04/2012 10:34:17 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATAADAPTER].[VLDS_PERFORMANCE_JOIN]') AND type in (N'U'))
DROP TABLE [DATAADAPTER].[VLDS_PERFORMANCE_JOIN]
GO
/****** Object:  Schema [DATAADAPTER]    Script Date: 11/04/2012 10:34:17 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'DATAADAPTER')
DROP SCHEMA [DATAADAPTER]
GO
/****** Object:  Role [DataAdapter]    Script Date: 11/04/2012 10:34:17 ******/
DECLARE @RoleName sysname
set @RoleName = N'DataAdapter'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DataAdapter' AND type = 'R')
DROP ROLE [DataAdapter]
GO
/****** Object:  Role [DataAdapter]    Script Date: 11/04/2012 10:34:17 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'DataAdapter' AND type = 'R')
CREATE ROLE [DataAdapter] AUTHORIZATION [db_accessadmin]
GO

GRANT CREATE TABLE TO [DataAdapter]
GO

/****** Object:  Schema [DATAADAPTER]    Script Date: 11/04/2012 10:34:17 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'DATAADAPTER')
EXEC sys.sp_executesql N'CREATE SCHEMA [DATAADAPTER] AUTHORIZATION [DataAdapter]'
GO
/****** Object:  Table [DATAADAPTER].[VLDS_PERFORMANCE_JOIN]    Script Date: 11/04/2012 10:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATAADAPTER].[VLDS_PERFORMANCE_JOIN]') AND type in (N'U'))
BEGIN
CREATE TABLE [DATAADAPTER].[VLDS_PERFORMANCE_JOIN](
	[TABLE_NAME] [varchar](50) NOT NULL,
	[REQUEST_ID] [varchar](50) NOT NULL,
	[UNIQUE_ENTITY_ID] [bigint] NOT NULL,
	[DATE_CREATED] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_VLDS_PERFORMANCE_JOIN] PRIMARY KEY CLUSTERED 
(
	[TABLE_NAME] ASC,
	[REQUEST_ID] ASC,
	[UNIQUE_ENTITY_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [DATAADAPTER].[VLDS_ID_MAPPER]    Script Date: 11/04/2012 10:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATAADAPTER].[VLDS_ID_MAPPER]') AND type in (N'U'))
BEGIN
CREATE TABLE [DATAADAPTER].[VLDS_ID_MAPPER](
	[TABLE_NAME] [varchar](50) NOT NULL,
	[INTERNAL_ID] [varchar](50) NOT NULL,
	[UNIQUE_ENTITY_ID] [bigint] NOT NULL,
 CONSTRAINT [UK1_VLDS_ID_MAPPER] UNIQUE NONCLUSTERED 
(
	[TABLE_NAME] ASC,
	[INTERNAL_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UK2_VLDS_ID_MAPPER] UNIQUE NONCLUSTERED 
(
	[TABLE_NAME] ASC,
	[UNIQUE_ENTITY_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO

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

-- EXEC dbo.sp_addrolemember @rolename=N'DataAdapter', @membername=N'dataadapterTest'
-- GO
