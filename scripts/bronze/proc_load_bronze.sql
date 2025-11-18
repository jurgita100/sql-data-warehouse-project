/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses COPY to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
   CALL bronze.load_bronze();
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze(
	)
LANGUAGE 'plpgsql'
AS $BODY$

BEGIN
  TRUNCATE TABLE bronze.crm_cust_info;
  RAISE NOTICE 'Kopijuojami duomenys į bronze.crm_cust_info...';
  COPY bronze.crm_cust_info
  FROM 'C:\Users\Lenovo\Desktop\SQL_\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    DELIMITER ','
    CSV HEADER;

  TRUNCATE TABLE bronze.crm_prd_info;  
  RAISE NOTICE 'Kopijuojami duomenys į bronze.crm_prd_info...';
  COPY bronze.crm_prd_info
  FROM 'C:\Users\Lenovo\Desktop\SQL_\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    DELIMITER ','
    CSV HEADER;

  TRUNCATE TABLE bronze.crm_sales_detales;
  RAISE NOTICE 'Kopijuojami duomenys į bronze.crm_sales_info...';
  COPY bronze.crm_sales_details
  FROM 'C:\Users\Lenovo\Desktop\SQL_\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    DELIMITER ','
    CSV HEADER;

  TRUNCATE TABLE bronze.erp_cust_az12;
  RAISE NOTICE 'Kopijuojami duomenys į bronze.erp_cust_az12...';
  COPY bronze.erp_cust_az12
  FROM 'C:\Users\Lenovo\Desktop\SQL_\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
    DELIMITER ','
    CSV HEADER;

  TRUNCATE TABLE bronze.erp_loc_a101; 
  RAISE NOTICE 'Kopijuojami duomenys į bronze.erp_loc_a101...';
  COPY bronze.erp_loc_a101
  FROM 'C:\Users\Lenovo\Desktop\SQL_\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
    DELIMITER ','
    CSV HEADER;

  TRUNCATE TABLE bronze.erp_px_cat_g1v2;
  RAISE NOTICE 'Kopijuojami duomenys į bronze.erp_px_cat_g1v2...';
  COPY bronze.erp_px_cat_g1v2
  FROM 'C:\Users\Lenovo\Desktop\SQL_\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
    DELIMITER ','
    CSV HEADER;

  RAISE NOTICE 'Duomenų įkėlimas į bronze sluoksnį baigtas sėkmingai.';
END;
$BODY$;
