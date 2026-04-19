# SQL
eDNA Metabarcoding: Knowledge Management Database
This repository contains a relational database schema (SQLite) designed to catalog and cross-reference the components of environmental DNA (eDNA) research. It maps the connections between molecular markers, specific bioinformatics tools, and the published papers that validate their use.

🗄️ Database Architecture
The database is built on a relational model to handle the "many-to-many" relationships typical in bioinformatics research:

Genetic Markers Table: Stores details on barcodes (COI, 12S, 16S, 18S, 28S, ITS, trnL), associated reference databases (BOLD, GenBank, SILVA), and taxonomic resolution.

Pipelines Table: Documents software frameworks (QIIME 2, OBITools, Mothur, Anacapa) and their specific strengths (e.g., plant metabarcoding vs. vertebrate detection).

Papers Table: A centralized bibliography of key research (e.g., Macher et al. 2023, Petit-Marty et al.) linked to the tools and markers they utilized.

Junction Tables: Implementation of relational logic to connect pipelines with the specific genetic markers they are optimized to process.

🛠 Tech Stack
Database: SQLite / SQL

Domain: eDNA Metabarcoding, Molecular Ecology

Key Concepts: Data Normalization, Foreign Key constraints, Relational Mapping

📂 Project Structure
SQLite_Schema.sql: The primary script to generate the database structure and define table relationships.

Data_Insertion.sql: Comprehensive INSERT statements containing curated data from recent literature (up to 2025).

🚀 Use Case
This tool allows researchers to quickly query which bioinformatic pipeline is most suitable for a specific genetic marker based on established literature. For example:

"Find all pipelines that have been successfully used with the 12S marker for fish biodiversity studies according to recent papers."

Suggested Repository Details:
Repository Name: eDNA-Metabarcoding-SQL-Database

Description: A relational database schema for mapping genetic markers, bioinformatics pipelines, and supporting literature in metabarcoding research.

How to make this repo "Pop":
Add a Diagram: Since this is a database project, users love seeing an ER Diagram (Entity-Relationship). If you have one, or even a simple drawing of how the tables connect, upload it and put it in the README.

Example Queries: Add a section called "Example Queries" in the README showing a basic SELECT statement that joins two tables. It proves your SQL skills are practical.
