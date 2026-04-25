/*
======================================================================
Setting Environment For Logistics EDW Project
======================================================================
Script Purpose:
      This Script is used to set the environment for the respective project. In which
      first the database is created. Then 3 different schemas are created for different
      layers of datawarehouse.
*/

SELECT name
FROM sys.databases;

CREATE DATABASE LogisticsDataWarehouse;

USE LogisticsDataWarehouse;
GO

CREATE SCHEMA stg;
GO
CREATE SCHEMA ods;
GO
CREATE SCHEMA edw;
GO
