/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
    This stored procedure performs the ETL (Extract, Transform, Load) process to 
    populate the 'silver' schema tables from the 'bronze' schema.
	Actions Performed:
		- Truncates Silver tables.
		- Inserts transformed and cleansed data from Bronze into Silver tables.
		
Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC Silver.load_silver;
===============================================================================
*/

-- Execute Stored Procedure
EXECUTE silver.load_silver;


-- Create Stored Procedure
CREATE OR ALTER PROCEDURE silver.load_silver AS 
BEGIN


-- silver.academy	
	PRINT '>> Truncating Table: silver.academy';
	TRUNCATE TABLE silver.academy;
	PRINT '>> Inserting Data Into: silver.academy';
	INSERT INTO silver.academy(
		film, 
		award_type,
		status
	)
	SELECT *
	FROM bronze.academy;


-- silver.genres
	PRINT '>> Truncating Table: silver.genres';
	TRUNCATE TABLE silver.genres;
	PRINT '>> Inserting Data Into: silver.genres';
	INSERT INTO silver.genres(
		film, 
		category,
		genre_value
	)
	SELECT *
	FROM bronze.genres;


-- silver.pixar_people
	PRINT '>> Truncating Table: silver.pixar_people';
	TRUNCATE TABLE silver.pixar_people;
	PRINT '>> Inserting Data Into: silver.pixar_people';
	INSERT INTO silver.pixar_people(
		film, 
		role_type,
		person_name
	)
	SELECT *
	FROM bronze.pixar_people;


-- silver.box_office
	PRINT '>> Truncating Table: silver.box_office';
	TRUNCATE TABLE silver.box_office;
	PRINT '>> Inserting Data Into: silver.box_office';
	INSERT INTO silver.box_office(
		film, 
		budget,
		box_office_us_canada,
		box_office_other, 
		box_office_worldwide
	)
	SELECT *
	FROM bronze.box_office;

-- silver.public_response
	PRINT '>> Truncating Table: silver.public_response';
	TRUNCATE TABLE silver.public_response;
	PRINT '>> Inserting Data Into: silver.public_response';
	INSERT INTO silver.public_response(
		film, 
		rotten_tomatoes_score,
		rotten_tomatoes_counts,
		metacritic_score, 
		metacritic_counts,
		cinema_score, 
		imdb_score,
		imdb_counts
	)
	SELECT *
	FROM bronze.public_response;


-- silver.pixar_films
	PRINT '>> Truncating Table: silver.pixar_films';
	TRUNCATE TABLE silver.pixar_films;
	PRINT '>> Inserting Data Into: silver.pixar_films';
	INSERT INTO silver.pixar_films(
		film, 
		release_date, 
		run_time,
		converted_runtime,
		film_rating,
		plot
	)
	SELECT
		film, 
		release_date, 
		run_time,
		CAST ((run_time/60) AS VARCHAR(8)) + 'hr ' 
		+ RIGHT('0' + CAST((run_time % 60) AS VARCHAR(2)), 2)
		+ 'min' AS converted_runtime,
		film_rating,
		plot
	FROM bronze.pixar_films;

END
