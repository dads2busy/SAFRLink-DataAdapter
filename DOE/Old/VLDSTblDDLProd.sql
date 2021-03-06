/*Login in with DATAAPTER user account and create the below tables; Please replace tablespace name for<<TableSpaceName>> */
CREATE TABLE VLDS_ID_MAPPER
(
  TABLE_NAME        VARCHAR2(50 BYTE),
  INTERNAL_ID       VARCHAR2(50 BYTE),
  UNIQUE_ENTITY_ID  INTEGER
)
TABLESPACE <<TableSpaceName>>
/
COMMENT ON TABLE VLDS_ID_MAPPER IS 'Used to map the internal ID in the demographic log to a unique entity ID created by VT.  This table will be periodically repopulated by the data adapter';

COMMENT ON COLUMN VLDS_ID_MAPPER.TABLE_NAME IS 'Name of the demographic log table in the exposure database';

COMMENT ON COLUMN VLDS_ID_MAPPER.INTERNAL_ID IS 'Demographic Log Internal ID';

COMMENT ON COLUMN VLDS_ID_MAPPER.UNIQUE_ENTITY_ID IS 'Random ID generated by VT';

CREATE UNIQUE INDEX VLDS_ID_MAPPER_UK1 ON VLDS_ID_MAPPER
(TABLE_NAME, INTERNAL_ID)
LOGGING
TABLESPACE <<TableSpaceName>>
/
CREATE UNIQUE INDEX VLDS_ID_MAPPER_UK2 ON VLDS_ID_MAPPER
(TABLE_NAME, UNIQUE_ENTITY_ID)
LOGGING
TABLESPACE <<TableSpaceName>>
/
CREATE TABLE VLDS_PERFORMANCE_JOIN
(
  TABLE_NAME        VARCHAR2(50 BYTE),
  UNIQUE_ENTITY_ID  INTEGER,
  REQUEST_ID        VARCHAR2(50 BYTE),
  DATE_CREATED      TIMESTAMP(6)
)
TABLESPACE <<TableSpaceName>>
/
COMMENT ON TABLE VLDS_PERFORMANCE_JOIN IS 'Used as a join table to help speed up the performance query. It is a work table used to hold short-term data during the execution of a performance query';

COMMENT ON COLUMN VLDS_PERFORMANCE_JOIN.TABLE_NAME IS 'Name of the demographic log table in the exposure database';

COMMENT ON COLUMN VLDS_PERFORMANCE_JOIN.UNIQUE_ENTITY_ID IS 'Random ID generated by VT';

COMMENT ON COLUMN VLDS_PERFORMANCE_JOIN.REQUEST_ID IS 'Request ID';

COMMENT ON COLUMN VLDS_PERFORMANCE_JOIN.DATE_CREATED IS 'Date record was created';

CREATE UNIQUE INDEX VLDS_PERFORMANCE_JOIN_PK ON VLDS_PERFORMANCE_JOIN
(TABLE_NAME, UNIQUE_ENTITY_ID, REQUEST_ID)
LOGGING
TABLESPACE <<TableSpaceName>>
/
ALTER TABLE VLDS_PERFORMANCE_JOIN ADD (
  CONSTRAINT VLDS_PERFORMANCE_JOIN_PK
  PRIMARY KEY
  (TABLE_NAME, UNIQUE_ENTITY_ID, REQUEST_ID)
  USING INDEX VLDS_PERFORMANCE_JOIN_PK
  ENABLE VALIDATE);
  
CREATE TABLE REDUCED_DGL1
(
   PK_DGL  INTEGER PRIMARY KEY,
   INTERNAL_ID VARCHAR(100 BYTE)   NOT NULL,
   FIRST_NAME VARCHAR(100 BYTE)   NULL,
   MIDDLE_NAMES VARCHAR(255 BYTE) NULL,
   LAST_NAME VARCHAR(100 BYTE)    NOT NULL,
   GENDER VARCHAR(100 BYTE)       NULL,
   DOB_MONTH VARCHAR(100 BYTE)    NULL,
   DOB_DAY VARCHAR(100 BYTE)      NULL,
   DOB_YEAR VARCHAR(100 BYTE)     NULL,
   FIPS_STATE VARCHAR(100 BYTE)   NULL,
   FIPS_COUNTY VARCHAR(100 BYTE)  NULL,
   ZIP_5 VARCHAR(100 BYTE)        NULL,
   RECORD_DATE date               NULL,
   MATCH_ID_1 VARCHAR(100 BYTE)   NULL,
   MATCH_ID_2 VARCHAR(100 BYTE)   NULL,
   MATCH_ID_3 VARCHAR(100 BYTE)   NULL
);

CREATE TABLE REDUCED_DGL2
(
   PK_DGL  INTEGER PRIMARY KEY,
   INTERNAL_ID VARCHAR(100 BYTE)   NOT NULL,
   FIRST_NAME VARCHAR(100 BYTE)   NULL,
   MIDDLE_NAMES VARCHAR(255 BYTE) NULL,
   LAST_NAME VARCHAR(100 BYTE)    NOT NULL,
   GENDER VARCHAR(100 BYTE)       NULL,
   DOB_MONTH VARCHAR(100 BYTE)    NULL,
   DOB_DAY VARCHAR(100 BYTE)      NULL,
   DOB_YEAR VARCHAR(100 BYTE)     NULL,
   FIPS_STATE VARCHAR(100 BYTE)   NULL,
   FIPS_COUNTY VARCHAR(100 BYTE)  NULL,
   ZIP_5 VARCHAR(100 BYTE)        NULL,
   RECORD_DATE date               NULL,
   MATCH_ID_1 VARCHAR(100 BYTE)   NULL,
   MATCH_ID_2 VARCHAR(100 BYTE)   NULL,
   MATCH_ID_3 VARCHAR(100 BYTE)   NULL
);

