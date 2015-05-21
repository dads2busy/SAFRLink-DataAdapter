/*******************************************************************/
/** SSMS Script for Installing DataAdapter V2 database tables     **/
/**      This installs from nothing, if you already have V1       **/
/**      already installed use V2_UpdateScript.sql                **/
/**                                                               **/
/** SSMS INSTRUCTIONS:                                            **/
/**    ==> Load this script:    File | Open | File ...            **/
/**    ==> Turn SQLCMD mode ON: Query | SQLCMD Mode               **/
/**    ==> Execute button.                                        **/
/**                                                               **/
/*******************************************************************/

USE [Z_UR_Expose]
GO

/****** DROP THE DATAADAPTER SCHEMA IF IT EXISTS  ******/
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

SET ANSI_PADDING OFF
GO
/***************** Add new reduced/hashed tables REDUCED_DGL1 ****************/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATAADAPTER].[REDUCED_DGL1]') AND type in (N'U'))
BEGIN
DROP TABLE [DATAADAPTER].[REDUCED_DGL1]
END
GO
CREATE TABLE [DATAADAPTER].[REDUCED_DGL1](
    [UEID]           INTEGER          NOT NULL,
    [INTERNAL_ID]    [varchar](100)   NOT NULL,
    [FIRST_NAME]     [varchar](100)   NULL,
    [MIDDLE_NAMES]   [varchar](255)   NULL,
    [LAST_NAME]      [varchar](100)   NOT NULL,
    [GENDER]         [varchar](100)   NULL,
    [DOB_MONTH]      [varchar](100)   NULL,
    [DOB_DAY]        [varchar](100)   NULL,
    [DOB_YEAR]       [varchar](100)   NULL,
    [DOB_MONTH_YEAR] [varchar](100)   NULL,	
    [FIPS_STATE]     [varchar](100)   NULL,
    [FIPS_COUNTY]    [varchar](100)   NULL,
    [FIPS_5]         [varchar](100)   NULL,	
    [ZIP_5]          [varchar](100)   NULL,
    [RECORD_DATE]    [datetime]       NULL,
    [MATCH_ID_1]     [varchar](100)   NULL,
    [MATCH_ID_2]     [varchar](100)   NULL,
    [MATCH_ID_3]     [varchar](100)   NULL,
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [NDX_DGL1_INTERNAL_ID] ON [DATAADAPTER].[REDUCED_DGL1] ([INTERNAL_ID] ASC)
   WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO    

/***************** Add new reduced/hashed tables REDUCED_DGL2 ****************/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[DATAADAPTER].[REDUCED_DGL2]') AND type in (N'U'))
BEGIN
DROP TABLE [DATAADAPTER].[REDUCED_DGL2]
END
GO
CREATE TABLE [DATAADAPTER].[REDUCED_DGL2](
    [UEID]           INTEGER          NOT NULL,
    [INTERNAL_ID]    [varchar](100)   NOT NULL,
    [FIRST_NAME]     [varchar](100)   NULL,
    [MIDDLE_NAMES]   [varchar](255)   NULL,
    [LAST_NAME]      [varchar](100)   NOT NULL,
    [GENDER]         [varchar](100)   NULL,
    [DOB_MONTH]      [varchar](100)   NULL,
    [DOB_DAY]        [varchar](100)   NULL,
    [DOB_YEAR]       [varchar](100)   NULL,
    [DOB_MONTH_YEAR] [varchar](100)   NULL,	
    [FIPS_STATE]     [varchar](100)   NULL,
    [FIPS_COUNTY]    [varchar](100)   NULL,
    [FIPS_5]         [varchar](100)   NULL,	
    [ZIP_5]          [varchar](100)   NULL,
    [RECORD_DATE]    [datetime]       NULL,
    [MATCH_ID_1]     [varchar](100)   NULL,
    [MATCH_ID_2]     [varchar](100)   NULL,
    [MATCH_ID_3]     [varchar](100)   NULL,
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [NDX_DGL2_INTERNAL_ID] ON [DATAADAPTER].[REDUCED_DGL2] ([INTERNAL_ID] ASC)
   WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) 
GO    

