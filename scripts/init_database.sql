/*
=======================================================================================
Create Database & Schemas
=======================================================================================
Scripts Purpose :
  This script creates a new database named 'DataWarehouse'. After checking if it already exists, if the database exists,
  it is dropped and recreated. Additionally, this script sets up three schemas within the database, 'bronze', 'silver', and 'gold'.
WARNING:
  Running this script will drop the entire 'datawarehouse' database if it exists. All data in the database will be permanently deleted.
  Proceed with caution and ensure you have proper backups before running this script.
*/


Use Master;
GO
  --Drop & recreate 'DatWarehouse' database.
IF EXISTS (Select 1 From system.databases WHERE name = 'DataWarehouse')
  
BEGIN
    ALTER Database DataWarehouse SET Single User With Rollback Immediate;
    DROP Database DataWarehouse;
END;
  --Create the 'DataWarehouse' database
Create Database DataWarehouse;
GO
Use DataWarehouse;
GO
  --Create Schemas 
Create Schema bronze;
GO
Create Schema silver;
GO
Create Schema gold;
GO
