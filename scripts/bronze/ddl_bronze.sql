/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID('bronze.academy', 'U') IS NOT NULL
    DROP TABLE bronze.academy;
GO

CREATE TABLE bronze.academy (
    film	            NVARCHAR(50),
    award_type			NVARCHAR(50),
    status				NVARCHAR(50)
);
GO


IF OBJECT_ID('bronze.box_office', 'U') IS NOT NULL
    DROP TABLE bronze.box_office;
GO

CREATE TABLE bronze.box_office (
    film					NVARCHAR(50),
    budget					INT,
    box_office_us_canada	INT,
	box_office_other		INT,
	box_office_worldwide	INT
);
GO


IF OBJECT_ID('bronze.genres', 'U') IS NOT NULL
    DROP TABLE bronze.genres;
GO

CREATE TABLE bronze.genres (
    film					NVARCHAR(50),
    category				NVARCHAR(50),
	genre_value				NVARCHAR(50)
);
GO


IF OBJECT_ID('bronze.pixar_films', 'U') IS NOT NULL
    DROP TABLE bronze.pixar_films;
GO

CREATE TABLE bronze.pixar_films (
    number				INT,
    film				NVARCHAR(50),
    release_date		DATE,
    run_time			INT,
    film_rating			NVARCHAR(50),
    plot				NVARCHAR(255)
);
GO


IF OBJECT_ID('bronze.pixar_people', 'U') IS NOT NULL
    DROP TABLE bronze.pixar_people;
GO

CREATE TABLE bronze.pixar_people (
    film				NVARCHAR(50),
    role_type			NVARCHAR(50),
    person_name			NVARCHAR(50)
);
GO


IF OBJECT_ID('bronze.public_response', 'U') IS NOT NULL
    DROP TABLE bronze.public_response;
GO

CREATE TABLE bronze.public_response (
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
