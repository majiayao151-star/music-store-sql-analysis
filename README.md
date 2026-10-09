# Music Store SQL Analysis

## Project Overview

This project uses PostgreSQL to analyze a digital music store database.  
The analysis covers revenue trends, customer value, country markets, music genres, and artist performance.

## Dataset

- Source: [SQL Music Store Analysis](https://github.com/rishabhnmishra/SQL_Music_Store_Analysis)
- Period: 2017–2020
- 11 relational tables
- 614 invoices
- 4,757 invoice line records

## Tools

- PostgreSQL
- pgAdmin
- SQL
- Git

## Analysis Topics

- Database structure and data validation
- Customer and invoice relationships
- Revenue calculation validation
- Monthly and yearly revenue trends
- Year-over-year growth
- Country market analysis
- Customer value analysis
- Genre sales analysis
- Artist sales analysis

## Key Insights

- Total revenue: 4,709.43
- Revenue increased by 6.47% in 2019 and decreased by 6.81% in 2020
- The top 10 customers contributed 23.71% of total revenue
- The USA was the highest-revenue market
- Rock generated 55.39% of total revenue
- The top three genres contributed 78.74% of total revenue
- Queen was the highest-revenue artist

## SQL Skills Demonstrated

- Multi-table `JOIN`
- `GROUP BY` and aggregate functions
- CTEs
- Date functions
- Window functions
- `LAG()` and `SUM() OVER()`
- Data-grain validation
- Duplicate-revenue prevention

## Project Structure

```text
sql/
├── 01_data_inventory.sql
├── 02_schema_exploration.sql
├── 03_customer_invoice_join.sql
├── 04_invoice_line_join.sql
├── 05_revenue_validation.sql
├── 06_monthly_revenue.sql
├── 07_yearly_growth.sql
├── 08_country_market_analysis.sql
├── 09_customer_value_analysis.sql
├── 10_genre_sales_analysis.sql
└── 11_artist_sales_analysis.sql
