#E-commerce Sales Prediction

An end-to-end machine learning project for e-commerce sales analysis, future revenue prediction, and customer purchase prediction using SQL and Python.

Project Overview

The goal of this project is to use historical customer purchasing behavior to:

- Predict a customer's future revenue using Regression.
- Predict whether a customer will make a future purchase using Classification.

The project follows a complete workflow from data exploration and cleaning to SQL database design, feature engineering, machine learning, evaluation, and visualization.

##Technologies

- Python
- SQL Server
- Pandas
- NumPy
- Scikit-learn
- XGBoost
- Matplotlib
- SQLAlchemy
- Git & GitHub
- Jupyter Notebook

##Project Structure

ecommerce-sales-prediction/
│
├── data/
│
├── notebooks/
│   ├── 01_data_exploration.ipynb
│   ├── 02_sql_database.ipynb
│   └── 03_modeling.ipynb
│
├── sql/
│   ├── database_schema.sql
│   └── feature_engineering.sql
│
└── README.md

##Workflow

1. Data Exploration

The dataset was explored and analyzed to understand its structure, distributions, missing values, duplicates, and data quality issues.

2. Data Cleaning

The data was cleaned by handling missing values, removing duplicates, filtering invalid transactions and cancellations, and creating the "Revenue" feature.

3. SQL Database

The cleaned data was stored in a SQL Server database using a relational schema consisting of:

- "Customers"
- "Products"
- "Invoices"
- "InvoiceItems"

Primary keys and foreign key relationships were used to maintain data integrity.

4. Feature Engineering

Customer-level features were created using SQL and CTEs based on multiple cutoff dates.

The main features include:

- "TotalRevenue"
- "NumberOfOrders"
- "TotalQuantity"
- "AverageOrderValue"
- "AverageQuantityPerOrder"
- "Recency"
- "CustomerLifetimeDays"

"FutureRevenue" was created as the regression target, while future purchase activity was used to create the classification target.

5. Machine Learning

Both regression and classification approaches were evaluated.

Regression

The following models were tested:

- Linear Regression
- Random Forest Regressor
- XGBoost Regressor

Linear Regression was selected as the final regression model.

Classification

The following models were tested:

- Logistic Regression
- Random Forest Classifier

Logistic Regression was selected as the final classification model.

Model Evaluation

Regression

The final Linear Regression model achieved:

- MAE: 248.12
- RMSE: 926.60
- R²: 0.59

Classification

The final Logistic Regression model achieved:

- Accuracy: ~0.69
- F1-score: ~0.51
- ROC-AUC: ~0.72

Because the classification target is imbalanced, metrics such as Precision, Recall, F1-score, and ROC-AUC were considered in addition to accuracy.

##Visualizations

The project includes several visualizations for model evaluation and interpretation, including:

- Feature Importance
- Actual vs. Predicted values
- Residual Plot
- Confusion Matrix
- ROC Curve
- Target Distribution

##Key Findings

The analysis showed that historical customer purchasing behavior provides useful information for predicting future sales and purchase activity.

For the regression model, "TotalRevenue" had the strongest coefficient, while "AverageOrderValue" and "AverageQuantityPerOrder" also showed strong influence.

For the classification model, "NumberOfOrders" was the strongest feature according to the Logistic Regression coefficients.

##How to Run

1. Clone the repository

git clone <repository-url>
cd ecommerce-sales-prediction

2. Install dependencies

pip install -r requirements.txt

3. Set up SQL Server

Create a SQL Server database named:

SalesPredictionDB

Run the SQL scripts in the following order:

sql/database_schema.sql
sql/feature_engineering.sql

4. Configure the SQL connection

Update the SQL Server connection settings in the notebooks according to your local SQL Server configuration.

5. Run the notebooks

Run the notebooks in order:

01_data_exploration.ipynb
        ↓
02_sql_database.ipynb
        ↓
03_modeling.ipynb

##Project Status

Completed — final version.