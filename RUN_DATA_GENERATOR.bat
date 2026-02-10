@echo off
echo ========================================
echo Harrods Data Generator
echo ========================================
echo.
echo Running Python script to generate data files...
echo.

python "02_Data_Scripts\statistical_cstm_data_generator.py"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Data files generated.
    echo ========================================
    echo Check the 01_Raw_Data folder for:
    echo   - harrods_customers_realistic.csv
    echo   - harrods_transactions_realistic.csv
    echo.
) else (
    echo.
    echo ========================================
    echo ERROR: Python script failed to run
    echo ========================================
    echo.
    echo Possible issues:
    echo 1. Python is not installed
    echo    - Install from: https://www.python.org/downloads/
    echo    - Or from Microsoft Store
    echo.
    echo 2. Required packages missing
    echo    Run: pip install pandas numpy faker
    echo.
    echo 3. Script path incorrect
    echo    Make sure you're in the project root directory
    echo.
    pause
)
