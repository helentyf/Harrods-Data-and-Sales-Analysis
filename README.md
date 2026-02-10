# Harrods Customer and Sales Analysis

This project generates synthetic luxury retail data and builds a Power BI dashboard for Harrods-style customer segmentation, revenue analysis, and at-risk customer identification. The data reflects realistic patterns for local versus tourist spend, London postcode geography, and segment-based behaviour.

# Main Aims

How does revenue and customer count vary by segment (VIP, High Potential, Regular, At Risk)?
What drives VIP and high-potential segments (key influencers)?
Which high-value customers are at risk, and how does tourist versus local spend compare?

# Tools Used

1. **Python** (pandas, numpy, Faker) - Synthetic data generation with configurable volume and date range
2. **Power BI** - Data model, DAX measures, and interactive dashboards (KPIs, maps, segment charts, time trend, key influencers, at-risk table)
3. **File formats:** CSV for raw data; PBIX for the report

# Project Summary

This project generates synthetic customer and transaction data and builds a Power BI report for segment and revenue analysis. The pipeline produces cleaned CSVs and a two-page dashboard that moves from performance overview to segment drivers and at-risk customers.

Key outputs:
- Customer and transaction CSVs with segment, postcode area, customer type, and CLV
- Two Power BI report pages with KPIs, maps, segment charts, time trend, key influencers, and an at-risk customer table
- Static PDF exports of each page in `03_Report_PDFs/`

# Power BI Dashboards

Power BI links:
- **Main link (sign-in required; full interactivity):** Sign in at [Power BI Service](https://app.powerbi.com), open **My workspace**, then open the Harrods report. Use the browser address bar URL for sharing.
- **Static view (no sign-in):** [Publish to web link](https://app.powerbi.com/view?r=eyJrIjoiODMwYTExNGUtYTQzOC00ZWIzLWJmYzctZjdkYzQ0N2QzY2UyIiwidCI6IjZjNmJhY2VhLTU2NDgtNDU1Yi1hMWFiLWU3MTZiNGY5ZTJhYiIsImMiOjEwfQ%3D%3D) — use for quick preview; some features require sign-in.

Dashboards included:
- **Harrods Sales Performance Dashboard (Page 1):** KPIs, revenue by postcode area, revenue by segment, customer segments, date filter, revenue over time.
- **Detailed Analysis and At-Risk Customers (Page 2):** Key influencers for segment, high-value at-risk table, tourist vs local spend.

Static PDF exports of each page are in `03_Report_PDFs/`.

# Data Sources

Generated data only (no external APIs required for the pipeline):

- **Customers** - Synthetic customers with segment, postcode area, customer type (Local/Tourist), nationality, age, generation, and CLV
- **Transactions** - Synthetic transactions with date, category, brand, amount, and link to customer

The generator uses London postcodes, tourist nationality weights, and event multipliers (e.g. Black Friday, Olympics) to shape revenue and visit patterns.

# Setup and Installation

Requirements: Python 3.8+ and dependencies (pandas, numpy, Faker).

```bash
pip install pandas numpy faker
```

## Running the Data Generator

The script writes to `01_Raw_Data/` relative to the current working directory. Run from the project root (Harrods_data_project).

**Option 1: Run from project root**
```bash
python 02_Data_Scripts/statistical_cstm_data_generator.py
```

**Option 2: On Windows**
Run `RUN_DATA_GENERATOR.bat` from the project root (it runs the script above).

## Power BI Report

Load `harrods_customers_realistic.csv` and `harrods_transactions_realistic.csv` from `01_Raw_Data/` into Power BI Desktop. Create a Calendar table and relationships (Transactions to Calendar on date; Transactions to Customers on customer_id). Date filtering uses a slicer on the Transactions table for reliable filtering.

# Project Structure

```
01_Raw_Data/            # Generated CSVs (customers, transactions)
02_Data_Scripts/        # Data generator script
03_Report_PDFs/         # Static PDF exports of dashboard pages
datasets/               # Reference data (excluded from repo; see .gitignore)
```

## Output Files

The pipeline generates:

- `01_Raw_Data/harrods_customers_realistic.csv`
- `01_Raw_Data/harrods_transactions_realistic.csv`
- Static PDF exports in `03_Report_PDFs/`

# Technical Notes

## Data quality and design:

- The generator introduces deliberate data quality issues (e.g. duplicates, missing values, outliers) for realistic cleaning and validation in Power BI.
- Tourist versus local logic: tourists have no UK postcode; locals are assigned London postcode areas with distance-based visit frequency.
- Revenue and CLV scales are set for a luxury segment; customer count is a subset suitable for analysis and demo use.
