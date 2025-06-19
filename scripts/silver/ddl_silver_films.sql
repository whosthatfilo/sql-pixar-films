/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('silver.academy', 'U') IS NOT NULL
    DROP TABLE silver.academy;
GO

CREATE TABLE silver.academy (
    film	            NVARCHAR(50),
    award_type			NVARCHAR(50),
    status				NVARCHAR(50)
);
GO


IF OBJECT_ID('silver.box_office', 'U') IS NOT NULL
    DROP TABLE silver.box_office;
GO

CREATE TABLE silver.box_office (
    film					NVARCHAR(50),
    budget					INT,
    box_office_us_canada	INT,
	box_office_other		INT,
	box_office_worldwide	INT
);
GO


IF OBJECT_ID('silver.genres', 'U') IS NOT NULL
    DROP TABLE silver.genres;
GO

CREATE TABLE silver.genres (
    film					NVARCHAR(50),
    category				NVARCHAR(50),
	genre_value				NVARCHAR(50)
);
GO


IF OBJECT_ID('silver.pixar_films', 'U') IS NOT NULL
    DROP TABLE silver.pixar_films;
GO

CREATE TABLE silver.pixar_films (
    film				NVARCHAR(50),
    release_date		DATE,
    run_time			INT,
	converted_runtime	NVARCHAR(50),
    film_rating			NVARCHAR(50),
    plot				NVARCHAR(255)
);
GO


IF OBJECT_ID('silver.pixar_people', 'U') IS NOT NULL
    DROP TABLE silver.pixar_people;
GO

CREATE TABLE silver.pixar_people (
    film				NVARCHAR(50),
    role_type			NVARCHAR(50),
    person_name			NVARCHAR(50)
);
GO


IF OBJECT_ID('silver.public_response', 'U') IS NOT NULL
    DROP TABLE silver.public_response;
GO

CREATE TABLE silver.public_response (
    film					NVARCHAR(50),
    rotten_tomatoes_score	INT,
    rotten_tomatoes_counts	INT,
	metacritic_score		INT,
	metacritic_counts		INT,
	cinema_score			NVARCHAR(50),
	imdb_score				FLOAT,
	imdb_counts				INT
);
GO
