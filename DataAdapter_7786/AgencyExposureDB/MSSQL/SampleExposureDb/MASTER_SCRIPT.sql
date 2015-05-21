/*******************************************************************/
/** EXECUTE THIS SCRIPT IN SSMS WITH QUERY MENU -> SQLCMD MODE ON **/
/** (ON DEVELOPMENT MACHINES, THIS TAKES LESS THAN A MINUTE)      **/
/*******************************************************************/

/** CHANGE THE LOC VAR TO THE SCRIPT DIRECTORY**/
:SETVAR LOC "C:\Work\Tools\LocalExposureTestDb\TestSets\VERSION2\MSSQL\"

/** UNCOMMENT THE FOLLOWING TWO LINES TO LET THIS SCRIPT CREATE THE LEXICON DATABASE **/
/** INFRASTRUCTURE TEAM WILL MANUALLY CREATE THE VLDS_LEXICON DATABASE TO AVOID ERRORS EFFECTING THE MASTER DB **/
/** ASSUMES a dbo schema already exists                                                                        **/
:r $(LOC)CREATE_TEST_TABLES.sql
:r $(LOC)LOAD_TEST_DATA.sql

