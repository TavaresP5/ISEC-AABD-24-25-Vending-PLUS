# ISEC-AABD-24-25-VendingPLUS-Logistics-System

**Course:** Architecture and Administration of Databases
**Institution:** Coimbra Institute of Engineering (ISEC)
**Academic Year:** 2024/2025

## Project Overview

This project involves the analysis, design, and implementation of a relational database solution intended to optimize the operations of VendingPLUS, a company specializing in the placement and exploitation of vending machines in the Central region of Portugal. The primary objective is to build a robust server-side component capable of managing machines, sales, and the logistics associated with product replenishment.

The project follows a structured development approach, evolving through three distinct checkpoints:

1.  **Data Analysis:** Definition of requirements and modeling (Entity-Relationship and Physical models).
2.  **Data Querying:** Implementation of complex views for reporting and management support.
3.  **Procedural Logic and Administration:** Implementation of PL/SQL components (Procedures, Functions, Triggers) and physical storage optimization.

The documentation included in this repository focuses on the complete backend solution developed using Oracle Database.

## System Scope and Functionality

The system is designed to address the following core requirements:

### 1. Machine and Inventory Management
The system enables the detailed configuration of vending machines, including their geographical location and internal compartment layout.

* **Configuration:** Assignment of products to specific compartments with defined maximum capacities and prices.
* **State Monitoring:** Tracking of machine status (e.g., operational, offline, maintenance) based on periodic signals.
* **Sales Tracking:** Real-time recording of transactions via digital payment methods (Multibanco and MBWay).

### 2. Logistics and Fleet Management
The application manages the logistics network, including warehouses and a fleet of electric vehicles, to ensure efficient product distribution.

* **Route Optimization:** Planning of replenishment trips based on stock rupture priorities and geographical proximity.
* **Fleet Constraints:** Management of electric vehicle autonomy (limited to 300km) and capacity during replenishment routes.
* **Warehouse Management:** Control of stock levels at logistics hubs and calculation of restocking needs based on sales history.

### 3. Operational Automation
The system utilizes PL/SQL programming to automate critical business rules and ensure data integrity.

* **Automated Stock Updates:** Usage of triggers to instantly update inventory levels upon sales and modify machine status when empty.
* **Replenishment Logic:** Execution of stored procedures to generate restocking plans automatically, prioritizing machines with critical shortages.
* **Forecasting:** Algorithms to calculate necessary product orders for warehouses based on the previous weeks' consumption.

## Technical Documentation

This repository primarily contains the artifacts developed during the database design and implementation phases:

* **Conceptual Model:** The Entity-Relationship diagram (CDM) representing entities such as Machines, Products, Routes, and Warehouses.
* **Physical Model:** The Physical Data Model (PDM) tailored for the Oracle 11g environment, including data types and constraints.
* **Schema Scripts:** SQL scripts for the creation of tables, primary keys, and foreign keys.
* **PL/SQL Logic:** Source code for stored procedures, functions, and triggers responsible for the server-side business logic and exception handling.
* **Reporting Views:** SQL scripts defining views for operational analysis and Key Performance Indicators (KPIs).
* **Storage Analysis:** Documentation regarding the calculation of physical parameters and storage estimation for database tables.

## Authors

- André Tavares
- Guilherme Graça
- João Mesquita
