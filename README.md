# risk_multivariable_model

# Multivariable Risk Analysis (fin_cars_1000)

This project implements a multivariable linear regression model to analyze how different financial and operational variables relate to a risk measure (`riesgo`) using the `fin_cars_1000.xlsx` dataset.

The workflow includes:
1. Data loading from Excel  
2. Data cleaning (removing duplicates and missing values)  
3. Exploratory multivariable analysis  
4. Estimation of a full linear regression model for `riesgo`  

---

## Dataset

The script uses the file:

- `fin_cars_1000.xlsx`

Key variables (columns) used in the model include:

- `riesgo` – dependent variable (risk score)
- `tasa_interes` – interest rate
- `morosidad` – delinquency
- `clientes` – number of clients
- `ingreso_promedio` – average income
- `plazo_meses` – loan term in months
- `monto_promedio` – average loan amount
- `costo_operativo` – operating cost

Make sure the Excel file is placed in the path specified in the script or update the path accordingly.

---

## Requirements

The script is written in R and uses the following packages:

- `readxl` – to read Excel files
- `dplyr` – for data manipulation
- `GGally` – for multivariable exploratory plots (`ggpairs`)

You can install them (if needed) directly from the script or manually with:

```r
install.packages("readxl")
install.packages("dplyr")
install.packages("GGally")
