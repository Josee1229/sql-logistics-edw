/*
====================================================================================
DDL Script: Create Staging Area Tables
====================================================================================
Script Purpose:
    This script creates tables in the staging area, dropping existing tables if
    they exists.
    Run this script to redefine the DDL structure of staging area.
*/




IF OBJECT_ID('stg.courier','U') IS NOT NULL
	DROP TABLE stg.raw_courier
GO

CREATE TABLE stg.courier (
	courier_id NVARCHAR(50),
	full_name NVARCHAR(50),
	vehicle_type NVARCHAR(50),
	region NVARCHAR(50),
	record_date DATE
);
GO

IF OBJECT_ID('stg.delivery_events','U') IS NOT NULL
	DROP TABLE stg.delivery_events
GO

CREATE TABLE stg.delivery_events (
	event_id INT,
	order_id NVARCHAR(50),
	event_payload NVARCHAR(MAX)
);

IF OBJECT_ID('stg.orders','U') IS NOT NULL
	DROP TABLE stg.orders
GO

CREATE TABLE stg.orders (
	order_id NVARCHAR(50),
	cust_id NVARCHAR(50),
	order_date DATE,
	order_value FLOAT,
	shipping_city NVARCHAR(50)
);

IF OBJECT_ID('stg.support_tickets','U') IS NOT NULL
	DROP TABLE stg.support_tickets
GO

CREATE TABLE stg.support_tickets (
	ticket_id NVARCHAR(50),
	order_id NVARCHAR(50),
	issue_category NVARCHAR(50),
	resolution NVARCHAR(50)
);

