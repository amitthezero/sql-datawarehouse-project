/*
===================================================================================================
STORED PROCEDURE : Load Bronze Layer (Soource --> Bronze)
===================================================================================================
Scripts Purpose :
        This stored procedure loads data into the 'bronze' schema from external CSV files. It performs the following actions:
        - Truncate the bronze table before loading data.
        - Use the BULK INSERT command to load data from the CSV files to the bronze tables.
Parameters : None

Usage Example : EXEC bronze.load_bronze;
===================================================================================================
*/

Create OR Alter Procedure bronze.load_bronze As
Begin
	Declare @Start_Time Datetime, @End_Time Datetime, @Batch_Start_Time DateTime, @Batch_End_Time Datetime;
	Begin Try
		Set @Batch_Start_Time = Getdate();
		Print '=======================================================================================';
		Print 'Loading Bronze Layer';
		Print '=======================================================================================';
		Print '---------------------------------------------------------------------------------------';
		Print 'Loading CRM Tables';
		Print '---------------------------------------------------------------------------------------';

		Set @Start_Time = Getdate();
		Print '>> Truncating Table : bronze.crm_cust_info';
		Truncate Table bronze.crm_cust_info;
		Print '>> Inserting Data Into : bronze.crm_cust_info';
		Bulk Insert bronze.crm_cust_info
		From 'C:\Users\Administrator\Documents\SQL Datawerehouse Project\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
		With (
			Firstrow = 2,
			Fieldterminator = ',',
			Tablock
		);
		Set @End_Time = Getdate();
		Print '>> Loading Duration : ' + Cast( Datediff(Second, @Start_Time, @End_Time) As Nvarchar) + ' Seconds';
		Print '>> ---------------------';

		Set @Start_Time = Getdate();
		Print '>> Truncating Table : bronze.crm_prd_info';
		Truncate Table bronze.crm_prd_info;
		Print '>> Inserting Data Into : bronze.crm_prd_info';
		Bulk Insert bronze.crm_prd_info
		From 'C:\Users\Administrator\Documents\SQL Datawerehouse Project\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
		With (
			Firstrow = 2,
			Fieldterminator = ',',
			Tablock
		);
		Set @End_Time = Getdate();
		Print '>> Loading Duration : ' + Cast( Datediff(Second, @Start_Time, @End_Time) As Nvarchar) + ' Seconds';
		Print '>> ---------------------';

		Set @Start_Time = Getdate();
		Print '>> Truncating Table : bronze.crm_sales_details';
		Truncate Table bronze.crm_sales_details;
		Print '>> Inserting Data Into : bronze.crm_sales_details';
		Bulk Insert bronze.crm_sales_details
		From 'C:\Users\Administrator\Documents\SQL Datawerehouse Project\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
		With (
			Firstrow = 2,
			Fieldterminator = ',',
			Tablock
		);
		Set @End_Time = Getdate();
		Print '>> Loading Duration : ' + Cast( Datediff(Second, @Start_Time, @End_Time) As Nvarchar) + ' Seconds';
		Print '>> ---------------------';

		Print '---------------------------------------------------------------------------------------';
		Print 'Loading ERP Tables';
		Print '---------------------------------------------------------------------------------------';

		Set @Start_Time = Getdate();
		Print '>> Truncating Table : bronze.erp_cust_az12';
		Truncate Table bronze.erp_cust_az12;
		Print '>> Inserting Data Into : bronze.erp_cust_az12';
		Bulk Insert bronze.erp_cust_az12
		From 'C:\Users\Administrator\Documents\SQL Datawerehouse Project\sql-data-warehouse-project-main\datasets\source_erp\cust_az12.csv'
		With (
			Firstrow = 2,
			Fieldterminator = ',',
			Tablock
		);
		Set @End_Time = Getdate();
		Print '>> Loading Duration : ' + Cast( Datediff(Second, @Start_Time, @End_Time) As Nvarchar) + ' Seconds';
		Print '>> ---------------------';

		Set @Start_Time = Getdate();
		Print '>> Truncating Table : bronze.erp_loc_a101';
		Truncate Table bronze.erp_loc_a101;
		Print '>> Inserting Data Into : bronze.erp_loc_a101';
		Bulk Insert bronze.erp_loc_a101
		From 'C:\Users\Administrator\Documents\SQL Datawerehouse Project\sql-data-warehouse-project-main\datasets\source_erp\loc_a101.csv'
		With (
			Firstrow = 2,
			Fieldterminator = ',',
			Tablock
		);
		Set @End_Time = Getdate();
		Print '>> Loading Duration : ' + Cast( Datediff(Second, @Start_Time, @End_Time) As Nvarchar) + ' Seconds';
		Print '>> ---------------------';

		Set @Start_Time = Getdate();
		Print '>> Truncating Table : bronze.erp_px_cat_g1v2';
		Truncate Table bronze.erp_px_cat_g1v2;
		Print '>> Inserting Data Into : bronze.erp_px_cat_g1v2';
		Bulk Insert bronze.erp_px_cat_g1v2
		From 'C:\Users\Administrator\Documents\SQL Datawerehouse Project\sql-data-warehouse-project-main\datasets\source_erp\px_cat_g1v2.csv'
		With (
			Firstrow = 2,
			Fieldterminator = ',',
			Tablock
		);
		Set @End_Time = Getdate();
		Print '>> Loading Duration : ' + Cast( Datediff(Second, @Start_Time, @End_Time) As Nvarchar) + ' Seconds';
		Print '>> ---------------------';

		Set @Batch_End_Time = Getdate();
		Print '>> Loading Bronze Layer Is Compeleted';
		Print '>> Total Loading Duration : ' + Cast( Datediff(Second, @Batch_Start_Time, @Batch_End_Time) As Nvarchar) + ' Seconds';
		Print '>> ---------------------';

	End Try
	Begin Catch
		Print '============================================================================================';
		Print 'Error Occured During Loading Bronze Layer';
		Print 'Error massage' + Error_Message();
		Print 'Error massage' + Cast (Error_Number() As Nvarchar);
		Print 'Error massage' + Cast (Error_State() As Nvarchar);
		Print '============================================================================================';
	End Catch
End
