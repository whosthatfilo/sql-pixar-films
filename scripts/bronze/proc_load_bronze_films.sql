/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

-- Execute Stored Procedure
EXECUTE bronze.load_bronze;



-- Create Stored Procedure
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN


-- bronze.academy
TRUNCATE TABLE bronze.academy;
BULK INSERT bronze.academy
FROM 'C:\Users\chavezk\Desktop\SQL\films-dataset\dataset\academy.csv'
WITH (
	FIRSTROW = 2,
	FORMAT = 'CSV',
	TABLOCK
);


-- bronze.box_office
TRUNCATE TABLE bronze.box_office;
BULK INSERT bronze.box_office
FROM 'C:\Users\chavezk\Desktop\SQL\films-dataset\dataset\box_office.csv'
WITH (
	FIRSTROW = 2,
	FORMAT = 'CSV',
	TABLOCK
);


-- bronze.genres
TRUNCATE TABLE bronze.genres;
BULK INSERT bronze.genres
FROM 'C:\Users\chavezk\Desktop\SQL\films-dataset\dataset\genres.csv'
WITH (
	FIRSTROW = 2,
	FORMAT = 'CSV',
	TABLOCK
);


-- bronze.pixar_films
TRUNCATE TABLE bronze.pixar_films;
BULK INSERT bronze.pixar_films
FROM 'C:\Users\chavezk\Desktop\SQL\films-dataset\dataset\pixar_films.csv'
WITH (
	FIRSTROW = 2,
	FORMAT = 'CSV',
	TABLOCK
);


-- bronze.pixar_people
TRUNCATE TABLE bronze.pixar_people;
BULK INSERT bronze.pixar_people
FROM 'C:\Users\chavezk\Desktop\SQL\films-dataset\dataset\pixar_people.csv'
WITH (
	FIRSTROW = 2,
	FORMAT = 'CSV',
	TABLOCK
);


-- pixar.public_response
TRUNCATE TABLE bronze.public_response;
BULK INSERT bronze.public_response
FROM 'C:\Users\chavezk\Desktop\SQL\films-dataset\dataset\public_response.csv'
WITH (
	FIRSTROW = 2,
	FORMAT = 'CSV',
	TABLOCK
);

END
