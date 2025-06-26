/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_film
-- =============================================================================
IF OBJECT_ID('gold.dim_film', 'V') IS NOT NULL
	DROP VIEW gold.dim_film;
GO

CREATE VIEW gold.dim_film AS
SELECT
	a.film			AS Film,
	pf.release_date	AS Release_Date,
	a.award_type	AS Award_Type,
	a.Status		AS Award_Status,
	g.category		AS Category,
	g.genre_value	AS Genre,
	pp.role_type	AS Film_Role,
	pp.person_name	AS Name,
	pf.plot			AS Plot
FROM silver.academy a
	LEFT JOIN silver.genres g ON a.film = g.film
	LEFT JOIN silver.pixar_people pp ON a.film = pp.film
	LEFT JOIN silver.pixar_films pf ON a.film = pf.film
GO


-- =============================================================================
-- Create Dimension: gold.dim_metrics
-- =============================================================================
IF OBJECT_ID('gold.dim_metrics', 'V') IS NOT NULL
	DROP VIEW gold.dim_metrics;
GO

CREATE VIEW gold.dim_metrics AS
SELECT
	pf.film						AS Film,
	pf.release_date				AS Release_Date,
	pf.run_time					AS Run_Time,
	pf.converted_runtime		AS Converted_Run_Time,
	bo.budget					AS Budget, 
	bo.box_office_us_canada		AS Box_Office_CA,
	bo.box_office_other			AS Box_Office_Other, 
	bo.box_office_worldwide		AS Box_Office_Worldwide,
	pr.rotten_tomatoes_score	AS Rotten_Tomatoes_Score,
	pr.rotten_tomatoes_counts	AS Rotten_Tomatoes_Count,
	pr.metacritic_score			AS Metcritic_Score,
	pr.metacritic_counts		AS Metcritic_Count,
	pr.cinema_score				AS Cinema_Score,
	pr.imdb_score				AS IMDB_Score,
	pr.imdb_counts				AS IMDB_Count
FROM silver.pixar_films pf
	LEFT JOIN silver.box_office bo ON pf.film = bo.film
	LEFT JOIN silver.public_response pr ON pf.film = pr.film
GO
