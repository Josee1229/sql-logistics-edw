/*
==============================================================================
Initializing the Staging Area with Data from Source
==============================================================================
Script Purpose:
      This script is used to generate a procedure which truncates the existing tables in the staging area
      and then initialize them with values from the source csv files.

Note:
    The defined procedure doesn't accept any parameter. Just run it, as it is. (Eg. EXEC stg.load_stg)
*/


CREATE OR ALTER PROCEDURE stg.load_stg AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @start_time_batch DATETIME, @end_time_batch DATETIME;
	BEGIN TRY
		SET @start_time_batch = GETDATE();
		PRINT '===============================================================';
		PRINT 'Loading Staging Layer';
		PRINT '===============================================================';
		PRINT '---------------------------------------------------------------';
		PRINT 'Loading Courier Table';
		PRINT '---------------------------------------------------------------';
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table stg.courier';
		TRUNCATE TABLE stg.courier;
		PRINT '>> Inserting Data Into: stg.courier';
		BULK INSERT stg.courier
		FROM 'J:\Data Analyst\Projects\Logistics DataWarehouse\Data Source\Raw_Couriers.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			CODEPAGE = '65001', 
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds.';
		PRINT '------------------'
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table stg.delivery_events';
		TRUNCATE TABLE stg.delivery_events;
		PRINT '>> Inserting Data Into: stg.delivery_events';
		BULK INSERT stg.delivery_events
		FROM 'J:\Data Analyst\Projects\Logistics DataWarehouse\Data Source\Raw_Delivery_Events.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			CODEPAGE = '65001', 
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds.';
		PRINT '------------------'
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table stg.orders';
		TRUNCATE TABLE stg.orders;
		PRINT '>> Inserting Data Into: stg.orders';
		BULK INSERT stg.orders
		FROM 'J:\Data Analyst\Projects\Logistics DataWarehouse\Data Source\Raw_Orders.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			CODEPAGE = '65001', 
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds.';
		PRINT '------------------'
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table stg.support_tickets';
		TRUNCATE TABLE stg.support_tickets;
		PRINT '>> Inserting Data Into: stg.support_tickets';
		BULK INSERT stg.support_tickets
		FROM 'J:\Data Analyst\Projects\Logistics DataWarehouse\Data Source\Raw_Support_Tickets.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '0x0a',
			CODEPAGE = '65001', 
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds.';
		PRINT '------------------'
		SET @end_time_batch = GETDATE();
		PRINT '>> Total Load Duration: ' + CAST(DATEDIFF(second,@start_time_batch,@end_time_batch) AS NVARCHAR) + ' seconds.';
	END TRY
	BEGIN CATCH
		PRINT '================================================================';
		PRINT 'ERROR OCCURED DURING LOADING Staging LAYER';
		PRINT 'Error Message: ' + ERROR_MESSAGE();
		PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '================================================================';
	END CATCH
END






