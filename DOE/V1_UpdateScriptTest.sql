DROP TABLE DATAADAPTER.REDUCED_DGL1;
DROP TABLE DATAADAPTER.REDUCED_DGL2;
DROP TABLE DATAADAPTER.VLDS_ID_MAPPER;
DROP TABLE DATAADAPTER.VLDS_PERFORMANCE_JOIN;


CREATE TABLE DATAADAPTER.REDUCED_DGL1
(
   PK_DGL  INTEGER NOT NULL,
   INTERNAL_ID VARCHAR(100 BYTE)  NOT NULL,
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
   RECORD_DATE VARCHAR(25 BYTE)   NULL,
   MATCH_ID_1 VARCHAR(100 BYTE)   NULL,
   MATCH_ID_2 VARCHAR(100 BYTE)   NULL,
   MATCH_ID_3 VARCHAR(100 BYTE)   NULL
) TABLESPACE VLDS;

CREATE TABLE DATAADAPTER.REDUCED_DGL2
(
   PK_DGL  INTEGER NOT NULL,
   INTERNAL_ID VARCHAR(100 BYTE)  NOT NULL,
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
   RECORD_DATE VARCHAR(25 BYTE)   NULL,
   MATCH_ID_1 VARCHAR(100 BYTE)   NULL,
   MATCH_ID_2 VARCHAR(100 BYTE)   NULL,
   MATCH_ID_3 VARCHAR(100 BYTE)   NULL
) TABLESPACE VLDS;

CREATE TABLE DATAADAPTER.VLDS_ID_MAPPER 
(
   TABLE_NAME   VARCHAR(50 BYTE),
   INTERNAL_ID  VARCHAR(100 BYTE),
   UNIQUE_ENTITY_ID INTEGER
 ) TABLESPACE VLDS;
 
CREATE TABLE DATAADAPTER.VLDS_PERFORMANCE_JOIN
(
  TABLE_NAME        VARCHAR2(50 BYTE),
  UNIQUE_ENTITY_ID  INTEGER,
  REQUEST_ID        VARCHAR2(50 BYTE),
  DATE_CREATED      TIMESTAMP(6)
) TABLESPACE VLDS;



ALTER TABLE DATAADAPTER.REDUCED_DGL1 ADD (CONSTRAINT pk_dgl1 PRIMARY KEY (PK_DGL)using index tablespace VLDS);
DROP SEQUENCE dgl1_seq;
CREATE SEQUENCE dgl1_seq START WITH 1 INCREMENT BY 1 nomaxvalue;

ALTER TABLE DATAADAPTER.REDUCED_DGL2 ADD (CONSTRAINT pk_dgl2 PRIMARY KEY (PK_DGL)using index tablespace VLDS);
DROP SEQUENCE dgl2_seq;
CREATE SEQUENCE dgl2_seq START WITH 1 INCREMENT BY 1 nomaxvalue;


CREATE OR REPLACE TRIGGER trig_dgl1
BEFORE INSERT ON DATAADAPTER.REDUCED_DGL1
FOR EACH ROW
   BEGIN
      select dgl1_seq.nextval into :new.PK_DGL from dual;
   END;
/

CREATE OR REPLACE TRIGGER trig_dgl2
BEFORE INSERT ON DATAADAPTER.REDUCED_DGL2
FOR EACH ROW
   BEGIN
      select dgl2_seq.nextval into :new.PK_DGL from dual;
   END;
/

CREATE INDEX DATAADAPTER.NDX_DGL1_INTERNAL_ID ON DATAADAPTER.REDUCED_DGL1
(INTERNAL_ID)
LOGGING
TABLESPACE VLDS
STORAGE    (
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

CREATE INDEX DATAADAPTER.NDX_DGL2_INTERNAL_ID ON DATAADAPTER.REDUCED_DGL2
(INTERNAL_ID)
LOGGING
TABLESPACE VLDS
STORAGE    (
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


CREATE UNIQUE INDEX VLDS_ID_MAPPER_UK1 ON DATAADAPTER.VLDS_ID_MAPPER(TABLE_NAME, INTERNAL_ID) TABLESPACE VLDS;
CREATE UNIQUE INDEX VLDS_ID_MAPPER_UK2 ON DATAADAPTER.VLDS_ID_MAPPER(TABLE_NAME, UNIQUE_ENTITY_ID) TABLESPACE VLDS;
CREATE UNIQUE INDEX VLDS_PERFORMANCE_JOIN_PK ON DATAADAPTER.VLDS_PERFORMANCE_JOIN (TABLE_NAME, UNIQUE_ENTITY_ID, REQUEST_ID) TABLESPACE VLDS;

ALTER TABLE DATAADAPTER.VLDS_PERFORMANCE_JOIN ADD ( CONSTRAINT VLDS_PERFORMANCE_JOIN_PK
  PRIMARY KEY(TABLE_NAME, UNIQUE_ENTITY_ID, REQUEST_ID)
  USING INDEX VLDS_PERFORMANCE_JOIN_PK
  ENABLE VALIDATE);
