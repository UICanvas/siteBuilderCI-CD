-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: ServiceDB
-- Source Schemata: ServiceDB
-- Created: Wed May  6 13:21:07 2020
-- Workbench Version: 8.0.20
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema ServiceDB
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `ServiceDB` ;
CREATE SCHEMA IF NOT EXISTS `ServiceDB` ;

-- ----------------------------------------------------------------------------
-- Table ServiceDB.Attribute_Catalog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`Attribute_Catalog` (
  `InternalRecordId` BIGINT NULL,
  `Created` DATETIME(6) NULL,
  `Last_Updated` DATETIME(6) NULL,
  `Data_Last_Updated` DATETIME(6) NULL,
  `Snapshot_Last_Updated` DATETIME(6) NULL,
  `attribute_desc` VARCHAR(100) CHARACTER SET 'utf8mb4' NULL,
  `attribute_group` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL,
  `attribute_identifier` VARCHAR(100) CHARACTER SET 'utf8mb4' NULL,
  `attribute_source` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL,
  `comparable` SMALLINT NULL,
  `facetable` SMALLINT NULL,
  `help_text` VARCHAR(255) CHARACTER SET 'utf8mb4' NULL,
  `id` BIGINT NULL,
  `searchable` SMALLINT NULL);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.Compatible_Model_Manufacturer
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`Compatible_Model_Manufacturer` (
  `InternalRecordId` BIGINT NOT NULL,
  `Created` DATETIME(6) NOT NULL,
  `Last_Updated` DATETIME(6) NOT NULL,
  `Data_Last_Updated` DATETIME(6) NOT NULL,
  `Snapshot_Last_Updated` DATETIME(6) NOT NULL,
  `abbr_code` VARCHAR(4) CHARACTER SET 'utf8mb4' NOT NULL,
  `display_flag` VARCHAR(1) CHARACTER SET 'utf8mb4' NOT NULL,
  `mfgr_desc` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  `mfgr_id` BIGINT NOT NULL,
  `mfgr_key` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL,
  `mfgr_oid` VARCHAR(16) CHARACTER SET 'utf8mb4' NOT NULL,
  `sort_order` BIGINT NULL);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.deltaurl
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`deltaurl` (
  `id` INT NOT NULL,
  `locale` VARCHAR(255) NULL,
  `url` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SERVICEPROFILE
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SERVICEPROFILE` (
  `ID` BIGINT NOT NULL,
  `SERVICEID` BIGINT NOT NULL,
  `NAME` VARCHAR(100) NOT NULL,
  `TYPE` VARCHAR(100) NOT NULL,
  `SOURCE` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_serviceid`
    FOREIGN KEY (`SERVICEID`)
    REFERENCES `ServiceDB`.`SLSERVICE` (`SERVICEID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLPARTNERPROFILE
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLPARTNERPROFILE` (
  `id` INT NULL,
  `partnerid` BIGINT NULL,
  `localename` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL,
  `currency` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL,
  `symbol` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL,
  `vatmultiplier` DECIMAL(10,2) NULL,
  `vatformatter` VARCHAR(100) CHARACTER SET 'utf8mb4' NULL,
  `templateid` BIGINT NULL);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLRESTMPLTMAPPING
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLRESTMPLTMAPPING` (
  `MAPPINGID` BIGINT NOT NULL,
  `FROMFIELD` LONGTEXT NULL,
  `TOFIELD` LONGTEXT NULL,
  `SOURCE` VARCHAR(10) NULL,
  `STATUS` INT NULL,
  `FORMULA` LONGTEXT CHARACTER SET 'utf8mb4' NULL);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLRESTMPLTSERVICEREL
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLRESTMPLTSERVICEREL` (
  `ID` BIGINT NOT NULL,
  `SERVICEID` BIGINT NOT NULL,
  `TEMPLATEID` BIGINT NOT NULL,
  `MAPPINGID` BIGINT NOT NULL);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLROLE
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLROLE` (
  `ROLEID` BIGINT NOT NULL,
  `NAME` VARCHAR(50) NULL,
  `DESCRIPTION` VARCHAR(50) NULL,
  PRIMARY KEY (`ROLEID`));

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLSCRIPT
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLSCRIPT` (
  `ID` BIGINT NULL,
  `SERVICENAME` VARCHAR(255) NULL,
  `QUERYNAME` VARCHAR(255) NULL,
  `QUERYVALUE` LONGTEXT NULL);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLSERVICE
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLSERVICE` (
  `SERVICEID` BIGINT NOT NULL,
  `NAME` VARCHAR(50) NULL,
  `STATUS` VARCHAR(50) NULL,
  `IMPL` VARCHAR(255) NULL,
  PRIMARY KEY (`SERVICEID`));

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLSERVICEROLE
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLSERVICEROLE` (
  `SERVICEID` BIGINT NOT NULL,
  `ROLEID` BIGINT NOT NULL,
  `SERVICETYPE` VARCHAR(255) NULL);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLSTAT
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLSTAT` (
  `USERID` BIGINT NULL,
  `SERVICEID` BIGINT NULL,
  `NAME` VARCHAR(255) NULL,
  `VALUE` VARCHAR(255) NULL);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLUSERPROF
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLUSERPROF` (
  `USERID` BIGINT NOT NULL,
  `PARTNERID` BIGINT NULL,
  `EXTLOCALENAME` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLUSERREG
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLUSERREG` (
  `USERID` BIGINT NOT NULL,
  `LOGINID` VARCHAR(50) NOT NULL,
  `STATUS` INT NOT NULL,
  `LOGINPASSWORD` VARCHAR(255) NOT NULL,
  `CREATIONDATE` DATETIME(6) NULL,
  `FIRSTNAME` VARCHAR(255) NULL,
  `LASTNAME` VARCHAR(255) NULL,
  `MERCHANTKEY` VARCHAR(255) NOT NULL,
  `EXPIRYMILLIS` BIGINT NULL,
  PRIMARY KEY (`USERID`));

-- ----------------------------------------------------------------------------
-- Table ServiceDB.SLUSERROLE
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`SLUSERROLE` (
  `USER_ID` BIGINT NOT NULL,
  `ROLE_ID` BIGINT NOT NULL);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.URLDELTA
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`URLDELTA` (
  `ID` BIGINT NOT NULL,
  `ACTION` VARCHAR(20) NULL,
  `PROCESSED` INT NULL,
  `CRTEATETIME` DATETIME(6) NULL,
  `LASTUPDATETIME` DATETIME(6) NULL,
  CONSTRAINT `FK_URLID`
    FOREIGN KEY (`ID`)
    REFERENCES `ServiceDB`.`URLMASTER` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table ServiceDB.URLMASTER
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiceDB`.`URLMASTER` (
  `ID` BIGINT NOT NULL,
  `LOCALEID` BIGINT NOT NULL,
  `URL` VARCHAR(255) NOT NULL,
  `CRTEATETIME` DATETIME(6) NULL,
  `URLTYPE` VARCHAR(50) NULL,
  `FIELD1` BIGINT NULL,
  `FIELD2` VARCHAR(255) NULL,
  `FIELD3` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `uc_urlmaster` (`LOCALEID` ASC, `URL` ASC) VISIBLE);
SET FOREIGN_KEY_CHECKS = 1;
